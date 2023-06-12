object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Testa Balan'#231'a com serial'
  ClientHeight = 425
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 40
    Top = 24
    Width = 417
    Height = 21
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 40
    Top = 51
    Width = 417
    Height = 182
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 552
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Habilitar'
    TabOrder = 2
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    Left = 592
    Top = 72
  end
end
