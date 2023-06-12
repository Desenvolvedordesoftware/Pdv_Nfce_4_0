object Loc_Pro_cod_original: TLoc_Pro_cod_original
  Left = 0
  Top = 0
  Caption = 'Localizar Produto por codigo do fornecerdor'
  ClientHeight = 223
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel1: TRzLabel
    Left = 8
    Top = 48
    Width = 107
    Height = 31
    Caption = 'Produto:'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    ShadowColor = clBlack
    TextStyle = tsShadow
  end
  object lb_cliente: TRzLabel
    Left = 0
    Top = 0
    Width = 751
    Height = 43
    Align = alTop
    Caption = 'Localizar Produto por codigo do fornecerdor'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    ShadowColor = clBlack
    TextStyle = tsShadow
    ExplicitLeft = 8
    ExplicitTop = -2
    ExplicitWidth = 698
  end
  object lb_status: TRzLabel
    Left = 8
    Top = 199
    Width = 742
    Height = 25
    AutoSize = False
    Caption = 'Informe o produto...'
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
  object grid: TNextGrid
    Left = 8
    Top = 112
    Width = 742
    Height = 84
    HelpType = htKeyword
    Touch.InteractiveGestures = [igPan, igPressAndTap]
    Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
    AppearanceOptions = [aoHighlightSlideCells]
    BorderStyle = bsNone
    Caption = ''
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    GridLinesStyle = lsVerticalOnly
    HideScrollBar = False
    Options = [goGrid, goHeader, goSelectFullRow]
    ParentFont = False
    TabOrder = 0
    TabStop = True
    object NxNumberColumn1: TNxTextColumn
      Alignment = taRightJustify
      DefaultValue = '0'
      DefaultWidth = 117
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Header.Alignment = taCenter
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Options = [coCanClick, coCanInput, coCanSort, coPublicUsing]
      ParentFont = False
      Position = 0
      SortType = stAlphabetic
      Width = 117
    end
    object NxTextColumn2: TNxTextColumn
      DefaultWidth = 102
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Header.Alignment = taCenter
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      ParentFont = False
      Position = 1
      SortType = stAlphabetic
      Width = 102
    end
    object NxTextColumn1: TNxTextColumn
      DefaultWidth = 273
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Header.Alignment = taCenter
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      ParentFont = False
      Position = 2
      SortType = stAlphabetic
      Width = 273
    end
    object NxTextColumn3: TNxTextColumn
      DefaultWidth = 28
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Header.Alignment = taCenter
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      ParentFont = False
      Position = 3
      SortType = stAlphabetic
      Width = 28
    end
    object NxNumberColumn3: TNxNumberColumn
      DefaultValue = '0'
      DefaultWidth = 77
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Header.Alignment = taCenter
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      ParentFont = False
      Position = 4
      SortType = stNumeric
      Width = 77
      FormatMask = '###,###,##0.00'
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxNumberColumn2: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      ParentFont = False
      Position = 5
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxTextColumn4: TNxTextColumn
      DefaultWidth = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      ParentFont = False
      Position = 6
      SortType = stAlphabetic
      Width = 25
    end
    object NxTextColumn5: TNxTextColumn
      DefaultWidth = 38
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      ParentFont = False
      Position = 7
      SortType = stAlphabetic
      Width = 38
    end
    object NxTextColumn6: TNxTextColumn
      DefaultWidth = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      ParentFont = False
      Position = 8
      SortType = stAlphabetic
      Width = 25
    end
    object NxTextColumn7: TNxTextColumn
      DefaultWidth = 35
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      ParentFont = False
      Position = 9
      SortType = stAlphabetic
      Width = 35
    end
  end
  object ed_barra: TRzEdit
    Left = 106
    Top = 45
    Width = 644
    Height = 37
    Text = ''
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    FrameStyle = fsNone
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentFont = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 8
    Top = 85
    Width = 117
    Height = 25
    BevelOuter = bvNone
    Caption = 'C'#243'digo'
    Color = 2164489
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 127
    Top = 85
    Width = 101
    Height = 25
    BevelOuter = bvNone
    Caption = 'C'#243'd. Barra'
    Color = 2164489
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
  end
  object Panel3: TPanel
    Left = 230
    Top = 85
    Width = 270
    Height = 25
    BevelOuter = bvNone
    Caption = 'Produto'
    Color = 2164489
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
  end
  object Panel4: TPanel
    Left = 502
    Top = 85
    Width = 26
    Height = 25
    BevelOuter = bvNone
    Caption = 'Un.'
    Color = 2164489
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
  end
  object Panel5: TPanel
    Left = 530
    Top = 85
    Width = 74
    Height = 25
    BevelOuter = bvNone
    Caption = 'Pre'#231'o'
    Color = 2164489
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
  end
  object Panel6: TPanel
    Left = 606
    Top = 85
    Width = 24
    Height = 25
    BevelOuter = bvNone
    Caption = 'ST'
    Color = 2164489
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 7
  end
  object Panel8: TPanel
    Left = 632
    Top = 85
    Width = 35
    Height = 25
    BevelOuter = bvNone
    Caption = 'Qtd.'
    Color = 2164489
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 8
  end
  object Panel7: TPanel
    Left = 669
    Top = 85
    Width = 23
    Height = 25
    BevelOuter = bvNone
    Caption = 'Al'#237'q.'
    Color = 2164489
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 9
  end
  object Panel9: TPanel
    Left = 694
    Top = 85
    Width = 35
    Height = 25
    BevelOuter = bvNone
    Caption = 'IPPT'
    Color = 2164489
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 10
  end
  object Panel10: TPanel
    Left = 731
    Top = 85
    Width = 19
    Height = 25
    BevelOuter = bvNone
    Color = 2164489
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 11
  end
end
