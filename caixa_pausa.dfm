object frmcaixapausa: Tfrmcaixapausa
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Caixa Fechado'
  ClientHeight = 462
  ClientWidth = 857
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = pop_principal
  Position = poDesigned
  PrintScale = poNone
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 857
    Height = 448
    Align = alClient
    Stretch = True
    ExplicitLeft = 424
    ExplicitTop = 168
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 448
    Width = 857
    Height = 14
    Align = alBottom
    Max = 150
    TabOrder = 0
  end
  object pop_principal: TAdvPopupMenu
    MenuStyler = frmModulo.estilo_menu
    Version = '2.6.2.1'
    Left = 96
    Top = 200
    object R1: TMenuItem
      Caption = 'Retorna =>'
      ShortCut = 27
      OnClick = R1Click
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 339
    Top = 258
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 275
    Top = 170
  end
end
