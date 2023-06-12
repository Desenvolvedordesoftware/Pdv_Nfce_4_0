object frmCliente_consulta: TfrmCliente_consulta
  Left = 3
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmCliente_consulta'
  ClientHeight = 583
  ClientWidth = 790
  Color = 12615680
  Constraints.MinHeight = 532
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 583
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 786
      Height = 579
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 2
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object pnFundo: TPanel
        Left = 2
        Top = 2
        Width = 782
        Height = 575
        Align = alClient
        BevelOuter = bvNone
        Color = 6960384
        ParentBackground = False
        TabOrder = 0
        OnClick = pnFundoClick
        DesignSize = (
          782
          575)
        object lb_status: TRzLabel
          Left = 31
          Top = 550
          Width = 410
          Height = 25
          AutoSize = False
          Caption = 'Informe o C'#243'digo, CPF ou Nome do Cliente...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ShadowColor = clBlack
          TextStyle = tsShadow
        end
        object RzLabel1: TRzLabel
          Left = 30
          Top = 100
          Width = 79
          Height = 29
          Caption = 'Cliente:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ShadowColor = clBlack
        end
        object lb_cliente: TRzLabel
          Left = 30
          Top = 19
          Width = 312
          Height = 45
          Caption = 'Consulta de Cliente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -37
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ShadowColor = clBlack
        end
        object pn_cliente_info: TFlatPanel
          Left = 31
          Top = 156
          Width = 735
          Height = 378
          Color = clWhite
          Visible = False
          ColorHighLight = clWhite
          ColorShadow = clWhite
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 16
            Width = 88
            Height = 16
            Caption = 'Nome......:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_nome: TLabel
            Left = 104
            Top = 16
            Width = 8
            Height = 16
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 8
            Top = 32
            Width = 88
            Height = 16
            Caption = 'CPF/CNPJ..:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_cpf: TLabel
            Left = 104
            Top = 32
            Width = 8
            Height = 16
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 8
            Top = 48
            Width = 88
            Height = 16
            Caption = 'Endere'#231'o..:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_endereco: TLabel
            Left = 104
            Top = 48
            Width = 600
            Height = 16
            AutoSize = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 8
            Top = 64
            Width = 88
            Height = 16
            Caption = 'Bairro....:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_bairro: TLabel
            Left = 104
            Top = 64
            Width = 600
            Height = 16
            AutoSize = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 8
            Top = 80
            Width = 88
            Height = 16
            Caption = 'Complement:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_complemento: TLabel
            Left = 104
            Top = 80
            Width = 600
            Height = 16
            AutoSize = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 8
            Top = 96
            Width = 88
            Height = 16
            Caption = 'Cidade/UF.:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_cidade: TLabel
            Left = 104
            Top = 96
            Width = 600
            Height = 16
            AutoSize = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 8
            Top = 128
            Width = 88
            Height = 16
            Caption = 'Cadastro..:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_cadastro: TLabel
            Left = 104
            Top = 128
            Width = 600
            Height = 16
            AutoSize = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 8
            Top = 144
            Width = 88
            Height = 16
            Caption = 'Limite....:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_limite: TLabel
            Left = 104
            Top = 144
            Width = 100
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 8
            Top = 160
            Width = 88
            Height = 16
            Caption = 'Utilizado.:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_utilizado: TLabel
            Left = 104
            Top = 160
            Width = 100
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 8
            Top = 176
            Width = 88
            Height = 16
            Caption = 'Dispon'#237'vel:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_disponivel: TLabel
            Left = 104
            Top = 176
            Width = 100
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_atualizado: TLabel
            Left = 136
            Top = 352
            Width = 289
            Height = 16
            AutoSize = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 8
            Top = 352
            Width = 120
            Height = 16
            Caption = 'Atualizado em :'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Edit1: TEdit
            Left = 0
            Top = 312
            Width = 0
            Height = 21
            TabOrder = 0
            OnExit = Edit1Exit
            OnKeyPress = Edit1KeyPress
          end
        end
        object grid: TNextGrid
          Left = 30
          Top = 155
          Width = 735
          Height = 378
          Touch.InteractiveGestures = [igPan, igPressAndTap]
          Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
          AppearanceOptions = [aoHighlightSlideCells]
          BorderStyle = bsNone
          Caption = ''
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          GridLinesStyle = lsVerticalOnly
          HideScrollBar = False
          Options = [goGrid, goHeader, goSelectFullRow]
          ParentFont = False
          TabOrder = 1
          TabStop = True
          OnEnter = gridEnter
          OnKeyPress = gridKeyPress
          object NxNumberColumn1: TNxNumberColumn
            DefaultValue = '0'
            DefaultWidth = 49
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            Header.Caption = 'C'#243'digo'
            Header.Alignment = taCenter
            Header.Font.Charset = DEFAULT_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -11
            Header.Font.Name = 'Tahoma'
            Header.Font.Style = []
            ParentFont = False
            Position = 0
            SortType = stNumeric
            Width = 49
            Increment = 1
            Precision = 0
          end
          object NxTextColumn1: TNxTextColumn
            DefaultWidth = 334
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            Header.Caption = 'Nome'
            Header.Alignment = taCenter
            Header.Font.Charset = DEFAULT_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -11
            Header.Font.Name = 'Tahoma'
            Header.Font.Style = []
            ParentFont = False
            Position = 1
            SortType = stAlphabetic
            Width = 334
          end
          object NxTextColumn2: TNxTextColumn
            DefaultWidth = 134
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            Header.Caption = 'CPF/CNPJ'
            Header.Alignment = taCenter
            Header.Font.Charset = DEFAULT_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -11
            Header.Font.Name = 'Tahoma'
            Header.Font.Style = []
            ParentFont = False
            Position = 2
            SortType = stAlphabetic
            Width = 134
          end
          object NxTextColumn3: TNxTextColumn
            DefaultWidth = 201
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            Header.Caption = 'Endere'#231'o'
            Header.Alignment = taCenter
            Header.Font.Charset = DEFAULT_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -11
            Header.Font.Name = 'Tahoma'
            Header.Font.Style = []
            ParentFont = False
            Position = 3
            SortType = stAlphabetic
            Width = 201
          end
        end
        object ed_cliente: TRzEdit
          Left = 135
          Top = 102
          Width = 626
          Height = 31
          Text = ''
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FrameStyle = fsNone
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentFont = False
          TabOrder = 2
          OnEnter = ed_clienteEnter
          OnKeyPress = ed_clienteKeyPress
        end
        object AdvMetroButton1: TAdvMetroButton
          Left = 730
          Top = 10
          Width = 36
          Height = 41
          Anchors = [akTop, akRight]
          Appearance.PictureColor = clWhite
          Caption = ''
          Picture.Data = {
            89504E470D0A1A0A0000000D494844520000002A0000002A0806000000C5C3C9
            5B0000001974455874536F6674776172650041646F626520496D616765526561
            647971C9653C0000032269545874584D4C3A636F6D2E61646F62652E786D7000
            000000003C3F787061636B657420626567696E3D22EFBBBF222069643D225735
            4D304D7043656869487A7265537A4E54637A6B633964223F3E203C783A786D70
            6D65746120786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A
            786D70746B3D2241646F626520584D5020436F726520352E332D633031312036
            362E3134353636312C20323031322F30322F30362D31343A35363A3237202020
            2020202020223E203C7264663A52444620786D6C6E733A7264663D2268747470
            3A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E
            7461782D6E7323223E203C7264663A4465736372697074696F6E207264663A61
            626F75743D222220786D6C6E733A786D703D22687474703A2F2F6E732E61646F
            62652E636F6D2F7861702F312E302F2220786D6C6E733A786D704D4D3D226874
            74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F222078
            6D6C6E733A73745265663D22687474703A2F2F6E732E61646F62652E636F6D2F
            7861702F312E302F73547970652F5265736F75726365526566232220786D703A
            43726561746F72546F6F6C3D2241646F62652050686F746F73686F7020435336
            202857696E646F7773292220786D704D4D3A496E7374616E636549443D22786D
            702E6969643A3445414132443945303444303131453538344545414445343436
            3535353531312220786D704D4D3A446F63756D656E7449443D22786D702E6469
            643A344541413244394630344430313145353834454541444534343635353535
            3131223E203C786D704D4D3A4465726976656446726F6D2073745265663A696E
            7374616E636549443D22786D702E6969643A3445414132443943303444303131
            453538344545414445343436353535353131222073745265663A646F63756D65
            6E7449443D22786D702E6469643A344541413244394430344430313145353834
            4545414445343436353535353131222F3E203C2F7264663A4465736372697074
            696F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F78
            7061636B657420656E643D2272223F3E4B533802000004B14944415478DAD499
            7968554714C65F1215778D2651A352637109C605036EE082A2455C6A5D506825
            54105C402B05A960ABE03F820A2AA2E082FE218A2888FB52975A49085151DBB8
            15375C316AAAC625C6C4EB77E01B3D0EBEF7665EDE7BE0811FF7BE3B73CF7C77
            EEDC9973E6A5044110FA1AAC4E2DEF6F023A806EA02B680B9A8306A012FC0F1E
            82CBE02AB8092A40902CA11DC170F03DE80D5A39DCF3045C007BC1617003BC77
            6D30C5F3D54BEF4D063F832EEAFA6B50069E9337A03E7BB729C8028D54FD5B60
            0BD806AEC75BE838301FF457D72E82425002AEF135BF0255A02E878688EC0CF2
            C1401E8D9D03CBC0CEA8BD2B42A3D0002C02CF824F560C6680AE0EF76BBE05D3
            C029E5EB25580A9A45BA379AE3266003A8A15311FB07E8E029D0A61D980FCA94
            E0ED202B16A10DC13AE5A8147C07D26A29D220C36E083867894DF715BA44F564
            09E81E2781369DC009B6F31E2CE74338099DA8C6E4BF0914A9C76E09DB7B0D0A
            5C84760467D5981C9A6091867EE0A11A66B99184A682DF59B986033E25494285
            59E01DDB972150279CD0CEE0162BFE0D32922832C429EA00DB9719A1A7294B55
            53AA9C8FE6EAF3166CE0B2974C93556D13780932C1789066C4196BCAB55BEC3C
            38E2D140373EE0974C0295EE1EBE8E83629E8F0119F6CAD417BC61B72FF6785D
            23C04D5008BA7C6128FDC5E134CEC3E7AF9CAA64BC0EB3C7E84C8A7C0C463A3A
            1C4691C644540ECB72F8DBD87D30D6D1EF60D617FBCD1EA33D787CC000C3C546
            821CF57B3058CDC065357F1BCBE6AB743169FF2ECFF3EC576FBEB683A091E393
            4BAF1D0E3EB76A50C1A3B6427B6E8C804C4B3BD4ECF3598F9AE0F71143351793
            B8723A38A6AEC957DAD87CADB462C6B0571CFD56333BF8A84B0B35816D95E794
            22AFA8001C0D537E1AFC08FEF3F45BC163335B688A09516398FF5E71EE0D5716
            CB7C1C685DA9563A116264EE6312C16F06A3C2940F67DA91E5E9B7318F2F6CA1
            8FD49868E8E84CEAAE053F58BE6A548FA4B17C9D63126874A5F3BCCC167A57AD
            24998E0EE78109D635F970268193D675590E173AFA95D5E81B9EDFB18596F2D8
            0674727458C47957FB98037683B9E08C2A7BCAFA2E26EDB7E3F9257B1E1D08AA
            F46AE0882C8DF7C025D0DF2AEBC55443E2CC9F3C7CFEC279B8DAAC92BA5042BA
            220A952CB18587E301202F4C9964AA833C7C49AEB65F05D0D9B650099A17A814
            765292635183F46039752C35C1B35D294FA50387A2E5DA094096EE9D6CFF29C8
            0F17E1A7F129028658B3922C742AA864FB6B22A52221060EA5AC2CBDDB274922
            25D3BDCD76AFF3438C9A2E17A820BA280E3B23D16803FE54B9FD6C3BA90C77A3
            7C582B7993D8B1048A6D0BF6A8707023A8EFB353D2925B2C3A9E1C106791BDD5
            2E49C098383B964D32D9B4DAA51CDDE36BC9AAA540E984E9E086F22DB34CFB58
            77F38CD3556ACC1AA753406B4F81999C9FF7295F32BBAC0FD79306D78DDCBA0C
            7E6523375705D812809C026719183F61C05BCD6D7709D55A70773A9F39543FEE
            F187B8DBBC826160653CB7C6257F9FCA88BEB5BA5ECE30F131838F777C3811D9
            927533ACFA5B19C75E48C41EBEE9DD5CEEAA08BD540F4532C900FE0187F88743
            6984AC202E42751297CED7DA93E2B3D973F5D8ABD273F799D45D641A5CCEA1E1
            65B5119A54FB20C0004E7B10B44195D3E70000000049454E44AE426082}
          TabOrder = 3
          Version = '1.1.2.0'
          OnClick = AdvMetroButton1Click
        end
        object cadastra_cliente: TAdvMetroButton
          Left = 361
          Top = 19
          Width = 95
          Height = 62
          Anchors = [akTop, akRight]
          Appearance.PictureColor = clWhite
          Caption = 'Cadastra Cliente'
          Picture.Data = {
            89504E470D0A1A0A0000000D49484452000000E1000000E10803000000096D22
            4800000081504C5445FFFFFF000000F6F6F6FBFBFBF8F8F8DBDBDBE2E2E2F2F2
            F2C6C6C6E9E9E9D6D6D6A8A8A8DFDFDFB4B4B4CDCDCDC1C1C13C3C3C5656561B
            1B1B808080707070151515BBBBBB8F8F8F7676766565655B5B5B2B2B2B9F9F9F
            464646505050ADADAD2E2E2E2323236262628686869393934949493939390B0B
            0BA2A2A27C7C7C18181840C22B4D00000D9449444154789CD55DEB62AA300C16
            441115EF3A9D7A94E9E6CE79FF073C0A22699BD2F4A2D4EFDF9C42036D2E5FD2
            B4D57A01A24E3AF8D84C8ED9F2122CB39FFD74FE9BF6E3F62B6EFD02740FEB49
            80225BECFA71D3C3B345E72491AEC472B38A9A1EA439DA839F7AF1EEF8EA353D
            5233C43B927839B687377C91BB0B5DC02B66BB3793B1AF587E08B255D383D6C1
            87B67C37FCE9363D6E2AE26F2301AF18343D741A3A99A98041B06E7AF014F4CD
            E5BBE227697AFC4AD8097845A7690914E8D80AE8BB8871662F61D06F5A8A3AFC
            71206010786C354E4E040C8EDEC655D65AA6C4A6694964A0851214FC362D0A0E
            8D6042092F9762387328E157D3D26070F90A83C0C3A8B8ED54C060D6B43C22CE
            6E25F430CE702C60B06D5A201E63D71206A3A645E2B0712EE167D322B148F488
            2712FCB28907F7027AA66BBE9E20A157DE696429CC1CFD346C5A2C00CBA8E212
            FEC33EF6C9AFB1F4D8FEB456D8C71F4D8B0530B59370DD6AED51C1FD819D80C1
            AED51A619F372D5685AEA58437F7E513F9DC1F36C3D6651BB6F097E80FEB36B0
            13709B67D6909798362DD8036B53D9B2DC53283C50844C3E342C57054C1152B0
            EDE63AEAEE9E8939477F08A9AD9980C7B858C2F7E526FAB6E766C5AA10D57350
            B2FF4EF31F9F1F464174FDE6CDC9C422A915702EA1514B8F65732AAF232CE745
            43020918D609B897C83F2E7FDD7ED4280846C79BE8A2CEEF5EC6A8CBB9C5C2DB
            28E3BEE5CD2C453DAE3B3A28BFB1C0BD15BEC2C11B4D5323E13500E25F4C20B7
            73FC84F6C61ECA251C6086FC539EABE7FC1A6F7C1AA9843775C9878EB371CD95
            389DE54D11914CC25CD9B3AF653BA88F17D845EB0D652A9130B7E8F1127CB24F
            55F110FB12BDA93EC5AD4511A103E91794608851A7CF1DB606D012933B05518E
            F89B5A60091C9BC9F386AC092CC42F39F93CECD89FE9FC3588354FEA6FBF0888
            5F567A94E1F54DECB4E87990A5F327780A97BC800F1E70B4D32D5403152B7576
            E5C5E0E2C37F3654EE4258CA3E802D285D5B29799801F1C61E3284F0C4920284
            4FCB9B1422A3697E2C2FC6C4CBBE549BA6705033BB8C5198C18BF9E27AFF6596
            A15DEA96B53CBE84C06CCDA55D052CEB1F4D1D8DD0126D966AB2CBFAF5986BFD
            F8B1CF243C32A3DA595D6CE7A3845CE9B3DD8E82B58F1272A4BEDDDA6173ADB6
            C6D515D8428CCCC65CB0C6C29B224CAE92C2C64C73618A2F7422ABFFACF8238E
            3EF6C531E5A2279B120A8E13F6C56BE3F8341B55C32A1A6F3233FC34B5B8127B
            217FF2F8ADA3A381B1ACDDD1D9F8ECC1E6C5CCBD1AD6A3F125B2C8C1E4E0F7C6
            97617C077FC8C41B58DADBD4D762F3DCBE988A3B18356F4A92311ACB97D8F001
            1842996A79E8767B57ABCFE45432B3691A4156D2C3ADA4D0E1325B4270317BA5
            474BFC56E3FB6B7401C0F7F8543C0B0008F92282EAD2C2BB76415E455529B4B7
            FBF22BFFB4882F06A5E7DC5D9DE7295C59FD747E4E87F73F92A2B0AD9AE6DE30
            C102E2C718BFF3BF7B45043BBA4BFE5DBA73FDBB659F16ACD5BD414D65EE5F3E
            703AAA683F9F7849B0E97706404316FE1CF0CDB241BFBF2982A42A0BE9E922CC
            51F9A7C54A123677DF062F743E2932A1155330ACB943D30016AD588242315E2A
            6E3C28146F35C33DA18125A8DECF9D62490EA7CD623D3F9D07E96A7C6FED1576
            7AAB74703ECDD78BCDE970D746D5EBF6A68A0645B598967A59C4F8B1F9ED9F27
            0CA20C550E434F5F9C0D7FF77A00CF4B8746022CA23765423254395C9DFAD7AF
            B77985CC4BA4FBDFA3377A859010A4F728A9824B5F58EE3A80F7419D7195A5B0
            CC91BF08801FA6654B0179E14F19541D60B44F595561B50FDC3FEA0207284DA3
            108B8042F488E4AE07604FD52603641FFDB714256041852A5C07C947BF28E07A
            C04627F59C0D28D47B9F397A03644F3F6BCC224C90BFCF1CBD2106230F8EB232
            A9217C107E878522D844069E8D62324DDBB7B0F510ECDEE0BD68FBC76C918A5F
            9D4C48E036CB64CC5E8B30CDD87F7B48E2AB21748E9A9E47DD244986BDB3D083
            E1ADD468057AB78C371590DC9767F9566BB0BD82C3ED50FAF07DC105DA5DF94D
            44F54FFF581F265477C8622DC93C589EBC9DB3C92E37E017D6B08DEB7B647DB3
            0477515EF5A3BD0FE50568A70F0A8AEB60D5AEE95F3EE3F7C13E56EEB77223DF
            4BD11E41F6FEC8FF3B3CE34D1726E23E5F58B5B21EF92264E7832D8942747FBB
            B7E075CEF12FB2DCB89D8CC70F0F1C81F02036EC40A3DEA8B39B975FDD9F7EF1
            F4F042B8D6E4D0A8BFDA1E639D81EAD9EEBA328D18BDDAE7B8A9D9DA9FCBD4A4
            69619BAC93CF65DE8001E9EEA447582C46A6132BEC89D3B49CAD7AFB34AD114B
            47B24FED361084A9F4C96D5E47F847D27EB37B61057657E3AEFC9586496F2CBC
            9B04EF3178C5F945DB2F52B405600E7E274292A7132F5F292664986E720F66CA
            3F16796BF77FAF28958A6B3D4D2EDDF4C897CE045DD13D65E53FBFD9FFB4EB3A
            9F3F7FAAA2DD662AB01BCC998D89D34EAB7B5E5C711A5FBD042606667D9BDA86
            3ECF4EF347520D73079B78E0BA9A3E8CE789BB0C5B03A5EA2ABD79A20FD05577
            CE87A1026EC03130534F7984C4CFD30A6E28CD03A1B1574C3700E87E529ECB93
            76EA934E713A6A3E9102706D91A88F673494087117540050FDF4768A30314ABB
            CFA7F3C518510FAF0016CB4C42E24F5C6FBE8C8FEA7B16007A31557FFB0EF058
            7AEA6F17D83AB58C49461E2CA8F6220F166A0E7A1FCD994332A72BF7D3445419
            8AFA6E831060AC1A5D26DDF1AC7A4D742B3631A28E765BAD29BDBED98E44D4EC
            120C86CB7B40E54E4CDEB5053B50340F167462FB13DDF3632A1F9B33888BD6A8
            7743CC8B0E96A1E6C9824B076B31226BD112A0708B313170AF1023226887425F
            BA776CED8D86FE416360C0D03F61D3F4D0BD06A1857ECF652EF4D2C75FF53D04
            8099F3783E7B9EF91C3E52C0B05912D17182B0DC7D62746E05A0F5C38275B960
            67550C0AC53301FE97D1814356E760989D79005F4AB4BE6DAAC0DD8F70905D5F
            017430CD5A9F5B508DA66738315EF1B0AE40B1C74E5E55802D8139636C7A3C8E
            31D160783FE37EC374CF9983E91ED2BA76BDB530A4E0B46DD303A646CAFC8448
            33C36F712C87E1DAD73FEBBA84517B3E056F580B339281CEEB883058FA6D9B33
            AACC2A456D4EABB9E8EB53BB53538DD685814353417BDA581E5D6C9241A4D3AB
            287413E29627C599B4C630364E05348DA2F5E9D3127BD1397F9E650FDBD0A179
            40EF255A2D891B70DD5644F0927267DB5B6A1519DB9F5D8CF6212B1D6B9494A7
            337332E85861EB57182CB1695A86FC688F5369E6970C8D97687B42D50DC8D6BC
            C7F69F0B46C91B1E560341A7DEEC1F27BECDA2E4B4B0A3705D1CEA4D6E6913EB
            10C032FC204E4639F9B1AE102E0E4C26EFAE7673E426426596D10AE6F1E8335E
            08A88486B98B0F81B935FDDB62DB623ACF3C548320FAC32EF44C20A3F9FA2B5C
            A73B3AAA95C681BB3A7F5A2BFBE5E83C61DA3662177AE6061D6AC1D5B9E54BCA
            CD5CA8ED1C3A7D749C1D7A4DF16BDC9D73AF11949A50EB2828619B66F6A7061A
            7DAF9DDD9310B6393C619B9E5170B632828B9A5DB077F11FA0EF3D77A5BE03CA
            C471E193962087336E7C8C1C6ADFD4F2F06206D426178E7C8C1CCA102A7679D0
            3D357B6979162D838BCAD1B0616545104945FB801B40E5B8B97C9C545F5F4223
            6ECC5482EA9E7644300F9A5B833B34DBD04CEBA9A861978A2620BA3578A1D76D
            869B581195AAD12D9E51809430417F59F03C062E24469128EF660E4AAE14CD8B
            96ABC9402FD4DFCD4DA85DE14290102BF4AA16937E685CAFC01DFA6C0508FDBE
            32F157904FD6CE632AFC36A7A629A024BD100B7C64BEA0193BAAF477E4D045BC
            41CD0DFD8A3FE2E699560183BA3ADA09590AA0E4A1451A5198D91AC115853275
            E90607EAA05BD46D08BFD3114E58948144ECBBD536ECB2E8AD3FD7AC26101409
            9A7BEB12030222AD60998CE500B33085F7C2C4FE7C5E54A22812D2E221D37B4E
            454CC5EB828F22EEDB529E25266CF8D0E02F1D31D039407EBD2C373E561F717A
            32939B6BB5BAD13AA8DC6510F5B828963FE4621919EF11A5EA9040B3E72262A5
            4C51297F247FC87E1577D4939452C4A05DE0E2EE2D56DC50999CA8262E5BF321
            0C328CFB03E2261A834A6167EAA62215CB60BEB2CA4C74B489DAED288C93A4DB
            1DF67B838FF53423DFC4A8FED2592EA12A7419DE7CC2096052988E6659B63D6E
            B3D9D2800C33ACD975C544C3C9978CA1B674E53F191FBA3374432DCA8B3FDDAC
            84A5C5DEA064AFBE3E015223E7242FBAB7DA88D8763206992976423F6F6C7BBB
            B8489AC8CA065DF8F80E7A82DA544397903C66075920278D3286DABBD7044882
            1A72D427C38FAB5DA4B6959F929497B535727802A4B55647AF6ABBC4ADB674F1
            185A125468CC60578D28ECF7B3855DCA06CB95DA39344FE8ABDCA17655C08091
            8A3661F6F139CDBF34F7593340949E459AEB198D3F72F4CD5FA3A815CCCB5AF6
            CFECDE661C178B95EDC6C199161DA38F90DEB78285E01E1B5E68F1FCAE6D7DB3
            6A5E6107426672953FAF397E95EFC54D1BDBEF6135EEF546FD516F3C4E073B13
            9F74FBA4EE49080E2EAB6EC878F202E4F09BBD58BC6CF7EA1E9FD14B65DC1E5E
            D43291413BB50FAB68C89A6B9B3C725C7E8362DAECF1D59DAAC1E35330FB68BE
            257DB8FA520FD41053B42D680388778E4BA9726C775E9D32D739DB0457228E27
            0F5A79F318EE9CECCEBA62BAF350BC02C96A6ECB9F5DD6A957931341926E4C4B
            7266EBD4C343115024A3DD97DEBA9C7C9D7BCDDB054D24FDC3C74299DAB9EC17
            A741FF5D5E1D8676D8E9DD82A5CFFDE4B8BD653F2FCB5976FCD96FE6BB413AEE
            444FF7C7FE0351C7B8ACD1EECD060000000049454E44AE426082}
          TabOrder = 4
          Version = '1.1.2.0'
          OnClick = cadastra_clienteClick
        end
      end
    end
  end
end
