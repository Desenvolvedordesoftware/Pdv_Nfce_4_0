﻿object frmxloc_modelo: Tfrmxloc_modelo
  Left = 703
  Top = 215
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Observa'#231#227'o!'
  ClientHeight = 90
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = 0
    Top = 90
    Width = 466
    Height = 3
    Align = alTop
    ExplicitTop = 44
    ExplicitWidth = 708
  end
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 0
    Width = 466
    Height = 90
    Color = 12223546
    ColorHighLight = 12223546
    ColorShadow = 12223546
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 451
    object Label1: TLabel
      Left = 6
      Top = 163
      Width = 114
      Height = 12
      Caption = 'F3 | LOCALIZAR POR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 136
      Top = 163
      Width = 94
      Height = 12
      Caption = 'F4 | REFER'#202'NCIA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 256
      Top = 163
      Width = 2
      Height = 37
    end
    object Label4: TLabel
      Left = 6
      Top = 163
      Width = 12
      Height = 12
      Caption = 'F3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 136
      Top = 163
      Width = 12
      Height = 12
      Caption = 'F4'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 6
      Top = 18
      Width = 307
      Height = 16
      Caption = 'INFORME OBSERVA'#199#195'O A SER IMPRESSOR!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 264
      Top = 180
      Width = 12
      Height = 12
      Caption = 'F5'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 5
      Top = 65
      Width = 362
      Height = 16
      Caption = 'Enter para gravar / Esc para cancelar observa'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object combo_localizar: TComboBox
      Left = 5
      Top = 177
      Width = 118
      Height = 20
      Style = csDropDownList
      Color = 12582911
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Items.Strings = (
        'MODELO'
        'SIGLA')
    end
    object combo_referencia: TComboBox
      Left = 136
      Top = 177
      Width = 97
      Height = 20
      Style = csDropDownList
      Color = 12582911
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = 'IN'#205'CIO'
      Items.Strings = (
        'IN'#205'CIO'
        'PARTE')
    end
    object loc: TEdit
      Left = 5
      Top = 35
      Width = 369
      Height = 24
      CharCase = ecUpperCase
      Color = 12582911
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = locChange
      OnKeyPress = locKeyPress
    end
    object Orçamento: TAdvGlowButton
      Left = 380
      Top = 6
      Width = 85
      Height = 75
      Caption = 'Gravar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
        6D000000097048597300000EC300000EC301C76FA864000000206348524D0000
        7A25000080830000F9FF000080E8000052080001155800003A970000176FD75A
        1F90000008864944415478DABC99EB5353F919C79F999DEDCC76A6339DDDFE01
        DDBEEBBEA9BB9D6D5F75A69D76775D47EE8B8ABA8EAE407272218AE215E4A695
        AB562E2AB99C9344C05557AD1740856C88E2B22C2190730E49B4C072B1545DA4
        482040027EFB2201091709227DF19D49CE9CCCEF73BECFEF79F27B9E4366A4D3
        6CDD45269926D388131832B89454D9A1249D2023635732B10E2571ED2AE24419
        B1A2F4B79C2095B322C37222636205692F2B488759413AACE3A5FD7A87EC2E27
        32E51C2FDDCB8AD235ACC810C7CB886D5790B15345FA072A323AE464702A48C7
        337467EC30DD4316CDE5A15001CF75EF25D6A17C9713E407599171B28214D3D2
        F12F3FCF5CB34B82AF894C17C733C7D876C5AFCF75ED22C3C35D6F06F07C6712
        E904D9DB7AA732871599219697CC83095D12E804A94FEF909D655DAAF7CE3915
        2B047C9044951DCA30AD5DD2A1B3278215560217ECAE96970C1A9DCC76836B09
        400BD283743F7093C12127AD9DC99A7EF2370136D7CD80A3259CC0509D2F8DBE
        43F63C1E324DA507A97E2A936ABD69A46F67CA356D890BEEAF3729AD5D021D2F
        A9BDE5394477A7B2E6F190B6337D46BA1F8F92A1EB10E94549C5EAB8B6B8F442
        82C5D8798074DD478398E8A63B836EBA33A8C69D493746B248D79E9455D612FF
        7F85630529D4B678687845E5B5E79954E3CEA29BEE74BAE9CE20BAD29F4C97FB
        93E9DA9314BADAAFFA33CBAF7E58174C1C5E0A9D3D0197FB92B65F7F924297FB
        93E94A7F325179EF7EAAEC3B485CE7DEB7CE5A137E5A591959A17809CE5AE3C1
        75EC79AFB2EF1095F7EE27FAE6592A5D194CA78A4E558EC6B6DAA1952C591134
        B6785474247D7DE5D911FA66309548E3DA431AE7EE77B4BCD4C7AD5A6230E044
        198A5B37A0C8F6053881012B300BDECB095268ED89D038541F685C7B880C8EDD
        A4171407593E71F5E00406F9D6B5A8ED52C3D2538E82E6B5D0099200E842BF49
        0427C8CF181CBB89F4A2823881E95B4DB802EB5A5C72650093000054779C425E
        F3A7D00989AF80649E73A2E26D6245C56F5613AED0BA0E975C1998F2022FBC80
        6F02C02450DD598402EBBA57EE574E9487132730AAD500E40419F29BD7E2A22B
        1D535E003E6078741CC3A3E3989C003005343CAAC4197E0B748BEC7D4E906A48
        2F32E52C1FDA826AFB0E94D9B7831365AFBE579421AFF9335C741D81CFFB02F0
        01EED1718C7826E01E1D8767CC1F6B6BF71DE47DB70E06A77CB128D493DE21B3
        CC3BBBCDFD1B12E538D3F62534FC4E68F80494B6C6412F2A1609AB0CF9B3E126
        FDCE4DC38D8F4F01009ABA6FE240F5C7385ABB16EAD69D38E74A9A57B8399179
        48AC207DB4145C695B1C4EB644A267D08127EE1E9C6EDB82225BCC1CC8E96CFD
        3CC8B9D9706301B81F7AAA9052F53B64D77D8A7C7334724C1128B37D85732EE5
        DCF5078815A49EA5E122E0FAA91178E1CFC2DE21178A5B37A2B835167A511E94
        10175C6998F4629E73D370CD3D3548A95A83ECBA4F516889457E7D3472BF8D9C
        81343A8320475E09A8E177E274DB66389F36020046C77C707B26801740DFD043
        14D96251D2BA1106518902EBE7B8E04CF5C3CD736E3200571D80FB64066E5A7E
        C8F0B99023A4E3A5FF592CCD4F58D743786C01008C78BC707BFC8B8E7ABC7EC8
        FF3E40716B2C321BFF888BAE54F82626170D6B734F35F6557D88AC05E016820C
        ECC941323865F7B58B24C999B6ADB8E83A8CA1D1416012708F4EF817F64C60D4
        E3035E00AEA74DB8F4E00846C7BCC161F5CC76AE06FBAA3E4476DDDF16859B0B
        79B665072A1EAA3A49DFCE7CAD5BE404A317E538D112069DC060D833044CCD86
        1CC788C7EBAF693E7F010E726ECCEF9CB5F73652AAD620ABF69325E15E424620
        C71481B3B61D0DC4F1D2FD4B65F14BC8E741902301273D635333DF673BD7D27B
        27E05CE8703390E608E49BA38CC48A8A0F963C8E8B729C6809072B3070CF7172
        B6DC9E5945B8F776C8615D4879F55138716F631C71829C58413AB01CC8859C9C
        1DD696DEDBD857F511B26A5F0FCEAF18EFC9868D3F2743FB2EE204797E28C72D
        BD28C7096B580072DAC9F1A052E20FEB47C8AAFDEB6BC3E59A2351608EA92CAA
        8F23D23854A46E57FE4A6B97800BA5FB12E528B4AE072728E0F63C072601CF98
        0F00D0FAA8CE5F4A5600576089C1F1BA089C34C7FCA1D4BC89E8D2B30374F9D9
        612AEF506AB4211EF9F5A21C852DEBC10972B83D6E0080ADAF16FBAB7FBFC2B0
        46E3D89D7094366DB973BD4345573B1444E71F1FA20B8FD3C8D0B3EF1765B6C4
        89509B26BD28C7496B38FED9F17734765F415ACD9F9055B732B83C7314B26F85
        A1CCB5FDFDF3FF5690B14F4254D9A9A28A4E155DEC4EA60B5DF24D3A7B0274A1
        36DBA21C65FC3614FE108E1CF37AE49AA25E1B2EBF3E1A397591286DDA7A5063
        FF8A4A6D5BE974CB97445543A95435944AB786D2E8C6F323A415151AF5321A77
        1D2F81C121F79F64EAA371BC2E7CF97096681CBB15863C4B94F9EA4012553FDB
        43D70676D1F5815D445C4FE64BF51D2363D721E2F8843A9D5D02560CBD9D343A
        FD47AFFCFA68E498C2971DDA9CDA28A7BA7DDB5B158F7792BE773B19025A7078
        54E74D238343F6ADA63561593DEFEB40E69822916B8A6CBF3194F2CB86A96C32
        4DA50569DEB8EB1E32E81EB2A8A243496A9BA47CB9BD88C11122A4390A79E648
        E49AA36B0A2C1B7E56EB4DA5EF719C2CC80CD2BC81A10519548F74323E5010E7
        5052C5BF94F15ABBC4EB1F6086E6E434648165E13D996B8A448E2912A7EE6F38
        50DCB499F2EBBFA0EA91FD741F47979EB0CE00BA1464702AE97C978AB482EC7D
        BD53C14ECF4F42019D1DEE69C8BCFA28E499A370B221F6EAA9A6B835254D9BA9
        A4298EF2CC31AF07A87728A9B223C93F44FF712FB10EE5C79C202B6245E67168
        D9AD804E90A0C012833C73D470BE3946F38F860D7F51B76DA392D6AD54D4B889
        8ABFDFF466008D9DC9A47324055E43C8DF6145691827484B5881A9E3FC53FFA7
        D3AF2158413AC089CC4356905ACA5D496A755BFCA67C73F4BB85E6582A6ADC48
        6ADB562A6AD91C12E0FF0600783C0BEA8110C4080000000049454E44AE426082}
      Transparent = True
      TabOrder = 3
      Visible = False
      OnClick = GravarClick
      Appearance.BorderColor = 14727579
      Appearance.BorderColorHot = 10079963
      Appearance.BorderColorDown = 4548219
      Appearance.Color = 15653832
      Appearance.ColorTo = 16178633
      Appearance.ColorChecked = 7915518
      Appearance.ColorCheckedTo = 11918331
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 7778289
      Appearance.ColorDownTo = 4296947
      Appearance.ColorHot = 15465983
      Appearance.ColorHotTo = 11332863
      Appearance.ColorMirror = 15586496
      Appearance.ColorMirrorTo = 16245200
      Appearance.ColorMirrorHot = 5888767
      Appearance.ColorMirrorHotTo = 10807807
      Appearance.ColorMirrorDown = 946929
      Appearance.ColorMirrorDownTo = 5021693
      Appearance.ColorMirrorChecked = 10480637
      Appearance.ColorMirrorCheckedTo = 5682430
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
      Layout = blGlyphTop
    end
  end
  object GRID: TwwDBGrid
    Left = 0
    Top = 296
    Width = 662
    Height = 45
    Selected.Strings = (
      'SINTEGRA'#9'8'#9'C'#243'digo'
      'MODELO'#9'92'#9'Descri'#231#227'o'
      'SIGLA'#9'12'#9'SIGLA')
    IniAttributes.Delimiter = ';;'
    IniAttributes.UnicodeIniFile = False
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = ds
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 1
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    OnDblClick = GRIDDblClick
    OnEnter = GRIDEnter
    OnExit = GRIDExit
    OnKeyPress = GRIDKeyPress
    PaintOptions.AlternatingRowColor = 16316664
    PaintOptions.ActiveRecordColor = clBlack
  end
  object PopupMenu1: TPopupMenu
    Left = 352
    Top = 120
    object Localizarpor1: TMenuItem
      Caption = 'Localizar por...'
      ShortCut = 114
      OnClick = Localizarpor1Click
    end
    object Referncia1: TMenuItem
      Caption = 'Refer'#234'ncia da Pesquisa'
      ShortCut = 115
      OnClick = Referncia1Click
    end
    object ParmetrosdaPesquisa1: TMenuItem
      Caption = 'Par'#226'metros da Pesquisa'
      ShortCut = 116
      OnClick = ParmetrosdaPesquisa1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Fechar1: TMenuItem
      Caption = 'Fechar/Voltar'
      ShortCut = 27
      OnClick = Fechar1Click
    end
  end
  object ds: TDataSource
    DataSet = query
    Left = 464
    Top = 200
  end
  object query: TZQuery
    AfterApplyUpdates = Fechar1Click
    SQL.Strings = (
      'select * from c000082')
    Params = <>
    Left = 248
    Top = 176
  end
  object qrobs_orcamento: TUniQuery
    Connection = frmModulo.conexao
    Left = 240
    Top = 104
  end
end
