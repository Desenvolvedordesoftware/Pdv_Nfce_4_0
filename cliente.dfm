inherited frmConsumidor1: TfrmConsumidor1
  Caption = 'frmConsumidor1'
  ClientHeight = 346
  ClientWidth = 356
  ExplicitWidth = 356
  ExplicitHeight = 346
  PixelsPerInch = 96
  TextHeight = 13
  object Shape2: TShape [0]
    Left = 32
    Top = 230
    Width = 249
    Height = 24
    Pen.Color = clSilver
    Shape = stRoundRect
  end
  inherited Panel1: TPanel
    Width = 356
    Height = 346
    inherited Panel2: TPanel
      Width = 352
      Height = 342
      inherited pn_consumidor: TFlatPanel
        Width = 348
        Height = 338
        ExplicitWidth = 733
        ExplicitHeight = 546
        inherited RzLabel9: TRzLabel
          Left = 31
          Top = 85
          ExplicitLeft = 31
          ExplicitTop = 85
        end
        inherited sh_cosumid_nome: TShape
          Left = 28
          Top = 99
          ExplicitLeft = 28
          ExplicitTop = 99
        end
        inherited RzLabel11: TRzLabel
          Left = 31
          Top = 125
          ExplicitLeft = 31
          ExplicitTop = 125
        end
        inherited sh_consumid_endereco: TShape
          Left = 27
          Top = 139
          ExplicitLeft = 27
          ExplicitTop = 139
        end
        inherited RzLabel12: TRzLabel
          Left = 31
          Top = 165
          ExplicitLeft = 31
          ExplicitTop = 165
        end
        inherited sh_consumid_cidade: TShape
          Left = 28
          Top = 180
          ExplicitLeft = 28
          ExplicitTop = 180
        end
        inherited RzLabel13: TRzLabel
          Left = 307
          Top = 397
          ExplicitLeft = 307
          ExplicitTop = 397
        end
        inherited sh_consumid_uf: TShape
          Left = 298
          Top = 411
          ExplicitLeft = 298
          ExplicitTop = 411
        end
        inherited RzLabel14: TRzLabel
          Left = 31
          Top = 205
          Caption = 'Telefone'
          ExplicitLeft = 31
          ExplicitTop = 205
        end
        inherited sh_consumid_cep: TShape
          Left = 26
          Top = 435
          Width = 177
          ExplicitLeft = 26
          ExplicitTop = 435
          ExplicitWidth = 177
        end
        inherited RzLabel15: TRzLabel
          Left = 113
          Top = 46
          Caption = 'CPF'
          ExplicitLeft = 113
          ExplicitTop = 46
        end
        inherited sh_consumid_cpf: TShape
          Left = 110
          Top = 60
          ExplicitLeft = 110
          ExplicitTop = 60
        end
        object RzLabel1: TRzLabel [13]
          Left = 34
          Top = 43
          Width = 43
          Height = 17
          AutoSize = False
          Caption = 'Codigo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          ShadowColor = clBlack
        end
        object Shape1: TShape [14]
          Left = 28
          Top = 60
          Width = 64
          Height = 24
          Pen.Color = clSilver
          Shape = stRoundRect
        end
        object Shape3: TShape [15]
          Left = 28
          Top = 218
          Width = 249
          Height = 24
          Pen.Color = clSilver
          Shape = stRoundRect
        end
        inherited FlatPanel3: TFlatPanel
          Top = 264
          Width = 346
        end
        inherited ed_consumid_nome: TRzEdit
          Left = 30
          Top = 101
          ExplicitLeft = 30
          ExplicitTop = 101
        end
        inherited ed_consumid_endereco: TRzEdit
          Left = 30
          Top = 141
          ExplicitLeft = 30
          ExplicitTop = 141
        end
        inherited ed_consumid_cidade: TRzEdit
          Left = 31
          Top = 181
          ExplicitLeft = 31
          ExplicitTop = 181
        end
        inherited ed_consumid_uf: TRzEdit
          Left = 301
          Top = 410
          ExplicitLeft = 301
          ExplicitTop = 410
        end
        inherited ed_consumid_cep: TRzEdit
          Left = 28
          Top = 437
          Width = 170
          ExplicitLeft = 28
          ExplicitTop = 437
          ExplicitWidth = 170
        end
        inherited ed_consumid_cpf: TRzEdit
          Left = 109
          Top = 62
          ExplicitLeft = 109
          ExplicitTop = 62
        end
        inherited pn_veiculo: TFlatPanel
          Left = 805
          Top = 271
          ExplicitLeft = 805
          ExplicitTop = 271
          inherited RzLabel17: TRzLabel
            Left = 12
            ExplicitLeft = 12
          end
        end
        object ed_consumid_codigo: TRzEdit
          Left = 31
          Top = 59
          Width = 58
          Height = 21
          Text = ''
          CharCase = ecUpperCase
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FrameStyle = fsNone
          FrameVisible = True
          FramingPreference = fpCustomFraming
          ParentFont = False
          TabOnEnter = True
          TabOrder = 8
          OnEnter = ed_consumid_ufEnter
          OnExit = ed_consumid_ufExit
          OnKeyPress = ed_consumid_enderecoKeyPress
        end
      end
    end
  end
  object ed_consumid_telefone: TRzEdit [2]
    Left = 35
    Top = 223
    Width = 242
    Height = 21
    Text = ''
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    FrameStyle = fsNone
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentFont = False
    TabOnEnter = True
    TabOrder = 1
    OnEnter = ed_consumid_cidadeEnter
    OnExit = ed_consumid_cidadeExit
    OnKeyPress = ed_consumid_enderecoKeyPress
  end
  inherited pop_consumid: TAdvPopupMenu
    Left = 288
    Top = 220
  end
end
