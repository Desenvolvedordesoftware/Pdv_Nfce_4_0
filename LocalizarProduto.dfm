object LocalizarProduto1: TLocalizarProduto1
  Left = 0
  Top = 0
  Caption = 'Localizar Produto'
  ClientHeight = 433
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 697
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    Color = 15830313
    TabOrder = 0
    ExplicitWidth = 575
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 42
      Height = 13
      Caption = 'Produto:'
    end
    object ed_barra: TRzEdit
      Left = 55
      Top = 6
      Width = 514
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
    end
  end
  object grid: TNextGrid
    Left = 0
    Top = 34
    Width = 697
    Height = 399
    Touch.InteractiveGestures = [igPan, igPressAndTap]
    Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
    Align = alClient
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
    TabOrder = 1
    TabStop = True
    ExplicitWidth = 575
    ExplicitHeight = 223
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
  object query: TUniQuery
    Connection = frmModulo.conexao
    Left = 256
    Top = 160
  end
end