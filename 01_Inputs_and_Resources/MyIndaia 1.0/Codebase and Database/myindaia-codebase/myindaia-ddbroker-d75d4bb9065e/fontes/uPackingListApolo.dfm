object frmPackingListApolo: TfrmPackingListApolo
  Left = 565
  Top = 121
  Width = 859
  Height = 774
  Caption = 'Packing List'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 8
    Top = 4
    Width = 794
    Height = 1123
    DataSource = datm_DocumentosExportacao.dsPackingList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    BeforePrint = RLReport1BeforePrint
    object rlGrupoProcesso: TRLGroup
      Left = 38
      Top = 38
      Width = 718
      Height = 1019
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Borders.Width = 2
      Borders.FixedBottom = True
      DataFields = 'NR_PROCESSO;NR_FATURA'
      PageBreaking = pbBeforePrint
      object rlHeader: TRLBand
        Left = 2
        Top = 2
        Width = 714
        Height = 102
        BandType = btHeader
        object rlLogo: TRLImage
          Left = 7
          Top = 6
          Width = 274
          Height = 83
          Picture.Data = {
            0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000145
            0000004B0803000000D0D765AB000000017352474200AECE1CE9000000046741
            4D410000B18F0BFC6105000000EA504C5445FFFFFF221F73E51B24231F20E627
            2FE72932DAD9E7FBDBDDEC5A60FBDEDFEC575EE6262EFCE1E2E72D35FDEDEEE6
            232CFEF3F4EB5259BBBAD42B28789997BEE2E1ECFEF5F6EFEFF5ACABCA8583B2
            B6B5D1CCCBDFA4A3C5504E9049478C454289E7E6F05C5A98BDBBBCC4C3DA6765
            9F292677333031E1E0E03C3983908FB9F7F7FA6D6BA2DBDBE8726F709C9BC032
            2F7D656363868485413E3FA8A6A7312D2E7977AACBCACB5653546E6B6CC0BFBF
            D2D1D2828080807FAF979595E93C44B0AFAFF5A4A7504D4DEA484FFAD0D1F181
            86F8C3C5EF7479F28D91F7B7B9F07F84F3999DEE6A70F7BABDF4A0A43527A114
            00000D2949444154785EED5C6B431AC9121DE8BD9A876B368A0144054140C680
            30BC044424D94D726FEEFEFFBF73ABBBABAABB677A46135D57EF723EE84CCFAB
            FA74D5A9EA79106CB0C1061B6CB0C1061BFC2330E9F697212ECFC402978AD15A
            354EC4A2DF572D7F27766EBFBCBFF9F5EDDB5F3CF8D7C3F0EBCF22FF0A8D9318
            0840ABA8575682186B0BA1585C4FFB62A25AFE3EDC7ECA3F477C46F300752106
            AB962806F5C5600E6BC0627BB91806A168CD97E0A393FA6009BBB507DD95FA3B
            24B77D32DCFE8A563F337C43FB24BAA20BEC14838574C9F61C580C5BB0346D8F
            C448886510C14A14CCE5D6855A01329F12BBCFD30FF3F97FA3810A7D600A0034
            D5076231011697625AEFAE80C541572CEB623D89C41296E6623414ADD51393B8
            FD168D7E6EB8410335B42F425A598314AEA52E5E295E411783A1182CC50094B3
            BF16511489FA0A9CF4494572E79946B3238A8019E8E2ACD51A42382F457706D1
            0BA4B59713647125A6C5A918F4C562DE1D84934917D87E42DCA0CDCF0EFF4103
            092A478F42F56F0EDC4573A97E53CDE22200711423C9754B0C8AB055BAEE93E1
            77B4F9D9E13B1A68305FC8F41BACFA5710ACC3E92008175388E9C52098F75741
            38980EA00C9A5FADA14DFF7D327C469B09BAC0CB04D6902EDEDE13EFEE89FCCD
            07B4F025E02BB227F1E6767BF7C33DF0DB03B07B5FFC8606BE081855FCF41A9B
            36F8519880FE842D1BFC386E91C37CFE0F6C79FEF858DA431CE2A45A23DC2B1D
            2AC0964665CBD9667050B838AD9E9F9F9C8D4BF12962A80F3F2CD5B0218E4AF9
            E2188E3D3E2B37B0458333B4D7154BD71D8542A1D03B3A6C7CC4668983C29144
            EFC8985284DD24CA5BD8106C1D69AB0E2D7B0FF58185435C6794E465243ABDEC
            19F0598ED1C3268562135B11E7176E5F251AC7B851A23976E9FA88EDB91236B8
            E89DE36689CB0EB64A7C41123D7505E0140F215C8E0F704B50C2A69CA1760B5B
            8C11636CC855B001C6FB129BCEB18150A40D8064EF2DD42CB24EB14D21CE22E0
            C4A5A916EF50CEE6C2D3010B0DCB3E854BE3073FC622A0809B0E713DC7BC7A8C
            E08137C636B025978B850D9F1030C6362F7AB89302BB3DC0C3A23D7E4150C036
            1B97D619B258F450913BA698C98E68DFA138FCEC8B192CB2DFE54EB02508CAD8
            9270382B4E73975921ED1845832A613B29A369EC3397766078E60E24D4C6F883
            832A6A6F7676F1B1982BAB4D1E162BD8C22CB2CE583E73820DF1017729487683
            C15D5538C656092F8B26E85348B4684C6531F49308B2A469DC410EF3CE5D6582
            FF60C548168B64C41EAE03280D581C389981E21489C808E98EDEE30C6DB3325E
            4DB7C481D63842E0609FBA90CAA2D79B1430C85E21895E67F4B3A8BA781F162D
            C32FB0C99226EDD304BC54B9AAFE55B1D50374E60AB27984CD0062F11CD27CD9
            98AE47C48A8BE6D95163AF608282DD358D45CBE8CBEBC3C661D94AD65AF14D48
            BF57EB0EC8944265CF3A54A9D67D58E4146D32B235AA67D8A4801D68D6501E53
            B3345EA44969CACAD2C4A28EF22D1265BD6A64F75AAD03AF8668343885C5DA3E
            36E79AA4427BDC845A65A6805FD5BA0DBA8E560E1616B97A1F168D99448B2D5D
            8EBFA1679D06D77A2135A479C703BD6085B4CB225BA8069D6DB3F311DB877199
            C2A2115493880E3871EA28FB1339046CAB060B2E8B0179A38CA2235CCE6031B4
            AB54EDF9CC3DA0694F2E74204317718FF3B42C8D2681A8E2D98DBCC658649994
            165EE0327BA28431704FAD27DC40C1541A7633338EC3689C3111D33116292A24
            23F76091BC454177CD8A71A7D6239BB6B8EFBA5F09D035C0743C177206A0EB61
            0B978FB02FC7802BB85CBC6A87F2B3C823EFC6078BBEF68FFF2287803F5583C1
            C358B45234400E991EFC2676C9B215F55B46162A27A5A31830BA241954A6F360
            C458648AA0BC6726DCC280655A17A8DC016708D98DAD5107F05C0B95D9A4E978
            4CA744B434C5C3229B8D46E06855B5A95206B4CB9DE069930A25D3360ADFA5FF
            66029A20DDA2880AAF7D01402C62B7C878C9104B9B515105EE85EAA19F45141B
            CBE9356804F6B5A5D6EDEED80C86AA013D0A28FCDA89EEC12286DCA96653A664
            7D501937980821F3650AA265CF2CCCB8B772630C0D0E5262F1A4F671AB626E1D
            4852A9C771B965DED4D5BC2CB2BCBA95190F37FB98F5E8E58B6E41108B50E994
            AC22490E28CB423A8B68FA99B6433A97EE77053DC30C2E36E851C5B1F76669E4
            5FEF4826602FEC92D086CC27D491B83FB174AB48F7B2C8692426064625A82AB3
            1E033AB5B755995A5075C13D58443A2EF0347B98ED9A348AE6AE0EEEA9431199
            8ADFF391202DD2A526B146CA90C2A22499A2D2AA2E15D8D1942C7859E446ABBE
            5760D9A7BDAD98761E1AF95954A7BB9B45AA10CA2805D778DD539E0BD05D1DB2
            478F36ADD95D41D0F0638750F9C8C1FC2C2AC69FC417ED6758764C7B59D425EA
            DD2CD2E57B78BD63F4C10E6B2A85227A1F4A3FB1EF0969DA11AF49CA84C9D3CB
            A2BE5FC0BAA8763460DE1E411701FE98F6B2A80FBA3BBB189FD27C9E635F2ABC
            051308D1468E825923797B8CAA649A3BD2386196F6B178A24FC239DA58ABE0E6
            E8B82469A4A9412C474BF8639A4E6081EE6AB23F9BDA216604C52D1CA047E348
            91002995C61C47978E237DA30313599AD83FEE8C25AEC75878C6277006E4CF6C
            6DEC9CC4841E31EE80338BE77AD1BDADCC531A5B25CC5D09EBCD8E248B1C66D4
            23CB9FF96EB536C2CAA75A18ABAAC083335090A04F51057572AA4111402EC7E0
            FEC4A16D20162FCF00A767E38E790AC573175718B913BAC6F7B3C823E08634DF
            E8B16F1407DF91C37CFEED2E36318BE34219D039DA33CEEB2A8A024BA5EE146A
            BF2CE7D85A00947A1499BA4BCE74DB4633F64C81CAEC2474FF88C578E849F000
            D87D8ECFA3FD2CB2D3590E633BBE53C8EF9AF7EF38C1108BB18A5F82CF629200
            4D10B5EBD3C5A5471943B43221C13A8EEC072E2E62B5053B4502BAF0CE629109
            B2358FE29924C1CFA211D54B33AC35EE516CAA6ADDDCA157DE3258E4D4C5E2CA
            BCEA44485AAF6EA230C1DA605A551A9B1AA7F190E64E27A1BA4D06249440C25C
            8502B36262009965167BB58A46435A686280EF2F5A031AE7C6C4343D3D201663
            994D816D38D15BCD93463D3A14C5AACCE25CA8F32929A1B4DEFBE44EC39D4B73
            6DE7813A6B268B5602DF1F971A7B3D9A6603C8796DE141A84D5CD38087940F1B
            871D4B8378164F30CF60C819B358B45CE8B4D0EB5846E9012395546BA60F4A5B
            689B64D8109C8475D7C71C54ED489156E890114A61335934D920017EEE92C662
            4614602565C3D4DEF8423571EE633155CED083A842D61A437957473B1D2B838B
            2CBC6894080D3AD6D11CDAD19E43B0E0CAC1C966D1C85B1C58BB65B0C8F787E2
            C067802EB8F6C637AA89C558B2D4481B20EC255D588F007541E7224AF0C0127B
            29F705407CD8B7C3B958B177E48890E371078B69349ACC9BCEA27FFEE127D172
            461DD2992C1EF8050D2B32AA22700642DEA7759C18011B29A0F9FE9602196D15
            C914D06EC547322F0FA7B14963D1946216AAD6A064B018FA72E069329C2576DF
            2189F95BB59EC962B0E5A391DEBA201FC34E634AA7591D9E18E29BD2B55BD292
            DB502700E4DBAE9C73A900C26179780A6A89C874CEE611296340E23D1D4ED809
            BC4712F17960368B413129176C158D2B7549C7BFBB96CB85212EC44A34EE0FD7
            1114AE4EE90B20AF05A9B89B4530CB09CD0B57F0335984FC64F3B8DFF13BA2C4
            1B241159ACE6F6016977EF01CE8B6CF62B6541A97922D1A45CD0CB55ABD57D4A
            BA1DB5B57A1E36724D7589D84D68500BD9DC348577ADF2714B21667C4DB76E41
            6086B89432E6885A697C7C7E795E3D2D37E23CD0092CB8346FF52E4EE0D893B3
            8223CE71F0A72FFA395611A156FC28564A9DF2787C5DEEED659E3905C59ABE42
            BC43BA15B6E2FA2323DD8FEEC69DC7FE811CBA1FE06DF0636059CC6FDE94FF69
            9847AA9B57E57F12AFBFFE8214027EC7C6E783EF37EF7F066F7E10AF1E84F7EE
            27958937761E1F61BB8D4BF701BF39FD82E07C97FC40B4D751142D9289AD2EA6
            B814477B2AA25910AC46E28A88FE8686BD243CEA27786DF909A9E72B5B97C5E2
            640E7FC389A46D0DFBF783893C6CA836DAAF12BD18BC7BD4040D2C4EDA915806
            F348ACDBCAD126413D9A0E80C5B02B468AA8594BB4C26032923F565017DD763D
            0CAEC46A82DF896FA3612F0A8FFB1516B0D80E86A25B040713A3B02F809E40FA
            19F85B5F4C25BFEA07205A4110897E248A2BD112511B5646420BC107EB31EF4B
            C1CD236716C5E24A74C1F7E4EF3AF4C560287FF0211880CB09515F8808585C80
            53064558AC8BE1504457E099533105C6E519AC77DA5E0A92AF253F108AC52BB1
            1C8856348D96E07F62297FE361261673318AA2E95ACEF226C0623092242F57A0
            865331EF0BF91B2FB0C93CC8782178F76547F5FC31012C5E4D850CD47E71D10F
            86C395580F456B08FA381F89C92AAAC34EC3488869A87EC565D996DB05F8EB40
            4AA7F301F7B3C7BB9B575FBFFD159FC7038B8095FC25172D853283C0DF354860
            5D6E92290468166216ACE60B70C42E2C0F8336A49A16A4ECCFDBBB3B8F85D719
            D87E04ECFC659FC687B37A7DA6B2447D005560301B48E75B0D83F9320CDA4BFD
            0B4CF3D56C560F16907F20FC83FA52963DC5E1D3FF3AD3FF03209085A478830D
            36D860830D36D8E09F8020F81FDAF072DACA3006B20000000049454E44AE4260
            82}
          Scaled = True
        end
        object rlPackingList: TRLLabel
          Left = 498
          Top = 66
          Width = 212
          Height = 26
          Caption = 'Lista de Empaque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -23
          Font.Name = 'Lucida Sans'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 956
          Top = 3
          Width = 70
          Height = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Info = itPageNumber
          ParentFont = False
          Text = 'Pg:'
        end
      end
      object rlHeader2: TRLBand
        Left = 2
        Top = 104
        Width = 714
        Height = 240
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.Width = 2
        object RLPanel59: TRLPanel
          Left = 0
          Top = 2
          Width = 357
          Height = 236
          Align = faLeft
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object RLPanel60: TRLPanel
            Left = 0
            Top = 0
            Width = 357
            Height = 120
            Align = faTop
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            Borders.Width = 2
            object rlImportador: TRLLabel
              Left = 14
              Top = 3
              Width = 68
              Height = 10
              Caption = 'IMPORTADOR:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbImportadorNome: TRLDBText
              Left = 14
              Top = 22
              Width = 400
              Height = 12
              AutoSize = False
              DataField = 'IMPORT_EMPRESA'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbImportadorEndereco: TRLDBText
              Left = 14
              Top = 40
              Width = 400
              Height = 12
              AutoSize = False
              DataField = 'IMPORT_CIDADE_ESTADO'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
            object rldbImportadorPais: TRLDBText
              Left = 14
              Top = 59
              Width = 335
              Height = 12
              AutoSize = False
              DataField = 'IMPORT_PAIS'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
          end
          object RLPanel61: TRLPanel
            Left = 0
            Top = 120
            Width = 357
            Height = 113
            Align = faTop
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object rlExportador: TRLLabel
              Left = 14
              Top = 3
              Width = 69
              Height = 10
              Caption = 'EXPORTADOR:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbExportadorNome: TRLDBText
              Left = 14
              Top = 20
              Width = 335
              Height = 12
              AutoSize = False
              DataField = 'EXPORT_EMPRESA'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbExportadoEndereco: TRLDBText
              Left = 14
              Top = 37
              Width = 336
              Height = 12
              AutoSize = False
              DataField = 'EXPORT_CIDADE_NUMERO'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
            object rldbExportadorCep: TRLDBText
              Left = 14
              Top = 55
              Width = 337
              Height = 12
              AutoSize = False
              DataField = 'EXPORT_CEP'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
              Text = 'CEP: '
            end
            object rldbExportadorCNPJ: TRLDBText
              Left = 14
              Top = 72
              Width = 336
              Height = 12
              AutoSize = False
              DataField = 'EXPORT_CNPJ'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
              Text = 'CNPJ:'
            end
            object rldbExportadorTelefone: TRLDBText
              Left = 14
              Top = 89
              Width = 400
              Height = 12
              AutoSize = False
              DataField = 'EXPORT_TELEFONE'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
              Text = 'Phone:'
            end
          end
        end
        object RLPanel62: TRLPanel
          Left = 357
          Top = 2
          Width = 357
          Height = 236
          Align = faClient
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Borders.Width = 2
          Borders.FixedLeft = True
          object RLPanel5: TRLPanel
            Left = 2
            Top = 0
            Width = 355
            Height = 120
            Align = faTop
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            Borders.Width = 2
            object rldbNmViaTransp: TRLDBText
              Left = 13
              Top = 88
              Width = 92
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'MODAL'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
            object lblModal: TRLLabel
              Left = 13
              Top = 76
              Width = 91
              Height = 10
              Caption = 'Means of Transport'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBText6: TRLDBText
              Left = 128
              Top = 88
              Width = 89
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'CD_INCOTERM'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
            object RLLabel6: TRLLabel
              Left = 133
              Top = 76
              Width = 81
              Height = 10
              Caption = 'Terms of Delivery'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBText5: TRLDBText
              Left = 129
              Top = 54
              Width = 81
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'DT_FATURA_PT'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
            object RLLabel5: TRLLabel
              Left = 139
              Top = 43
              Width = 58
              Height = 10
              Caption = 'Invoice Date'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel4: TRLLabel
              Left = 27
              Top = 43
              Width = 61
              Height = 10
              Caption = 'Packing Date'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBText3: TRLDBText
              Left = 22
              Top = 54
              Width = 75
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'DT_FATURA_PT'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
            object rldbNumFat: TRLDBText
              Left = 21
              Top = 21
              Width = 84
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'NR_FATURA'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
            object rlFaturaComercial: TRLLabel
              Left = 21
              Top = 9
              Width = 81
              Height = 10
              Caption = 'Factura Comercial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBText2: TRLDBText
              Left = 133
              Top = 21
              Width = 76
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'NR_FATURA'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
            object RLLabel3: TRLLabel
              Left = 149
              Top = 9
              Width = 34
              Height = 10
              Caption = 'Invoice'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbPortoDestino: TRLDBText
              Left = 224
              Top = 54
              Width = 121
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'DS_PORTO_DESTINO_ESP'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
            object lblLocalDesembarque: TRLLabel
              Left = 235
              Top = 43
              Width = 103
              Height = 10
              Caption = 'Local de Desembarque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object rldbPortoOrigem: TRLDBText
              Left = 224
              Top = 21
              Width = 121
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'DS_PORTO_EMBARQUE'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
            object lblLocalEmbarque: TRLLabel
              Left = 237
              Top = 9
              Width = 87
              Height = 10
              Caption = 'Local de Embarque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object RLPanel6: TRLPanel
            Left = 2
            Top = 120
            Width = 355
            Height = 116
            Align = faClient
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            object RLLabel1: TRLLabel
              Left = 14
              Top = 4
              Width = 68
              Height = 10
              Caption = 'IMPORTADOR:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBText4: TRLDBText
              Left = 14
              Top = 24
              Width = 330
              Height = 12
              AutoSize = False
              DataField = 'IMPORT_EMPRESA'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBText7: TRLDBText
              Left = 14
              Top = 42
              Width = 330
              Height = 12
              AutoSize = False
              DataField = 'IMPORT_CIDADE_ESTADO'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
            object RLDBText8: TRLDBText
              Left = 14
              Top = 61
              Width = 330
              Height = 12
              AutoSize = False
              DataField = 'IMPORT_PAIS'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
          end
        end
      end
      object rlSubDetailFatura: TRLSubDetail
        Left = 2
        Top = 344
        Width = 714
        Height = 641
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DataSource = datm_DocumentosExportacao.dsPackingListItem
        BeforePrint = rlSubDetailFaturaBeforePrint
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 714
          Height = 19
          BandType = btHeader
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object RLPanel35: TRLPanel
            Left = 470
            Top = 0
            Width = 80
            Height = 18
            Align = faLeft
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Lucida Sans'
            Font.Pitch = fpFixed
            Font.Style = []
            ParentFont = False
            object rlEmabalagem: TRLLabel
              Left = 0
              Top = 2
              Width = 80
              Height = 12
              Align = faWidth
              Alignment = taCenter
              Caption = 'Embalaje'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object RLPanel36: TRLPanel
            Left = 100
            Top = 0
            Width = 70
            Height = 18
            Align = faLeft
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Lucida Sans'
            Font.Pitch = fpFixed
            Font.Style = []
            ParentFont = False
            object rlCodigo: TRLLabel
              Left = 0
              Top = 2
              Width = 70
              Height = 12
              Align = faWidth
              Alignment = taCenter
              Caption = 'Codigo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object RLPanel37: TRLPanel
            Left = 170
            Top = 0
            Width = 220
            Height = 18
            Align = faLeft
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Lucida Sans'
            Font.Pitch = fpFixed
            Font.Style = []
            ParentFont = False
            object rlDescricaoMercadoria: TRLLabel
              Left = 0
              Top = 2
              Width = 176
              Height = 12
              Alignment = taCenter
              Caption = 'Descripcion de la Mercancia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object RLPanel40: TRLPanel
            Left = 550
            Top = 0
            Width = 80
            Height = 18
            Align = faLeft
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Lucida Sans'
            Font.Pitch = fpFixed
            Font.Style = []
            ParentFont = False
            object rlPrecoUnitario: TRLLabel
              Left = 0
              Top = 2
              Width = 80
              Height = 12
              Align = faWidth
              Alignment = taCenter
              Caption = 'Peso Neto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object RLPanel41: TRLPanel
            Left = 630
            Top = 0
            Width = 80
            Height = 18
            Align = faLeft
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Lucida Sans'
            Font.Pitch = fpFixed
            Font.Style = []
            ParentFont = False
            object rlSubtotalMercadoria: TRLLabel
              Left = 0
              Top = 2
              Width = 80
              Height = 12
              Align = faWidth
              Alignment = taCenter
              Caption = 'Peso Bruto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object RLPanel8: TRLPanel
            Left = 0
            Top = 0
            Width = 100
            Height = 18
            Align = faLeft
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Lucida Sans'
            Font.Pitch = fpFixed
            Font.Style = []
            ParentFont = False
            object RLLabel7: TRLLabel
              Left = 0
              Top = 2
              Width = 100
              Height = 12
              Align = faWidth
              Alignment = taCenter
              Caption = 'Packages'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object RLPanel10: TRLPanel
            Left = 390
            Top = 0
            Width = 80
            Height = 18
            Align = faLeft
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Lucida Sans'
            Font.Pitch = fpFixed
            Font.Style = []
            ParentFont = False
            object RLLabel8: TRLLabel
              Left = 0
              Top = 2
              Width = 80
              Height = 12
              Align = faWidth
              Alignment = taCenter
              Caption = 'Qty. Pcs.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 38
          Width = 714
          Height = 105
          AutoSize = True
          BandType = btColumnFooter
          object RLPanel3: TRLPanel
            Left = 0
            Top = 0
            Width = 714
            Height = 105
            Align = faTop
            AutoExpand = True
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = True
            Borders.DrawRight = False
            Borders.DrawBottom = True
            object rlEmbalagens: TRLLabel
              Left = 3
              Top = 12
              Width = 51
              Height = 10
              Caption = 'Marcacion:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBMemo1: TRLDBMemo
              Left = 80
              Top = 12
              Width = 220
              Height = 13
              Behavior = [beSiteExpander]
              DataField = 'TX_INF_EMBALAGEM'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
            object rldbPesoLiquido: TRLDBText
              Left = 80
              Top = 32
              Width = 120
              Height = 12
              AutoSize = False
              DataField = 'VL_PESO_LIQUIDO'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
            object rldbPesoBruto: TRLDBText
              Left = 80
              Top = 51
              Width = 118
              Height = 12
              AutoSize = False
              DataField = 'VL_PESO_BRUTO'
              DataSource = datm_DocumentosExportacao.dsPackingList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
            object lblPesoLiquido: TRLLabel
              Left = 3
              Top = 32
              Width = 49
              Height = 10
              Caption = 'Peso Neto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPesoBruto: TRLLabel
              Left = 3
              Top = 51
              Width = 51
              Height = 10
              Caption = 'Peso Bruto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDraw1: TRLDraw
              Left = 406
              Top = 66
              Width = 300
              Height = 1
            end
            object RLLabel2: TRLLabel
              Left = 479
              Top = 74
              Width = 156
              Height = 10
              Caption = 'COLCH'#213'ES APOLO SPUMA LTDA.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object rlgrupoFatura: TRLGroup
          Left = 0
          Top = 19
          Width = 714
          Height = 19
          DataFields = 'NR_PEDIDO'
          object RLBand3: TRLBand
            Left = 0
            Top = 0
            Width = 714
            Height = 19
            object RLPanel43: TRLPanel
              Left = 470
              Top = 0
              Width = 80
              Height = 19
              Align = faLeft
              AutoExpand = True
              Borders.Sides = sdCustom
              Borders.DrawLeft = True
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
              object rldbEmbalagem: TRLDBText
                Left = 4
                Top = 4
                Width = 72
                Height = 12
                Alignment = taCenter
                AutoSize = False
                DataField = 'UNIDADE_MEDIDA_ESP'
                DataSource = datm_DocumentosExportacao.dsPackingListItem
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Lucida Sans'
                Font.Pitch = fpFixed
                Font.Style = []
                ParentFont = False
              end
            end
            object RLPanel44: TRLPanel
              Left = 100
              Top = 0
              Width = 70
              Height = 19
              Align = faLeft
              AutoExpand = True
              Borders.Sides = sdCustom
              Borders.DrawLeft = True
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
              object rldbCodigoMercadoria: TRLDBText
                Left = 4
                Top = 4
                Width = 70
                Height = 12
                AutoSize = False
                DataField = 'CD_MERCADORIA'
                DataSource = datm_DocumentosExportacao.dsPackingListItem
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Lucida Sans'
                Font.Pitch = fpFixed
                Font.Style = []
                ParentFont = False
              end
            end
            object RLPanel45: TRLPanel
              Left = 170
              Top = 0
              Width = 220
              Height = 19
              Align = faLeft
              AutoExpand = True
              Borders.Sides = sdCustom
              Borders.DrawLeft = True
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
              object rldbMercadoria: TRLDBMemo
                Left = 9
                Top = 4
                Width = 251
                Height = 14
                AutoSize = False
                Behavior = [beSiteExpander]
                DataField = 'MERCADORIA_ESP'
                DataSource = datm_DocumentosExportacao.dsPackingListItem
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Lucida Sans'
                Font.Pitch = fpFixed
                Font.Style = []
                ParentFont = False
              end
            end
            object RLPanel48: TRLPanel
              Left = 550
              Top = 0
              Width = 80
              Height = 19
              Align = faLeft
              AutoExpand = True
              Borders.Sides = sdCustom
              Borders.DrawLeft = True
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
              object rldbValorUnitario: TRLDBText
                Left = 1
                Top = 4
                Width = 79
                Height = 14
                Align = faWidth
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'VL_TOT_PESO_LIQ'
                DataSource = datm_DocumentosExportacao.dsPackingListItem
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Lucida Sans'
                Font.Pitch = fpFixed
                Font.Style = []
                ParentFont = False
              end
            end
            object RLPanel49: TRLPanel
              Left = 630
              Top = 0
              Width = 80
              Height = 19
              Align = faLeft
              AutoExpand = True
              Borders.Sides = sdCustom
              Borders.DrawLeft = True
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
              object rldbVlTotItem: TRLDBText
                Left = 1
                Top = 4
                Width = 79
                Height = 12
                Align = faWidth
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'VL_TOT_PESO_BRUTO'
                DataSource = datm_DocumentosExportacao.dsPackingListItem
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Lucida Sans'
                Font.Pitch = fpFixed
                Font.Style = []
                ParentFont = False
              end
            end
            object RLPanel7: TRLPanel
              Left = 0
              Top = 0
              Width = 100
              Height = 19
              Align = faLeft
              AutoExpand = True
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
              object RLDBText9: TRLDBText
                Left = 0
                Top = 4
                Width = 100
                Height = 12
                Align = faWidth
                Alignment = taCenter
                AutoSize = False
                DataField = 'EMBALAGEM'
                DataSource = datm_DocumentosExportacao.dsPackingListItem
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Lucida Sans'
                Font.Pitch = fpFixed
                Font.Style = []
                ParentFont = False
              end
            end
            object RLPanel9: TRLPanel
              Left = 390
              Top = 0
              Width = 80
              Height = 19
              Align = faLeft
              AutoExpand = True
              Borders.Sides = sdCustom
              Borders.DrawLeft = True
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Lucida Sans'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
              object RLDBText10: TRLDBText
                Left = 1
                Top = 4
                Width = 79
                Height = 12
                Align = faWidth
                Alignment = taCenter
                AutoSize = False
                DataField = 'QT_MERCADORIA'
                DataSource = datm_DocumentosExportacao.dsPackingListItem
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Lucida Sans'
                Font.Pitch = fpFixed
                Font.Style = []
                ParentFont = False
              end
            end
          end
        end
      end
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 324
    Top = 43
  end
end
