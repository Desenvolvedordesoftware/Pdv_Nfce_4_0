object frmProtetor_tela: TfrmProtetor_tela
  Left = 3
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmProtetor_tela'
  ClientHeight = 768
  ClientWidth = 1079
  Color = clBlack
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1079
    Height = 401
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Produto'
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -96
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 401
    Width = 1079
    Height = 144
    Align = alTop
    BevelOuter = bvNone
    Caption = 'n'#227'o encontrado!!!'
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -96
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object Timer1: TTimer
    Interval = 5000
    Left = 400
    Top = 80
  end
end