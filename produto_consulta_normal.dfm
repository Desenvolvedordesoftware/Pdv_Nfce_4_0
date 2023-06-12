object frmProduto_consulta_normal: TfrmProduto_consulta_normal
  Left = 347
  Top = 271
  BorderStyle = bsDialog
  Caption = 'Produto'
  ClientHeight = 404
  ClientWidth = 716
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TNextGrid
    Left = 705
    Top = 487
    Width = 73
    Height = 70
    AppearanceOptions = [aoHighlightSlideCells]
    Caption = ''
    EnableVisualStyles = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLinesStyle = lsFramed
    HideScrollBar = False
    Options = [goGrid, goHeader, goSelectFullRow]
    ParentFont = False
    TabOrder = 0
    TabStop = True
    OnDblClick = gridDblClick
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
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxTextColumn2: TNxTextColumn
      DefaultWidth = 96
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Header.Caption = 'C'#243'digo de Barras'
      Header.Alignment = taCenter
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      ParentFont = False
      Position = 1
      SortType = stAlphabetic
      Width = 96
    end
    object NxTextColumn1: TNxTextColumn
      DefaultWidth = 296
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Header.Caption = 'Produto'
      Header.Alignment = taCenter
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      ParentFont = False
      Position = 2
      SortType = stAlphabetic
      Width = 296
    end
    object NxTextColumn3: TNxTextColumn
      DefaultWidth = 35
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Header.Caption = 'Un.'
      Header.Alignment = taCenter
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      ParentFont = False
      Position = 3
      SortType = stAlphabetic
      Width = 35
    end
    object NxNumberColumn3: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Header.Caption = 'Pre'#231'o'
      Header.Alignment = taCenter
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      ParentFont = False
      Position = 4
      SortType = stNumeric
      FormatMask = '###,###,##0.00'
      Increment = 1.000000000000000000
      Precision = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 716
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = 15830313
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 152
      Width = 42
      Height = 13
      Caption = 'Produto:'
    end
    object Label2: TLabel
      Left = 0
      Top = 0
      Width = 716
      Height = 33
      Align = alTop
      Alignment = taCenter
      Caption = 'PEDIDO DE COMPRA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 281
    end
    object ed_barra: TRzEdit
      Left = 79
      Top = 149
      Width = 90
      Height = 21
      Text = ''
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FrameStyle = fsNone
      FramingPreference = fpCustomFraming
      ParentFont = False
      TabOrder = 0
      OnKeyPress = ed_barraKeyPress
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 336
    Width = 716
    Height = 68
    Panels = <>
  end
  object grid1: TwwDBGrid
    Left = 0
    Top = 41
    Width = 716
    Height = 295
    IniAttributes.Delimiter = ';;'
    IniAttributes.UnicodeIniFile = False
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = ds1
    TabOrder = 3
    TitleAlignment = taLeftJustify
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object Imprimir: TAdvGlowButton
    Left = 32
    Top = 341
    Width = 90
    Height = 60
    Caption = 'Imprimir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ParentFont = False
    Picture.Data = {
      89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
      F40000000473424954080808087C086488000000097048597300000B1300000B
      1301009A9C18000004B2494441545885E596BB6F54471487BF997BD75CAFE35D
      6C073B92D7EB87122B451264A58126CA7F4190108545454581122A9414292CB9
      A17511A1943C2A5290848E34900645B28241C46F8C76177977FD60EFCEDC9914
      F7E15D7B778D4DA832D268CE3D6766CEEF3CEFC0FF7D884EC21B376E4C29A53E
      7D1705AEEBCE5FB972E5AF2303989D9DFDF0CC99334BF97CBEC75A7B2CE54208
      969696B61F3F7E3C7EF5EAD552AB3DB2DD61ADF5D7F97CBE474A8910E258534A
      492E97EBD15A7FD54E8FDBC9026B2DD65A7CDF270802F67BC21843A552A1AFAF
      EFC0D9EEEEEEE48E4EA323002104A9548ADDDD5D94524D97596B595B5BA35AAD
      62ADA5B7B7B7E96C2693414A89D6BA2380B621009052E2BA2EA9542A59E35928
      14A856AB00ACAFAF638C6992C767A4ECA8E2700FB8AE4B3A9DE6C48913097F75
      759552692FA7822060797999A9A9291CC70120954A25B9F09F78209EAF5FBF66
      7171F1C0DEDDDD5D1616169AAC771CE7500F7494C639608CA15EAFB3BDBD4DB1
      58E4D4A95307F67A9E87EBBAD4EB7532994C02E4300FBC550806060612DED8D8
      1800B76EDD6A4ACAC1C141CE9E3D0BEC65BEB5F6DD72C0F77D8AC5627261A335
      FBCBCBF77D4AA552B227EE03BEEF1F0DC0850B177A3CCFEBABD56A039B9B9B58
      6B31C624F2762EADD56A6C6C6C3401701C07DFF7A9D56A03972E5DCA552A95C2
      EDDBB7EB8DE79A6E9B9D9D9D1C1A1ABA3F383898AE542A5E7F7F7F5608D112C0
      7E208DDF312DA5442945B1582C67B359FFE5CB97DBA552E9CB6BD7AE550E7860
      7A7ABA379BCDDE3F77EEDCB8108267CF9EF1E8D123BABABA0E58DBCE0BAD40D5
      6A354E9F3E7D72646404CFF386E6E6E6FE04260F00181D1DFDF1FCF9F3E3F125
      F97C9EE5E5E54393A81D88780D8280E1E1E1A4A55FBC78F1E342A130333333F3
      5D72687A7ABAF7C18307EB5A6BABB5B25A2BABD4FB9B77EEDC59B97CF9F20789
      07A49459DFAF512C16F07D9FEE6E0F55AF934AA5C05A2C51D6B7A5D9A309F934
      ECC15A6A519564B35902AD851022036C2721504A19AD35EBEBEB8CE472942B65
      AC81C9C94F8E1482E6B107AE5C2EF3F4E9029EE7A1B44E6A3809B052CA5A6B58
      5959A15CAE70EFDE2FE472C3EFA01C4040F43F2897CB54B7AA186308B44ECA2A
      F180D6CA5A6B999898E0C993278C8F4FF0EB6FBFEF59B2DFB616FFF990D5C08F
      AC9752B0B5B5C5F8D828C6187483071200C6686BADA5AFEF249F7FF119BE5F8F
      E26B30D1C3C49A68C5628D099B541B7ED8C0F6781F0D0D264D4DB502A0540800
      209D4EE3795EA4B41140A3D2CE74ACAC910E0D3568A55AE540608EFBF83CCA68
      E90129A5544A77418B562BC45EBF8E656F4137DDD1405B0B5AABD4CECE8E1303
      70E6E6E6DE5CBF7E7DF3F9F3E7B938918C896ADA84AE8D698B8D4ADC802594D9
      88475CFB3692857BE230C41E2E955E956EDEBC59075C17F080F4DDBB777F2814
      5EFD941F19CE34BD825C17B72B852365185313C6333026CC0F6330D660227E42
      07316DA273613EACAE6D941F3EFCE37BA01BE8760105D4E7E7E7FFEEEF3FF9ED
      CECEEE37802785100889E380104E531CAD0D42228090B2B120EA7C41B8267210
      42A82008D4E28B173F2F2C2CFC03D4817A1C2417C80269A00B7038E4B9768CF1
      0648458A77802AA05AFD574504A0F363EEE8C3123AE4FD97DA51C6BF9B1355BB
      53E93D8C0000000049454E44AE426082}
    Transparent = True
    TabOrder = 4
    OnClick = ImprimirClick
    Appearance.BorderColor = 12631218
    Appearance.BorderColorHot = 10079963
    Appearance.BorderColorDown = 4548219
    Appearance.Color = 14671574
    Appearance.ColorTo = 15000283
    Appearance.ColorChecked = 7915518
    Appearance.ColorCheckedTo = 11918331
    Appearance.ColorDisabled = 15921906
    Appearance.ColorDisabledTo = 15921906
    Appearance.ColorDown = 7778289
    Appearance.ColorDownTo = 4296947
    Appearance.ColorHot = 15465983
    Appearance.ColorHotTo = 11332863
    Appearance.ColorMirror = 14144974
    Appearance.ColorMirrorTo = 15197664
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
  object query: TUniQuery
    Connection = frmModulo.conexao
    Left = 728
    Top = 496
  end
  object qrpedido: TUniQuery
    Connection = frmModulo.Conexao_Servidor
    Left = 192
    Top = 160
  end
  object ds1: TDataSource
    DataSet = qrpedido
    Left = 304
    Top = 152
  end
  object Frx_Impressaopedido: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39209.612085312500000000
    ReportOptions.LastChange = 43864.540488935180000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 344
    Top = 248
    Datasets = <
      item
        DataSet = frmVenda.frxEmitente
        DataSetName = 'frEmitente'
      end
      item
        DataSet = frxDBPedido
        DataSetName = 'frxDBPedido'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 220.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 28.795300000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          Left = 38.000000000000000000
          Top = 27.236240000000000000
          Width = 642.520100000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          Left = 40.677180000000000000
          Top = 10.559060000000000000
          Width = 638.740570000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              'PRODUTO                                                         ' +
              '                                                                ' +
              '                                                                ' +
              '                              QTDE')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Left = 38.385900000000000000
          Top = 4.102350000000000000
          Width = 642.520100000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Left = 37.795300000000000000
          Top = 4.000000000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line7: TfrxLineView
          Left = 681.315400000000000000
          Top = 4.000000000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Diagonal = True
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 23.456710000000000000
        Top = 260.787570000000000000
        Width = 718.110700000000000000
        DataSet = frxDBPedido
        DataSetName = 'frxDBPedido'
        RowCount = 0
        object Memo4: TfrxMemoView
          Left = 43.354360000000000000
          Top = 1.000000000000000000
          Width = 566.929500000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPedido."DESCRICAO"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 647.118430000000000000
          Top = 0.779530000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPedido."QTDE"]')
          ParentFont = False
        end
        object Line11: TfrxLineView
          Left = 37.795300000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line12: TfrxLineView
          Left = 681.315400000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Diagonal = True
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 127.401670000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 151.433210000000000000
          Top = 45.007730000000000000
          Width = 374.173470000000000000
          Height = 56.692950000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CNPJ:[frEmitente."CNPJ"]'
            '[frEmitente."ENDERECO"]'
            '[frEmitente."BAIRRO"]-[frEmitente."CIDADE"]-[frEmitente."UF"]'
            '[frEmitente."TELEFONE"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo58: TfrxMemoView
          Left = 152.740260000000000000
          Top = 17.118120000000000000
          Width = 374.173470000000000000
          Height = 18.897640240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Fill.BackColor = 14211288
          HAlign = haCenter
          Memo.UTF8W = (
            '[frEmitente."FANTASIA"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 34.015770000000000000
          Top = 104.724490000000000000
          Width = 646.299630000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'PEDIDO DE COMPRA')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 35.724490000000000000
          Top = 98.267780000000000000
          Width = 642.520100000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 92.756030000000000000
        Top = 306.141930000000000000
        Width = 718.110700000000000000
        object Memo20: TfrxMemoView
          Left = 380.409710000000000000
          Top = 35.622140000000000000
          Width = 294.803340000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'SISTEMA - GCSISTEMA V-2020')
          ParentFont = False
        end
        object Line10: TfrxLineView
          Left = 377.953000000000000000
          Top = 27.307050000000000000
          Width = 302.362400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo55: TfrxMemoView
          Left = 411.031540000000000000
          Top = 2.370130000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total da QTDE...........:')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 378.732530000000000000
          Top = 52.913420000000000000
          Width = 302.362400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo23: TfrxMemoView
          Left = 45.354360000000000000
          Top = 3.779530000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Observa'#231#227'o..: ')
          ParentFont = False
        end
        object Shape3: TfrxShapeView
          Left = 37.795300000000000000
          Width = 642.520100000000000000
          Height = 52.913420000000000000
          Shape = skRoundRectangle
        end
        object Line15: TfrxLineView
          Left = 681.315400000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line18: TfrxLineView
          Left = 377.953000000000000000
          Height = 52.913420000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line19: TfrxLineView
          Left = 681.315400000000000000
          Top = 26.456710000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object SysMemo1: TfrxSysMemoView
          Left = 570.709030000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBPedido."QTDE">,MasterData1)]')
          ParentFont = False
        end
      end
    end
    object Page4: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      object MasterData3: TfrxMasterData
        FillType = ftBrush
        Height = 11.338590000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        DataSetName = 'fsos'
        PrintChildIfInvisible = True
        RowCount = 0
      end
    end
  end
  object frxDBPedido: TfrxDBDataset
    UserName = 'frxDBPedido'
    CloseDataSource = False
    DataSet = qrimprimir
    BCDToCurrency = False
    Left = 432
    Top = 168
  end
  object qrimprimir: TUniQuery
    Connection = frmModulo.Conexao_Servidor
    Left = 184
    Top = 248
  end
end
