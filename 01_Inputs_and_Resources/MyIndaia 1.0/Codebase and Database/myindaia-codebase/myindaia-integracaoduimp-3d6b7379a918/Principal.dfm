object Form1: TForm1
  Left = 20
  Top = 20
  Caption = 'Transmiss'#227'o de DUIMP'
  ClientHeight = 685
  ClientWidth = 1370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 50
    Width = 1370
    Height = 635
    ActivePage = tbsEnvio
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -12
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    object tbsEnvio: TTabSheet
      ImageIndex = 3
      object Panel17: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 65
        Align = alTop
        TabOrder = 0
        DesignSize = (
          1362
          65)
        object Label17: TLabel
          Left = 30
          Top = 13
          Width = 115
          Height = 17
          Caption = 'N'#250'mero Processo: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = cl3DDkShadow
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 302
          Top = 13
          Width = 101
          Height = 17
          Caption = 'N'#250'mero Duimp: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = cl3DDkShadow
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object btnEnviarDuimpBroker: TBitBtn
          Left = 27
          Top = 49
          Width = 140
          Height = 43
          Caption = 'Enviar Duimp'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = False
        end
        object BitBtn3: TBitBtn
          Left = 319
          Top = 49
          Width = 140
          Height = 43
          Caption = 'Diagn'#243'stico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = False
          OnClick = btnDiagnosticoDuimpClick
        end
        object btnRegistrarDuimpUsuario: TBitBtn
          Left = 465
          Top = 49
          Width = 140
          Height = 43
          Caption = 'Registrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
          OnClick = btnRegistrarDuimpUsuarioClick
        end
        object btnEnviarDuimpItem: TBitBtn
          Left = 173
          Top = 49
          Width = 140
          Height = 43
          Caption = 'Enviar Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = False
          OnClick = btnEnviarDuimpItemClick
        end
        object btnAvancado: TBitBtn
          Left = 611
          Top = 46
          Width = 69
          Height = 34
          Anchors = [akTop, akRight]
          Caption = 'Avan'#231'ado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ModalResult = 1
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 4
          Visible = False
          OnClick = btnAvancadoClick
        end
        object edtNrProcessoBroker: TEdit
          Left = 151
          Top = 12
          Width = 121
          Height = 20
          TabStop = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object edtNrDuimpBroker: TEdit
          Left = 411
          Top = 12
          Width = 121
          Height = 20
          TabStop = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object Panel19: TPanel
          Left = 632
          Top = 5
          Width = 585
          Height = 49
          BevelOuter = bvNone
          TabOrder = 7
          object lblStatus: TLabel
            Left = 78
            Top = 18
            Width = 38
            Height = 17
            Caption = 'Status'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = cl3DDkShadow
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            Visible = False
          end
          object pnlConexaoAntiga: TPanel
            Left = 392
            Top = 0
            Width = 193
            Height = 49
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object chkConexaoAntiga: TCheckBox
              Left = 70
              Top = 27
              Width = 105
              Height = 17
              Caption = 'Conex'#227'o Antiga'
              TabOrder = 0
            end
          end
        end
        object Button1: TButton
          Left = 465
          Top = 34
          Width = 75
          Height = 25
          Caption = 'Button1'
          TabOrder = 8
          Visible = False
          OnClick = Button1Click
        end
        object btnConsultarNotificacao: TPanel
          Left = 550
          Top = 8
          Width = 142
          Height = 32
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          Caption = 'Atualizar Notifica'#231#245'es'
          Color = clGrayText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnConsultarNotificacaoClick
        end
      end
      object Panel20: TPanel
        Left = 0
        Top = 65
        Width = 1362
        Height = 540
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel21: TPanel
          Left = 0
          Top = 0
          Width = 222
          Height = 540
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 85
            Top = 88
            Width = 35
            Height = 21
            Caption = 'Capa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = cl3DDkShadow
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 86
            Top = 137
            Width = 33
            Height = 21
            Caption = 'Itens'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = cl3DDkShadow
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblVersao: TLabel
            Left = 0
            Top = 528
            Width = 47
            Height = 13
            Caption = 'lblVersao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = cl3DDkShadow
            Font.Height = -11
            Font.Name = 'Segoe UI Semibold'
            Font.Style = []
            ParentFont = False
          end
          object btnEnviarDuimpLateral: TPanel
            Left = 16
            Top = 25
            Width = 95
            Height = 41
            Cursor = crHandPoint
            Caption = 'Enviar Duimp'
            Color = 16744192
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlightText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            OnClick = btnEnviarDuimpLateralClick
          end
          object btnDiagnosticarDuimpLateral: TPanel
            Left = 16
            Top = 184
            Width = 95
            Height = 41
            Cursor = crHandPoint
            Caption = 'Diagnosticar'
            Color = 16744192
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlightText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            OnClick = btnDiagnosticarDuimpLateralClick
          end
          object btnRegistrarDuimpLateral: TPanel
            Left = 16
            Top = 248
            Width = 95
            Height = 41
            Cursor = crHandPoint
            Caption = 'Registrar'
            Color = 16744192
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlightText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 2
            OnClick = btnRegistrarDuimpLateralClick
          end
          object Panel23: TPanel
            Left = 125
            Top = 0
            Width = 70
            Height = 305
            BevelOuter = bvNone
            TabOrder = 3
            DesignSize = (
              70
              305)
            object Shape1: TShape
              Left = 20
              Top = 64
              Width = 2
              Height = 26
              Brush.Color = clGray
              Pen.Color = clMedGray
              Pen.Width = 2
              Visible = False
            end
            object Shape2: TShape
              Left = 20
              Top = 114
              Width = 2
              Height = 26
              Pen.Color = clMedGray
              Pen.Width = 2
              Visible = False
            end
            object imgStsDuimpItens: TImage
              Left = 9
              Top = 139
              Width = 25
              Height = 25
              Anchors = [akLeft, akTop, akRight]
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
                000000180806000000E0773DF8000000097048597300000EC300000EC301C76F
                A8640000001974455874536F667477617265007777772E696E6B73636170652E
                6F72679BEE3C1A00000204494441544889B596B16B13511CC73FBF7741301733
                75D1B418B560EB681D7342C66AB53A89E8E4AAE2EA66FF0647119CBADB3656B7
                52533B294ED245ADD0120B82D8C68BA277EFE790A41C31C93D0FFB9DDEFDEECB
                F7FBBD07F7BE4F1882D62A63B1C7AC2817813230D679B5056C2A3CF32216F255
                B6076948BF61B8C631AB3C10B805E48685002C302FC27DBF4223D520AC734961
                1E389222DC8B3D811B7E402D3934C987E64BEE2A3CCD200E50545868D6B99D1C
                EE7F41B8C6B42A4B8097413C092B70C50F58DA3768AD53B2311B644BDE0F7BA2
                4CF8E7F96C0062CB9C8378D37A4CAAE50CD04CE116AD300720AD15466D8E4FA4
                6FCD9B42C03980EF755E035329FCC878944DEC71D5411C4007AC072117C7CC1A
                11A61DC89920C205038C1F9401CAB811387A50FA0225A36EFB99090AD6C0DFE7
                C7803823AA18550CC288A3472387F201E1B4439C72F88A95EEDAD1E0BD5161D9
                910CCA2F2C879DE9CA72F747DB24ED5816DE162A9CD5771C0ABFF20528A6E847
                221C37F92ADB0A4F1CD2977ED639F9E31B5340DE21FD63BF4243A05D30AA6C38
                A47283B0CB6F260A55760C40A789AE01F17F90B7A2DC2C54D98144E114025E28
                DCA35D815911AB7227D96AFD2A73A65399FFB65DC2AEC075BFC2F3E4D8F4F2FC
                809A8D38053C042207E948E19158267BC5DBBE43D05AA714475C16984138219D
                6B8BC216C247811AB0D8EF36D1C51FC793A872941E6D020000000049454E44AE
                426082}
            end
            object imgStsDuimpDiagnosticar: TImage
              Left = 5
              Top = 193
              Width = 32
              Height = 32
              Anchors = [akLeft, akTop, akRight]
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
                000000200806000000737A7AF4000000097048597300000EC300000EC301C76F
                A8640000001974455874536F667477617265007777772E696E6B73636170652E
                6F72679BEE3C1A000002B5494441545885CD97CD4B545118C67FEFF18E3A3377
                2C24A91689BA13828C4224A7867123CC1444BB90E87F68231418F44910FE0F06
                6E82A28DD32A07FBB0883E107455284C106A41E57C383A76DF1636328CA673AF
                0ED3B33AF79EF3BCBFE79EFB71CE152AD4B79784FCCA5985A8285D086DC0FEBF
                DD3F8139852994F1BC61AC254CBA92BAB2D3804C9243E2634895CB40A0C2BC39
                1146B4C00D3BCABCA7009AA021D3C455A35C51B02B049717CF38C2B0BDC41D89
                B1527180A524078C8F472867BC80CBA5CA6BF9CD85AD66635380F42B8E8AC318
                D0BA17F012A5D4100FF532FDCF0099371CA4C0DB2AC03742E0A3DBEE61A178C2
                141B3A433D6B3CAC221CA0550B3CD6040D9B02647E706DAFEEF976123895B5B9
                5E72BCFEAA61F11908BAA8F5C1389C973AE4373C4139EEC2BB6A4167E369660D
                80F818720947612410E18B3F4C0A65C48D17A82FC02080594C62A35C72590003
                F9625B60D9AD5F606031896D0216E7BC7E6876A9A0DF47CC28446B005F97D267
                44E9AA5900386610DA6B4517E8304053AD0200FBCCCE63AA2B032C79313A606D
                D576A95F0698F5E21421A6492C7D874F94B8971A0AB396C29440B707773C6B91
                6219100E7B09004C1994718F66803594FA5DF89F99BC610CC8BAB62A23C1306D
                C100ADC07BB776818C9D23615AC2A44578E09A6F4888E0C8497208CFDDFA1D18
                957EB21BCBB1587C72B9264C8872D131348BF21438E2C2BB52E7D0E98F306700
                EC28F38E30ECA200404485AFA24CBB84A370DF1F610E4A76447623B7BC4CA55B
                294CDA696E168FFF9F4D2980DDC3821AE240AA1A701562A5F04D010042BD4C3B
                6B9C0026F68AAC30898FEE509899F2BE2D17A3A628DF8369FA51EE02ABBB60AF
                28DCB69B89965F79513BFE9CE65FD051804181012ADCB80A641C18B51CEE159F
                F66DC656A6C524B6DF470CA54FA00B68A7FCF75CF988306EE748487F655FD73F
                EDB3DA9119C4F1510000000049454E44AE426082}
            end
            object imgStsDuimpRegistrar: TImage
              Left = 5
              Top = 255
              Width = 32
              Height = 32
              Anchors = [akLeft, akTop, akRight]
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
                000000200806000000737A7AF4000000097048597300000EC300000EC301C76F
                A8640000001974455874536F667477617265007777772E696E6B73636170652E
                6F72679BEE3C1A000003A8494441545885BD974F685C5514C67FE7CE9F769249
                53118B4D11DA9A2808256EAC8854788B84C94CC6C40859B8706FBBB168288836
                5A295402065C94AEBB5018A8C998643224D059042CAD9B66158A69E2426D8B20
                89539A38C3BCCF455F424C1A33EACC7CCBF70EF7FBDD7BEE9F738C2A95CD665B
                C2E170DA39E749EA048E020783DF2BC04FC06D332B944AA5C9BEBEBE6235E3DA
                5E01F97CFEB0EFFBE7817781FDC04D60CECC9680DF017CDF7F1A386E66A78093
                C03A70D53977219148DCFB4F00854261FFDADADAC7C0FBC0034923C0782A95BA
                5F0570BFA421333B2469B4A9A9E9A2E779EB550304838C011D66F659B158BC32
                383858FA27E3EDCA6432D1783C7E1A380FDC71CE0D3C69357600E4F3F94EDFF7
                A78015DFF7DFECEDED5DFA37C6DB95CBE59E07BE030E484AA752A9DBBB020433
                FF41D28299BD9D4C26FFF83FE65B200E00DF02279C73AF271289C51D0041CE0B
                406B241279ADABAB6BB516E61BCA66B32D9148E47B804AA5F26A3A9D7E04E036
                02820DF782EFFBBDB53607088E653F7024140A0D6F7C37D85CFA1FCDECA39E9E
                9EAF6A6DBE55D3D3D367257DE19C7B2991482C3A80E09C3F28168B57EA690E20
                E9B2A49F259D03B02037F7257D904AA5EA0E00303D3D7D5AD248B95C7ED685C3
                E1348F6FB8F14698038442A17120168D4653CE39E70137F7BAE16AA9EEEEEE5F
                815B923C173C2C738D32DFA239A0D301C7CCEC6EA3DDCD6C1138EE8056DFF757
                1A0D20690538E0F68CACB31CB0EA9C3BB867648D25E92960352C6949527BA301
                CCAC1D587666361F54320D95A453C0BC33B30270329FCF1F6E94F9CCCC4C9B99
                BD025C77A552691258F77DBFBF5100E572F92DE0512C169B72C1337955D25026
                9389D6DB3C97CBED33B30FCDEC1BCFF31E3A00E7DC05333BD4DCDCFC5EBD0124
                9D01DA245D82A020492412F7248D9AD97050C3D5451313131D66F609309A4C26
                EF6E02003435355D04EE489A9C9D9D6DADB579369B6D09854263C002B059116D
                02789EB7EE9C1B30B378B95CBE16149235D1ECEC6C6B241219035A250D2493C9
                3F7700C0662AD2C009E0462DD2313131D1512E976F002F9A596AFBB3BF5B63D2
                EEFBFE35E03933FB5CD2E5ADD4D52897CBED937426C8F982A48127D51CBBB666
                994C26168FC73F05CE02BF98D94828141A0F8A895D353333D356A954FA250D01
                47802F81E1DD26504D73DA2EE99CA4778018708BC7CDE932F05B10F68CA46392
                DE086EB83533FB5AD2A58DDDBE9BF604D850369B6D8946A329499EA497CDEC28
                7F6FCF978179E07A2C169BF23CEF6135E3FE05A394A422D52AEB480000000049
                454E44AE426082}
            end
            object imgStsDuimpPrincipal: TImage
              Left = 5
              Top = 32
              Width = 32
              Height = 32
              Anchors = [akLeft, akTop, akRight]
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
                000000200806000000737A7AF4000000097048597300000EC300000EC301C76F
                A8640000001974455874536F667477617265007777772E696E6B73636170652E
                6F72679BEE3C1A000003A8494441545885BD974F685C5514C67FE7CE9F769249
                53118B4D11DA9A2808256EAC8854788B84C94CC6C40859B8706FBBB168288836
                5A295402065C94AEBB5018A8C998643224D059042CAD9B66158A69E2426D8B20
                89539A38C3BCCF455F424C1A33EACC7CCBF70EF7FBDD7BEE9F738C2A95CD665B
                C2E170DA39E749EA048E020783DF2BC04FC06D332B944AA5C9BEBEBE6235E3DA
                5E01F97CFEB0EFFBE7817781FDC04D60CECC9680DF017CDF7F1A386E66A78093
                C03A70D53977219148DCFB4F00854261FFDADADAC7C0FBC0034923C0782A95BA
                5F0570BFA421333B2469B4A9A9E9A2E779EB550304838C011D66F659B158BC32
                383858FA27E3EDCA6432D1783C7E1A380FDC71CE0D3C69357600E4F3F94EDFF7
                A78015DFF7DFECEDED5DFA37C6DB95CBE59E07BE030E484AA752A9DBBB020433
                FF41D28299BD9D4C26FFF83FE65B200E00DF02279C73AF271289C51D0041CE0B
                406B241279ADABAB6BB516E61BCA66B32D9148E47B804AA5F26A3A9D7E04E036
                02820DF782EFFBBDB53607088E653F7024140A0D6F7C37D85CFA1FCDECA39E9E
                9EAF6A6DBE55D3D3D367257DE19C7B2991482C3A80E09C3F28168B57EA690E20
                E9B2A49F259D03B02037F7257D904AA5EA0E00303D3D7D5AD248B95C7ED685C3
                E1348F6FB8F14698038442A17120168D4653CE39E70137F7BAE16AA9EEEEEE5F
                815B923C173C2C738D32DFA239A0D301C7CCEC6EA3DDCD6C1138EE8056DFF757
                1A0D20690538E0F68CACB31CB0EA9C3BB867648D25E92960352C6949527BA301
                CCAC1D587666361F54320D95A453C0BC33B30270329FCF1F6E94F9CCCC4C9B99
                BD025C77A552691258F77DBFBF5100E572F92DE0512C169B72C1337955D25026
                9389D6DB3C97CBED33B30FCDEC1BCFF31E3A00E7DC05333BD4DCDCFC5EBD0124
                9D01DA245D82A020492412F7248D9AD97050C3D5451313131D66F609309A4C26
                EF6E02003435355D04EE489A9C9D9D6DADB579369B6D09854263C002B059116D
                02789EB7EE9C1B30B378B95CBE16149235D1ECEC6C6B241219035A250D2493C9
                3F7700C0662AD2C009E0462DD2313131D1512E976F002F9A596AFBB3BF5B63D2
                EEFBFE35E03933FB5CD2E5ADD4D52897CBED937426C8F982A48127D51CBBB666
                994C26168FC73F05CE02BF98D94828141A0F8A895D353333D356A954FA250D01
                47802F81E1DD26504D73DA2EE99CA4778018708BC7CDE932F05B10F68CA46392
                DE086EB83533FB5AD2A58DDDBE9BF604D850369B6D8946A329499EA497CDEC28
                7F6FCF978179E07A2C169BF23CEF6135E3FE05A394A422D52AEB480000000049
                454E44AE426082}
            end
            object imgStsDuimpCapa: TImage
              Left = 9
              Top = 90
              Width = 24
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
                000000180806000000E0773DF80000000970485973000000B1000000B101C62D
                498D0000001974455874536F667477617265007777772E696E6B73636170652E
                6F72679BEE3C1A000003064944415448899D955F8854551CC73FBF7367EECC38
                939A2D6BAB2D25B2A669FA602F262A98BE48224141A28313C228D53E64D0A3D9
                735049413AB0EE3FC468A312D9A064A552DF0205D9D575141FC27457C7769D66
                7666D67B7EBD34CBE4CC9DBDEBF7E99CF3FB9DCFF7770EF7778F308B92779371
                FDC7D92E4697A32C0540B8AD566E4AC23BDBFF6C7FA1D97EF105DFD8BF06F18E
                08EC00623E6953A0836239D2DBD13B1CC8A033DB1999340F3F0749034EB3EA6A
                E4091C2B960A8706560F547C0D768FA65BC2A1CA8FC0C680E0C7AB3DAF15FB46
                DFAABE5C75CD5407E93FD2E1B053F9EE49E1000A9B70CDE9CE6C67A4CEA0F474
                F928C2962785D768E3A493FFB43A1180D4CDD4CB162E11FCCE0158E82C64C29B
                6814F2C4EABADE8EDE610360D1C37385AF8FAFE78BE73FE3FDC5EF1192D0E361
                47C51C06306F0DBF9B00797D2EF0B889B3AF258920AC89AD262291FA24D19DC9
                BBC9B889B953AF01D1B918EC6DD9C302670100A772DF50B00D7B2D46D1D96A10
                5D3117F8BA796B7935B1018091A9ABFC9E3FDF245B5718156D0B0A8F9918A996
                7D0094B54CF7FD1E14F5CD37D6B419417C3356465FE460EB01124E0280DDCFBC
                CDA2D02200BECD0D303E3DDEB420C56A4844EEA8D67BCC77E6F361DB215C7179
                CE5DCAE0C44F6C7E6A1300A3A5EB0C3D3C37CB7901913B463DB28D62792FCFE5
                E26500DADD760EB61E40102A5AA1EBDE89A657337302216BA2F1F059A0587F3C
                E5EBB1E35CC85FFCDFFAF70F7E606C7A6CF6EAA1188BBA4326B3245314186C94
                61B174DD3B31F3A55C2B8DF2F3E42F41E0209CF98F0DA95BA995D6EA15A86FC9
                AA16875BB9FF2887A75E10BCE759597BB2A37BC400F42CEBB926C8F1663BC6A6
                C783C201BE3AD9D13D02357FD3C8DFEE072AFC1A94E02FBD30552A7C549DCD18
                645EC94C4BD9BE29D0AC356761F35BD80DEDAA7DD54C6DBC6F555FAE582A6C43
                F812087C1FA08F80A3D109777B577BD783DA88EFA3BF27FBCE4B8EF031A23BF1
                7FF48B0867D4789FF4BFD07FB55182AF4155E9BFD2F3CAA5F236D42CB7D87600
                83F9D38ADE8845DDA1CC924C5D0FD5EA5F50AA11AA7386503F0000000049454E
                44AE426082}
              Stretch = True
            end
            object Shape3: TShape
              Left = 20
              Top = 163
              Width = 2
              Height = 30
              Pen.Color = clMedGray
              Pen.Width = 2
              Visible = False
            end
            object Shape4: TShape
              Left = 20
              Top = 225
              Width = 2
              Height = 30
              Pen.Color = clMedGray
              Pen.Width = 2
              Visible = False
            end
            object imgExcluirItens: TImage
              Left = 46
              Top = 144
              Width = 16
              Height = 16
              Cursor = crHandPoint
              Anchors = [akLeft, akTop, akRight]
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
                0000001008060000001FF3FF61000000097048597300000EC300000EC301C76F
                A8640000001974455874536F667477617265007777772E696E6B73636170652E
                6F72679BEE3C1A0000014449444154388DED92B14BC34014C6BF77970421B520
                52473737C1A5D8B520D4F807748C8D9B8820383AB8B989A0E2D24951DC7510D1
                C15270F044A16047415C1DC496509B367D0E3690A6D180B3DFF2EE7DF7BDDFBB
                E10821DD3B561EA06D667E0F3C221A63A6F5D9A38B2A62440050B30B66C3D70D
                43F70F20C58EF749CF416044EB4EB1106B6D4FACA665C79B39BE720700CA992F
                03344940236E43580CA41978C91D5E2E079E46A01C196FD96CF9A19304A8178B
                866B3655D8D37A8C3DF232AFAA643D25015C6A4E837863E84239D64D70BEB50B
                1371359A0B24C2CDE3D242469762170074294E0140D7C4FEDDE2DCF84FAF1A00
                78D2130053BF9500400CD2A5218626E3007FD13F20026875FD0F06CE01801927
                DF95CE465309DF5C3956A56617CCDF32F5957C4A395625EA6B0040E86DB53571
                AD4A963B34D997DB82498237A3FE17A80E6600DDC030680000000049454E44AE
                426082}
              Visible = False
              OnClick = imgExcluirItensClick
            end
            object imgExcluirCapa: TImage
              Left = 46
              Top = 95
              Width = 16
              Height = 16
              Cursor = crHandPoint
              Anchors = [akLeft, akTop, akRight]
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
                0000001008060000001FF3FF61000000097048597300000EC300000EC301C76F
                A8640000001974455874536F667477617265007777772E696E6B73636170652E
                6F72679BEE3C1A0000014449444154388DED92B14BC34014C6BF77970421B520
                52473737C1A5D8B520D4F807748C8D9B8820383AB8B989A0E2D24951DC7510D1
                C15270F044A16047415C1DC496509B367D0E3690A6D180B3DFF2EE7DF7BDDFBB
                E10821DD3B561EA06D667E0F3C221A63A6F5D9A38B2A62440050B30B66C3D70D
                43F70F20C58EF749CF416044EB4EB1106B6D4FACA665C79B39BE720700CA992F
                03344940236E43580CA41978C91D5E2E079E46A01C196FD96CF9A19304A8178B
                866B3655D8D37A8C3DF232AFAA643D25015C6A4E837863E84239D64D70BEB50B
                1371359A0B24C2CDE3D242469762170074294E0140D7C4FEDDE2DCF84FAF1A00
                78D2130053BF9500400CD2A5218626E3007FD13F20026875FD0F06CE01801927
                DF95CE465309DF5C3956A56617CCDF32F5957C4A395625EA6B0040E86DB53571
                AD4A963B34D997DB82498237A3FE17A80E6600DDC030680000000049454E44AE
                426082}
              Visible = False
              OnClick = imgExcluirCapaClick
            end
          end
          object btnEnviarDuimpTeste: TPanel
            Left = 16
            Top = 128
            Width = 77
            Height = 41
            Cursor = crHandPoint
            Caption = 'Enviar Item'
            Color = 16744192
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlightText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 4
            Visible = False
            OnClick = btnEnviarDuimpTesteClick
          end
        end
        object Panel22: TPanel
          Left = 222
          Top = 0
          Width = 1140
          Height = 540
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object pnlLog: TPanel
            Left = 0
            Top = 400
            Width = 1140
            Height = 140
            Align = alBottom
            TabOrder = 0
            Visible = False
            object txtLogBroker: TRichEdit
              Left = 1
              Top = 1
              Width = 1138
              Height = 138
              Align = alClient
              Font.Charset = ANSI_CHARSET
              Font.Color = cl3DDkShadow
              Font.Height = -12
              Font.Name = 'Segoe UI Semibold'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 0
              Zoom = 100
            end
          end
          object Panel18: TPanel
            Left = 0
            Top = 176
            Width = 1140
            Height = 224
            Align = alBottom
            TabOrder = 1
            object Splitter2: TSplitter
              Left = 793
              Top = 1
              Height = 222
              ExplicitLeft = 9
              ExplicitTop = 2
              ExplicitHeight = 119
            end
            object grdDiagnosticoRegistro: TDBGrid
              Left = 1
              Top = 1
              Width = 792
              Height = 222
              Align = alLeft
              DataSource = dtsDuimpPush
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = cl3DDkShadow
              TitleFont.Height = -12
              TitleFont.Name = 'Segoe UI Semibold'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'dataEvento'
                  Title.Caption = 'Data Evento'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'evento'
                  Title.Caption = 'Evento'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'message'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'situacaoDuimp'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'situacao'
                  Visible = True
                end>
            end
            object DBGrid2: TDBGrid
              Left = 796
              Top = 1
              Width = 343
              Height = 222
              Align = alClient
              DataSource = dtsDuimpPushDetalhe
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = cl3DDkShadow
              TitleFont.Height = -12
              TitleFont.Name = 'Segoe UI Semibold'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DuimpPushId'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'item'
                  Title.Caption = 'Item'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'tipo'
                  Title.Caption = 'Tipo'
                  Width = 250
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'textoMensagem'
                  Title.Caption = 'Texto Mensagem'
                  Visible = True
                end>
            end
          end
          object Panel16: TPanel
            Left = 0
            Top = 0
            Width = 1140
            Height = 176
            Align = alClient
            TabOrder = 2
            object pnlLogUsuario: TPanel
              Left = 1
              Top = 1
              Width = 1138
              Height = 174
              Align = alClient
              TabOrder = 0
              object txtLogUsuario: TRichEdit
                Left = 1
                Top = 1
                Width = 1136
                Height = 172
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = cl3DDkShadow
                Font.Height = -12
                Font.Name = 'Segoe UI Semibold'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                ScrollBars = ssVertical
                TabOrder = 0
                Zoom = 100
              end
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '               Pesquisa               '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = cl3DDkShadow
      Font.Height = -11
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ImageIndex = 3
      ParentFont = False
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 605
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 1362
          Height = 605
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Panel11: TPanel
            Left = 0
            Top = 65
            Width = 1362
            Height = 200
            Align = alTop
            BevelOuter = bvNone
            Padding.Left = 10
            Padding.Top = 10
            Padding.Right = 10
            Padding.Bottom = 10
            TabOrder = 0
            object DBGrid1: TDBGrid
              Left = 10
              Top = 10
              Width = 1342
              Height = 180
              Align = alClient
              DataSource = dtsProcesso
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = cl3DDkShadow
              TitleFont.Height = -11
              TitleFont.Name = 'Segoe UI Semibold'
              TitleFont.Style = []
              OnKeyUp = DBGrid1KeyUp
              OnMouseUp = DBGrid1MouseUp
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Area'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NrProcesso'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CodEmpresa'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NomeEmpresa'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CNPJCliente'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'qtdItens'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CodDuimp'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DataDesembaraco'
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LocalDesembarque'
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CE'
                  Visible = True
                end>
            end
          end
          object Panel14: TPanel
            Left = 0
            Top = 0
            Width = 1362
            Height = 65
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label7: TLabel
              Left = 19
              Top = 7
              Width = 57
              Height = 17
              Caption = 'Processo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = cl3DDkShadow
              Font.Height = -13
              Font.Name = 'Segoe UI Semibold'
              Font.Style = []
              ParentFont = False
            end
            object lblGrupo: TLabel
              Left = 254
              Top = 8
              Width = 82
              Height = 17
              Caption = 'Nome Grupo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = cl3DDkShadow
              Font.Height = -13
              Font.Name = 'Segoe UI Semibold'
              Font.Style = []
              ParentFont = False
            end
            object Label11: TLabel
              Left = 226
              Top = 31
              Width = 19
              Height = 17
              Caption = 'OU'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = cl3DDkShadow
              Font.Height = -13
              Font.Name = 'Segoe UI Semibold'
              Font.Style = []
              ParentFont = False
            end
            object edtProcesso: TEdit
              Left = 19
              Top = 26
              Width = 200
              Height = 25
              Font.Charset = DEFAULT_CHARSET
              Font.Color = cl3DDkShadow
              Font.Height = -13
              Font.Name = 'Segoe UI Semibold'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtGrupo: TEdit
              Left = 254
              Top = 27
              Width = 200
              Height = 25
              Font.Charset = DEFAULT_CHARSET
              Font.Color = cl3DDkShadow
              Font.Height = -13
              Font.Name = 'Segoe UI Semibold'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object btnPreencherDados: TBitBtn
              Left = 832
              Top = 13
              Width = 79
              Height = 43
              Caption = 'Usar Informa'#231'oes do processo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowFrame
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Visible = False
              OnClick = btnPreencherDadosClick
            end
            object btnPesquisar: TBitBtn
              Left = 470
              Top = 19
              Width = 131
              Height = 35
              Cursor = crHandPoint
              Caption = 'Pesquisar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowFrame
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnClick = btnPesquisarClick
            end
            object btnAbrir: TBitBtn
              Left = 613
              Top = 19
              Width = 131
              Height = 35
              Cursor = crHandPoint
              Caption = 'Abrir'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowFrame
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              Visible = False
              OnClick = btnAbrirClick
            end
          end
        end
      end
    end
    object tbsDuimp: TTabSheet
      Caption = '               Duimp               '
      ImageIndex = 4
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 1362
        Height = 605
        ActivePage = tbsLog
        Align = alClient
        TabOrder = 0
        object tbsTransmissao: TTabSheet
          Caption = '               Transmiss'#227'o               '
          object TPanel
            Left = 0
            Top = 0
            Width = 1354
            Height = 575
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Panel13: TPanel
              Left = 0
              Top = 0
              Width = 1354
              Height = 51
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                1354
                51)
              object Label13: TLabel
                Left = 16
                Top = 5
                Width = 115
                Height = 17
                Caption = 'N'#250'mero Processo: '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = cl3DDkShadow
                Font.Height = -13
                Font.Name = 'Segoe UI Semibold'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label14: TLabel
                Left = 16
                Top = 31
                Width = 101
                Height = 17
                Caption = 'N'#250'mero Duimp: '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = cl3DDkShadow
                Font.Height = -13
                Font.Name = 'Segoe UI Semibold'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object btnVoltar: TBitBtn
                Left = 1000
                Top = 6
                Width = 318
                Height = 35
                Anchors = [akLeft, akTop, akRight]
                Caption = 'Voltar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = btnVoltarClick
              end
              object lblNrProcesso: TEdit
                Left = 137
                Top = 4
                Width = 121
                Height = 20
                TabStop = False
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clHotLight
                Font.Height = -13
                Font.Name = 'Segoe UI Semibold'
                Font.Style = []
                ParentColor = True
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object lblNrDuimp: TEdit
                Left = 137
                Top = 30
                Width = 121
                Height = 20
                TabStop = False
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clHotLight
                Font.Height = -13
                Font.Name = 'Segoe UI Semibold'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
            end
            object pnlCapa: TPanel
              Left = 0
              Top = 51
              Width = 1354
              Height = 154
              Align = alTop
              BevelOuter = bvNone
              Padding.Left = 10
              Padding.Top = 10
              Padding.Right = 10
              Padding.Bottom = 10
              TabOrder = 1
              object Panel8: TPanel
                Left = 10
                Top = 10
                Width = 1334
                Height = 30
                Align = alTop
                BevelOuter = bvNone
                Padding.Left = 10
                Padding.Top = 10
                Padding.Right = 10
                Padding.Bottom = 10
                TabOrder = 0
                object Label10: TLabel
                  Left = 8
                  Top = 8
                  Width = 72
                  Height = 17
                  Caption = 'Dados Capa'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = cl3DDkShadow
                  Font.Height = -13
                  Font.Name = 'Segoe UI Semibold'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
            end
            object pnlItens: TPanel
              Left = 0
              Top = 205
              Width = 1354
              Height = 282
              Align = alClient
              BevelOuter = bvNone
              Padding.Left = 10
              Padding.Top = 10
              Padding.Right = 10
              Padding.Bottom = 10
              TabOrder = 2
              object Panel10: TPanel
                Left = 10
                Top = 10
                Width = 1334
                Height = 30
                Align = alTop
                BevelOuter = bvNone
                Padding.Left = 10
                Padding.Top = 10
                Padding.Right = 10
                Padding.Bottom = 10
                TabOrder = 0
                object Label12: TLabel
                  Left = 8
                  Top = 8
                  Width = 72
                  Height = 17
                  Caption = 'Dados Itens'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = cl3DDkShadow
                  Font.Height = -13
                  Font.Name = 'Segoe UI Semibold'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
            end
            object Panel9: TPanel
              Left = 0
              Top = 487
              Width = 1354
              Height = 88
              Align = alBottom
              TabOrder = 3
              object btnEnviarDuimp: TBitBtn
                Left = 19
                Top = 23
                Width = 120
                Height = 43
                Cursor = crHandPoint
                Caption = 'Enviar Duimp'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = btnEnviarDuimpClick
              end
              object btnEnviarItensDuimp: TBitBtn
                Left = 271
                Top = 23
                Width = 120
                Height = 43
                Cursor = crHandPoint
                Caption = 'Enviar Itens'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnClick = btnEnviarItensDuimpClick
              end
              object btnRegistrarDuimp: TBitBtn
                Left = 672
                Top = 23
                Width = 120
                Height = 43
                Cursor = crHandPoint
                Caption = 'Registrar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                OnClick = btnRegistrarDuimpClick
              end
              object btnDiagnosticoDuimp: TBitBtn
                Left = 546
                Top = 23
                Width = 120
                Height = 43
                Cursor = crHandPoint
                Caption = 'Diagn'#243'stico'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                OnClick = btnDiagnosticoDuimpClick
              end
              object btnRestaurar: TBitBtn
                Left = 1017
                Top = 15
                Width = 140
                Height = 43
                Cursor = crHandPoint
                Caption = 'Restaurar Altera'#231#245'es'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                OnClick = btnRestaurarClick
              end
              object btnSalvar: TBitBtn
                Left = 871
                Top = 15
                Width = 140
                Height = 43
                Cursor = crHandPoint
                Caption = 'Salvar Altera'#231#245'es'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                OnClick = btnSalvarClick
              end
              object btnAlterarDuimp: TBitBtn
                Left = 145
                Top = 23
                Width = 120
                Height = 43
                Cursor = crHandPoint
                Caption = 'Alterar Duimp'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                OnClick = btnAlterarDuimpClick
              end
              object btnAlterarDuimpItens: TBitBtn
                Left = 397
                Top = 23
                Width = 120
                Height = 43
                Cursor = crHandPoint
                Caption = 'Alterar Itens'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
                OnClick = btnAlterarDuimpItensClick
              end
            end
          end
        end
        object tbsLog: TTabSheet
          Caption = '               Log               '
          ImageIndex = 1
          object Panel15: TPanel
            Left = 0
            Top = 0
            Width = 1354
            Height = 575
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object txtLog: TRichEdit
              Left = 0
              Top = 0
              Width = 1354
              Height = 575
              Align = alClient
              Font.Charset = ANSI_CHARSET
              Font.Color = cl3DDkShadow
              Font.Height = -12
              Font.Name = 'Segoe UI Semibold'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Zoom = 100
            end
          end
        end
      end
    end
    object tbsTransmissaoOld: TTabSheet
      Caption = '               Transmiss'#227'o Old               '
      object Panel2: TPanel
        Left = 0
        Top = 33
        Width = 1362
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label9: TLabel
          Left = 162
          Top = 11
          Width = 63
          Height = 17
          Caption = 'Nr. Duimp:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 16
          Top = 11
          Width = 56
          Height = 17
          Caption = 'Processo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtNrDuimp: TEdit
          Left = 162
          Top = 29
          Width = 133
          Height = 23
          TabOrder = 0
        end
        object edtProcessoEscolhido: TEdit
          Left = 16
          Top = 29
          Width = 133
          Height = 23
          ReadOnly = True
          TabOrder = 1
        end
      end
      object Panel5: TPanel
        Left = 1138
        Top = 89
        Width = 224
        Height = 516
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object btnGerarJson: TBitBtn
          Left = 9
          Top = 71
          Width = 200
          Height = 43
          Caption = 'Gerar Json'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnGerarJsonClick
        end
        object btnConectar: TBitBtn
          Left = 9
          Top = 22
          Width = 200
          Height = 43
          Caption = 'Conectar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnConectarClick
        end
        object btnEnviarCapa: TBitBtn
          Left = 9
          Top = 120
          Width = 200
          Height = 43
          Caption = 'Enviar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnEnviarCapaClick
        end
        object btntiposDocumentos: TBitBtn
          Left = 6
          Top = 494
          Width = 200
          Height = 28
          Caption = 'Consultar Tipos de Documentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = False
          OnClick = btntiposDocumentosClick
        end
        object BitBtn2: TBitBtn
          Left = 6
          Top = 466
          Width = 200
          Height = 27
          Caption = 'Consultar Palavras Chaves'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Visible = False
          OnClick = BitBtn2Click
        end
        object btnGerarJsonItens: TBitBtn
          Left = 9
          Top = 169
          Width = 200
          Height = 43
          Caption = 'Gerar Json de itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = btnGerarJsonItensClick
        end
        object btnEnviarItens: TBitBtn
          Left = 9
          Top = 218
          Width = 200
          Height = 43
          Caption = 'Enviar Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = btnEnviarItensClick
        end
        object btnConsultarTributos: TBitBtn
          Left = 9
          Top = 266
          Width = 200
          Height = 43
          Caption = 'Consultar Tributos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = btnConsultarTributosClick
        end
        object btnRegistrar: TBitBtn
          Left = 9
          Top = 364
          Width = 200
          Height = 43
          Caption = 'Registrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnClick = btnRegistrarClick
        end
        object btnDiagnostico: TBitBtn
          Left = 9
          Top = 315
          Width = 200
          Height = 43
          Caption = 'Diagn'#243'stico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnClick = btnDiagnosticoClick
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 89
        Width = 1138
        Height = 516
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          1138
          516)
        object Label4: TLabel
          Left = 19
          Top = 1
          Width = 78
          Height = 17
          Caption = 'Arquivo Json:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 19
          Top = 224
          Width = 135
          Height = 17
          Caption = 'Resposta do Siscomex:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object txtResposta: TMemo
          Left = 16
          Top = 245
          Width = 1107
          Height = 261
          Anchors = [akLeft, akTop, akRight, akBottom]
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object txtJson: TMemo
          Left = 16
          Top = 22
          Width = 1107
          Height = 189
          Anchors = [akLeft, akTop, akRight]
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object Label3: TLabel
          Left = 292
          Top = 4
          Width = 136
          Height = 28
          Caption = 'Dados de Capa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -20
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          ParentFont = False
        end
        object chkProducao: TCheckBox
          Left = 624
          Top = 8
          Width = 97
          Height = 17
          Caption = 'chkProducao'
          TabOrder = 0
          Visible = False
        end
      end
    end
    object tbsAtributosDuimp: TTabSheet
      Caption = 'Atributos NCM Duimp'
      ImageIndex = 4
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 605
        Align = alClient
        TabOrder = 0
        object btnAtributosDuimp: TBitBtn
          Left = 43
          Top = 23
          Width = 120
          Height = 43
          Cursor = crHandPoint
          Caption = 'Atributos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnAtributosDuimpClick
        end
        object pnlAtributosDuimp: TPanel
          Left = 1
          Top = 87
          Width = 1360
          Height = 517
          Align = alBottom
          Color = clBtnShadow
          ParentBackground = False
          TabOrder = 1
        end
      end
    end
    object tbsAtributosTributo: TTabSheet
      Caption = 'Atributos Tribut'#225'rios'
      ImageIndex = 5
      object Panel24: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 605
        Align = alClient
        TabOrder = 0
        object btnTelaAtributosTributos: TBitBtn
          Left = 43
          Top = 23
          Width = 120
          Height = 43
          Cursor = crHandPoint
          Caption = 'Atributos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnTelaAtributosTributosClick
        end
        object pnlAtributosTributos: TPanel
          Left = 1
          Top = 87
          Width = 1360
          Height = 517
          Align = alBottom
          Color = clBtnShadow
          ParentBackground = False
          TabOrder = 1
        end
      end
    end
    object tbsAtributosFundamento: TTabSheet
      Caption = 'Atributos Fundamento'
      ImageIndex = 6
      object Panel25: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 605
        Align = alClient
        TabOrder = 0
        object pnlAtributosFundamento: TPanel
          Left = 1
          Top = 87
          Width = 1360
          Height = 517
          Align = alBottom
          Color = clBtnShadow
          ParentBackground = False
          TabOrder = 0
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1370
    Height = 50
    Align = alTop
    Alignment = taRightJustify
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object lblTitulo: TLabel
      Left = 0
      Top = 0
      Width = 1370
      Height = 50
      Align = alClient
      Caption = '   Transmiss'#227'o de Duimp'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -27
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 297
      ExplicitHeight = 37
    end
  end
  object qryProcesso: TFDQuery
    Connection = dtmDuimp.FDConnection1
    SQL.Strings = (
      'SELECT TOP 100'
      'A.NM_AREA AS Area,'
      'P.NR_PROCESSO AS NrProcesso,'
      'IMPORT.CD_EMPRESA CodEmpresa ,'
      'IMPORT.NM_EMPRESA as NomeEmpresa,'
      'IMPORT.CGC_EMPRESA AS CNPJCliente,'
      'P.NUM_CE as CE,'
      'P.CD_GRUPO as CodGrupo,'
      'COUNT(DM.CD_MERCADORIA) as qtdItens,'
      'P.CD_DUIMP AS CodDuimp,'
      'EV088.dt_realizacao AS DataDesembaraco,'
      'P.CD_LOCAL_DESEMBARQUE,'
      'LE.DESCRICAO AS LocalDesembarque,'
      'DI.TX_INFO_COMPL AS InfoComplementar ,'
      'DI.CD_URF_DESPACHO,'
      'DI.CD_MOEDA_SEGURO,'
      
        'CAST(ISNULL(DI.VL_TOT_SEGURO_MNEG, 0) AS DECIMAL(13, 2)) AS VL_T' +
        'OT_SEGURO_MNEG, '
      'MSEG.CD_SIGLA AS MOEDA_SEGURO, '
      'VL_TOTAL_FRETE_MN,'
      'MFRETE.CD_SIGLA AS MOEDA_FRETE, '
      'PPROC.NM_SIGLA_2L AS PAIS_PROCEDENCIA,'
      'CAST(P.CD_RUC AS VARCHAR(32)) AS CD_RUC'
      'FROM TPROCESSO P'
      
        'INNER JOIN TDECLARACAO_IMPORTACAO DI ON DI.NR_PROCESSO = P.NR_PR' +
        'OCESSO'
      
        'INNER JOIN TADICAO_DE_IMPORTACAO ai ON AI.NR_PROCESSO = P.NR_PRO' +
        'CESSO'
      
        'INNER JOIN TDETALHE_MERCADORIA DM ON DM.NR_PROCESSO = P.NR_PROCE' +
        'SSO AND DM.NR_ADICAO = AI.NR_ADICAO'
      
        'INNER JOIN TMERCADORIA M ON M.CD_MERCADORIA = DM.CD_MERCADORIA A' +
        'ND M.CD_GRUPO = P.CD_GRUPO'
      'INNER JOIN TGRUPO G ON G.CD_GRUPO = P.CD_GRUPO'
      
        'LEFT JOIN TEMPRESA_NAC IMPORT ON IMPORT.CD_EMPRESA = P.CD_CLIENT' +
        'E'
      
        'LEFT JOIN TFOLLOWUP EV088 ON ev088.nr_processo = ai.nr_processo ' +
        'AND ev088.cd_evento='#39'088'#39
      'LEFT JOIN TMOEDAS_ISO MSEG ON MSEG.CD_MOEDA = DI.CD_MOEDA_SEGURO'
      
        'LEFT JOIN TMOEDAS_ISO MFRETE ON MFRETE.CD_MOEDA = DI.CD_MOEDA_FR' +
        'ETE'
      
        'LEFT JOIN TLOCAL_EMBARQUE LE ON LE.CODIGO = P.CD_LOCAL_DESEMBARQ' +
        'UE'
      'LEFT JOIN TAREA A ON A.CD_AREA = P.CD_AREA'
      
        'LEFT JOIN TPAIS_BROKER PPROC ON PPROC.CD_PAIS = DI.CD_PAIS_PROC_' +
        'CARGA'
      'WHERE'
      '/*'
      'isnull(ai.nr_oper_trat_prev, '#39#39') = '#39#39
      'AND (year(EV088.dt_realizacao) = 2024'
      'OR year(EV088.dt_realizacao) = 2023)'
      
        'AND (((RIGHT(RTRIM(P.NUM_CE), 2) in ('#39'06'#39', '#39'01'#39', '#39'10'#39')) AND (CD_' +
        'LOCAL_DESEMBARQUE = '#39'0002'#39'))'
      
        '  OR ((RIGHT(RTRIM(P.NUM_CE), 2) in ('#39'02'#39', '#39'05'#39', '#39'08'#39', '#39'09'#39')) AN' +
        'D (CD_LOCAL_DESEMBARQUE = '#39'1298'#39')))'
      'AND P.CD_GRUPO NOT IN ('#39'C74'#39', '#39'008'#39', '#39'013'#39', '#39'002'#39') '
      'AND G.NM_GRUPO LIKE '#39'%nestle%'#39
      '*/'
      'P.NR_PROCESSO = '#39'0101IM-003463-24'#39
      
        'GROUP BY P.NR_PROCESSO, IMPORT.CD_EMPRESA, IMPORT.NM_EMPRESA, IM' +
        'PORT.CGC_EMPRESA, P.NUM_CE, P.CD_DUIMP,'
      
        'P.CD_GRUPO, P.CD_DUIMP, DI.TX_INFO_COMPL, DI.CD_URF_DESPACHO, DI' +
        '.CD_MOEDA_SEGURO, DI.VL_TOT_SEGURO_MNEG, MSEG.CD_SIGLA'
      
        ',EV088.dt_realizacao, LE.DESCRICAO, P.CD_LOCAL_DESEMBARQUE, A.NM' +
        '_AREA, P.CD_RUC, VL_TOTAL_FRETE_MN,MFRETE.CD_SIGLA, PPROC.NM_SIG' +
        'LA_2L'
      'ORDER BY A.NM_AREA, EV088.dt_realizacao DESC'
      '')
    Left = 720
    Top = 269
    object qryProcessoArea: TStringField
      FieldName = 'Area'
      Origin = 'Area'
      FixedChar = True
      Size = 50
    end
    object qryProcessoNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Origin = 'NrProcesso'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryProcessoCodEmpresa: TStringField
      FieldName = 'CodEmpresa'
      Origin = 'CodEmpresa'
      FixedChar = True
      Size = 5
    end
    object qryProcessoNomeEmpresa: TStringField
      FieldName = 'NomeEmpresa'
      Origin = 'NomeEmpresa'
      Size = 80
    end
    object qryProcessoCNPJCliente: TStringField
      FieldName = 'CNPJCliente'
      Origin = 'CNPJCliente'
      FixedChar = True
      Size = 14
    end
    object qryProcessoCodGrupo: TStringField
      FieldName = 'CodGrupo'
      Origin = 'CodGrupo'
      FixedChar = True
      Size = 3
    end
    object qryProcessoqtdItens: TIntegerField
      FieldName = 'qtdItens'
      Origin = 'qtdItens'
      ReadOnly = True
    end
    object qryProcessoCodDuimp: TStringField
      FieldName = 'CodDuimp'
      Origin = 'CodDuimp'
      FixedChar = True
      Size = 16
    end
    object qryProcessoInfoComplementar: TMemoField
      FieldName = 'InfoComplementar'
      Origin = 'InfoComplementar'
      BlobType = ftMemo
    end
    object qryProcessoCD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'CD_URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object qryProcessoCD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'CD_MOEDA_SEGURO'
      FixedChar = True
      Size = 3
    end
    object qryProcessoMOEDA_SEGURO: TStringField
      FieldName = 'MOEDA_SEGURO'
      Origin = 'MOEDA_SEGURO'
      FixedChar = True
      Size = 3
    end
    object qryProcessoDataDesembaraco: TSQLTimeStampField
      FieldName = 'DataDesembaraco'
      Origin = 'DataDesembaraco'
    end
    object qryProcessoCD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'CD_LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qryProcessoLocalDesembarque: TStringField
      FieldName = 'LocalDesembarque'
      Origin = 'LocalDesembarque'
      Size = 50
    end
    object qryProcessoCE: TStringField
      FieldName = 'CE'
      Origin = 'CE'
      FixedChar = True
    end
    object qryProcessoVL_TOT_SEGURO_MNEG: TBCDField
      FieldName = 'VL_TOT_SEGURO_MNEG'
      Origin = 'VL_TOT_SEGURO_MNEG'
      ReadOnly = True
      Precision = 13
      Size = 2
    end
    object qryProcessoCD_RUC: TStringField
      FieldName = 'CD_RUC'
      Origin = 'CD_RUC'
      ReadOnly = True
      Size = 32
    end
    object qryProcessoVL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
      Origin = 'VL_TOTAL_FRETE_MN'
    end
    object qryProcessoMOEDA_FRETE: TStringField
      FieldName = 'MOEDA_FRETE'
      Origin = 'MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object qryProcessoPAIS_PROCEDENCIA: TStringField
      FieldName = 'PAIS_PROCEDENCIA'
      Origin = 'PAIS_PROCEDENCIA'
      FixedChar = True
      Size = 2
    end
  end
  object dtsProcesso: TDataSource
    DataSet = qryProcesso
    Left = 784
    Top = 269
  end
  object idHttp: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 752
    Top = 416
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 2
    Left = 752
    Top = 480
  end
  object qryItens: TFDQuery
    Connection = dtmDuimp.FDConnection1
    SQL.Strings = (
      '')
    Left = 720
    Top = 317
  end
  object qryConsultaAux: TFDQuery
    Connection = dtmDuimp.FDConnection1
    Left = 780
    Top = 334
  end
  object qryInsertNumDuimp: TFDQuery
    Connection = dtmDuimp.FDConnection1
    Left = 716
    Top = 366
  end
  object qryDuimpPush: TFDQuery
    Connection = dtmDuimp.FDConnection1
    SQL.Strings = (
      'SELECT * FROM DuimpPush WHERE numero = :NrDuimp')
    Left = 872
    Top = 269
    ParamData = <
      item
        Name = 'NRDUIMP'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end>
    object qryDuimpPushid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryDuimpPushdataEvento: TSQLTimeStampField
      FieldName = 'dataEvento'
      Origin = 'dataEvento'
    end
    object qryDuimpPushevento: TStringField
      FieldName = 'evento'
      Origin = 'evento'
      Size = 255
    end
    object qryDuimpPushnumero: TStringField
      FieldName = 'numero'
      Origin = 'numero'
      Size = 50
    end
    object qryDuimpPushversao: TStringField
      FieldName = 'versao'
      Origin = 'versao'
      Size = 10
    end
    object qryDuimpPushmessage: TStringField
      FieldName = 'message'
      Origin = 'message'
      Size = 255
    end
    object qryDuimpPushniImportador: TStringField
      FieldName = 'niImportador'
      Origin = 'niImportador'
    end
    object qryDuimpPushsituacaoDuimp: TStringField
      FieldName = 'situacaoDuimp'
      Origin = 'situacaoDuimp'
      Size = 50
    end
    object qryDuimpPushsituacao: TStringField
      FieldName = 'situacao'
      Origin = 'situacao'
      Size = 50
    end
    object qryDuimpPushdataGeracao: TSQLTimeStampField
      FieldName = 'dataGeracao'
      Origin = 'dataGeracao'
    end
    object qryDuimpPushcode: TStringField
      FieldName = 'code'
      Origin = 'code'
      Size = 10
    end
  end
  object qryDuimpPushDetalhe: TFDQuery
    IndexFieldNames = 'DuimpPushId'
    MasterSource = dtsDuimpPush
    MasterFields = 'id'
    Connection = dtmDuimp.FDConnection1
    SQL.Strings = (
      'SELECT top 200 * FROM DuimpPushDetalhe WHERE duimpPushId = :id')
    Left = 872
    Top = 317
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    object qryDuimpPushDetalheid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryDuimpPushDetalheDuimpPushId: TIntegerField
      FieldName = 'DuimpPushId'
      Origin = 'DuimpPushId'
    end
    object qryDuimpPushDetalheitem: TIntegerField
      FieldName = 'item'
      Origin = 'item'
    end
    object qryDuimpPushDetalhecodigoMensagem: TStringField
      FieldName = 'codigoMensagem'
      Origin = 'codigoMensagem'
      Size = 50
    end
    object qryDuimpPushDetalhetextoMensagem: TStringField
      FieldName = 'textoMensagem'
      Origin = 'textoMensagem'
      Size = 1000
    end
    object qryDuimpPushDetalhesistemaOrigem: TStringField
      FieldName = 'sistemaOrigem'
      Origin = 'sistemaOrigem'
      Size = 50
    end
    object qryDuimpPushDetalhetipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 100
    end
  end
  object dtsDuimpPush: TDataSource
    DataSet = qryDuimpPush
    Left = 952
    Top = 269
  end
  object dtsDuimpPushDetalhe: TDataSource
    DataSet = qryDuimpPushDetalhe
    Left = 968
    Top = 317
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 764
    Top = 171
  end
  object ImageList1: TImageList
    Left = 68
    Top = 549
    Bitmap = {
      494C010101000800E80010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB8F3B7FF66E164FF68EE65FF68EF66FF65EA63FF85E983FFEEFB
      EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFD9F6
      D8FF69F267FF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF63E3
      60FF7AE978FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFC4F1C4FF63E4
      61FF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD
      5EFF60DC5EFF66EC64FFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFF8FDF8FF66EA64FF60DD
      5EFF60DD5EFF60DD5EFF60DD5EFF5EDD5CFF60DD5EFF60DD5EFF60DD5EFF60DD
      5EFF60DD5EFF60DC5EFF75E373FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFF68E167FF60DD5EFF60DD
      5EFF60DD5EFF61DD5FFF72E170FFE7FAE7FF54DA52FF60DD5EFF60DD5EFF60DD
      5EFF60DD5EFF60DD5EFF63E361FFF1FCF0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFF66EA63FF60DD5EFF60DD
      5EFF61DD5FFF75E174FFFFFFFFFFFFFFFFFFD2F5D2FF5FDD5DFF60DD5EFF60DD
      5EFF60DD5EFF60DD5EFF60DD5EFF80E47FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEF8DDFF60DE5EFF60DD5EFF60DD
      5EFF5DDC5BFFFFFFFFFFFFFFFFFFEDFBEDFFFFFFFFFF6DE06BFF60DD5EFF60DD
      5EFF60DD5EFF60DD5EFF60DD5EFF65EA63FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3F2C2FF60DD5EFF60DD5EFF60DD
      5EFF5FDD5DFFA4ECA3FF5CDC5AFF55DB53FFFFFFFFFFFFFFFFFF52DA50FF60DD
      5EFF60DD5EFF60DD5EFF60DD5EFF68EF66FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CDF5CDFF60DD5EFF60DD5EFF60DD
      5EFF60DD5EFF60DD5EFF60DD5EFF61DD5FFF9DEA9CFFFFFFFFFFCAF4C9FF5FDD
      5DFF60DD5EFF60DD5EFF60DD5EFF68EF65FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5FDF4FF62E160FF60DD5EFF60DD
      5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF58DB56FFF8FDF7FFFFFFFFFF68DF
      66FF60DD5EFF60DD5EFF60DD5EFF64DE62FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFF69F167FF60DD5EFF60DD
      5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF57DB55FFFFFFFFFFDEF8
      DEFF5EDD5CFF60DD5EFF60DC5EFFB6EFB5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFADEDACFF60DC5EFF60DD
      5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF61DD5FFF5FDD5DFF5CDC
      5AFF60DD5EFF60DD5EFF6AF367FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF65E663FF60DC
      5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD
      5EFF60DD5EFF63E461FFDAF6DAFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF67E7
      65FF60DC5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD5EFF60DD
      5EFF66EA64FFC4F2C3FFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAFF1AEFF69F166FF62E160FF60DD5EFF60DD5EFF60DE5EFF65EA63FF6DE5
      6BFFF7FDF7FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF4FEF3FFCEF6CEFFC4F3C3FFDFFADFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object FDQuery1: TFDQuery
    Left = 573
    Top = 277
  end
end
