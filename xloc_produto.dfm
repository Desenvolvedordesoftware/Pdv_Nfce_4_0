object frmxloc_produto: Tfrmxloc_produto
  Left = 29
  Top = 77
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Localizar Produtos'
  ClientHeight = 473
  ClientWidth = 1018
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel8: TBevel
    Left = 0
    Top = 44
    Width = 1018
    Height = 3
    Align = alTop
    ExplicitWidth = 774
  end
  object Bevel6: TBevel
    Left = 0
    Top = 413
    Width = 1018
    Height = 3
    Align = alBottom
    ExplicitWidth = 774
  end
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 0
    Width = 1018
    Height = 44
    Color = 12223546
    ColorHighLight = 12223546
    ColorShadow = 12223546
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 768
    object Label12: TLabel
      Left = 638
      Top = 21
      Width = 58
      Height = 12
      Caption = '* | TODOS'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 6
      Top = 3
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
      Top = 3
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
      Left = 248
      Top = 4
      Width = 2
      Height = 37
    end
    object Label4: TLabel
      Left = 6
      Top = 3
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
      Top = 3
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
      Left = 264
      Top = 3
      Width = 253
      Height = 12
      Caption = 'F5 | INFORME OS PAR'#194'METROS DA PESQUISA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 264
      Top = 3
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
    object combo_localizar: TComboBox
      Left = 5
      Top = 17
      Width = 118
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
      TabOrder = 1
      Text = 'NOME'
      Items.Strings = (
        'NOME'
        'CODIGO'
        'C'#211'D.BARRAS'
        'FORNECEDOR'
        'MARCA')
    end
    object combo_referencia: TComboBox
      Left = 136
      Top = 17
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
      Left = 264
      Top = 17
      Width = 369
      Height = 20
      CharCase = ecUpperCase
      Color = 12582911
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = locChange
      OnEnter = locEnter
      OnExit = locExit
      OnKeyDown = locKeyDown
      OnKeyPress = locKeyPress
    end
  end
  object GRID: TwwDBGrid
    Left = 0
    Top = 47
    Width = 1018
    Height = 366
    Selected.Strings = (
      'CODIGO'#9'6'#9'CODIGO'#9#9
      'CODBARRA'#9'13'#9'CODBARRA'#9#9
      'PRODUTO'#9'100'#9'PRODUTO'#9#9
      'UNIDADE'#9'2'#9'UNIDADE'#9#9
      'DATA_CADASTRO'#9'18'#9'DATA_CADASTRO'#9'F'#9
      'CODGRUPO'#9'6'#9'CODGRUPO'#9'F'#9
      'CODSUBGRUPO'#9'6'#9'CODSUBGRUPO'#9'F'#9
      'CODFORNECEDOR'#9'6'#9'CODFORNECEDOR'#9'F'#9
      'CODMARCA'#9'6'#9'CODMARCA'#9'F'#9
      'DATA_ULTIMACOMPRA'#9'18'#9'DATA_ULTIMACOMPRA'#9'F'#9
      'NOTAFISCAL'#9'7'#9'NOTAFISCAL'#9'F'#9
      'PRECOCUSTO'#9'10'#9'PRECOCUSTO'#9'F'#9
      'PRECOVENDA'#9'10'#9'PRECOVENDA'#9#9
      'DATA_ULTIMAVENDA'#9'18'#9'DATA_ULTIMAVENDA'#9'F'#9
      'ESTOQUE'#9'10'#9'ESTOQUE'#9'F'#9
      'ESTOQUEMINIMO'#9'10'#9'ESTOQUEMINIMO'#9'F'#9
      'CODALIQUOTA'#9'5'#9'CODALIQUOTA'#9'F'#9
      'APLICACAO'#9'10'#9'APLICACAO'#9'F'#9
      'LOCALICAZAO'#9'50'#9'LOCALICAZAO'#9'F'#9
      'PESO'#9'10'#9'PESO'#9'F'#9
      'VALIDADE'#9'20'#9'VALIDADE'#9'F'#9
      'COMISSAO'#9'10'#9'COMISSAO'#9'F'#9
      'USA_BALANCA'#9'10'#9'USA_BALANCA'#9'F'#9
      'USA_SERIAL'#9'10'#9'USA_SERIAL'#9'F'#9
      'USA_GRADE'#9'10'#9'USA_GRADE'#9'F'#9
      'CODRECEITA'#9'6'#9'CODRECEITA'#9'F'#9
      'FOTO'#9'80'#9'FOTO'#9'F'#9
      'DATA_ULTIMACOMPRA_ANTERIOR'#9'18'#9'DATA_ULTIMACOMPRA_ANTERIOR'#9'F'#9
      'NOTAFISCAL_ANTERIOR'#9'6'#9'NOTAFISCAL_ANTERIOR'#9'F'#9
      'CODFORNECEDOR_ANTERIOR'#9'6'#9'CODFORNECEDOR_ANTERIOR'#9'F'#9
      'PRECOCUSTO_ANTERIOR'#9'10'#9'PRECOCUSTO_ANTERIOR'#9'F'#9
      'PRECOVENDA_ANTERIOR'#9'10'#9'PRECOVENDA_ANTERIOR'#9'F'#9
      'CUSTOMEDIO'#9'10'#9'CUSTOMEDIO'#9'F'#9
      'AUTO_APLICACAO'#9'60'#9'AUTO_APLICACAO'#9'F'#9
      'AUTO_COMPLEMENTO'#9'60'#9'AUTO_COMPLEMENTO'#9'F'#9
      'DATA_REMARCACAO_CUSTO'#9'18'#9'DATA_REMARCACAO_CUSTO'#9'F'#9
      'DATA_REMARCACAO_VENDA'#9'18'#9'DATA_REMARCACAO_VENDA'#9'F'#9
      'PRECO_PROMOCAO'#9'10'#9'PRECO_PROMOCAO'#9'F'#9
      'DATA_PROMOCAO'#9'18'#9'DATA_PROMOCAO'#9'F'#9
      'FIM_PROMOCAO'#9'18'#9'FIM_PROMOCAO'#9'F'#9
      'CST'#9'10'#9'CST'#9'F'#9
      'CLASSIFICACAO_FISCAL'#9'20'#9'CLASSIFICACAO_FISCAL'#9'F'#9
      'NBM'#9'20'#9'NBM'#9'F'#9
      'NCM'#9'20'#9'NCM'#9'F'#9
      'ALIQUOTA'#9'10'#9'ALIQUOTA'#9'F'#9
      'IPI'#9'10'#9'IPI'#9'F'#9
      'REDUCAO'#9'10'#9'REDUCAO'#9'F'#9
      'QTDE_EMBALAGEM'#9'10'#9'QTDE_EMBALAGEM'#9'F'#9
      'TIPO'#9'30'#9'TIPO'#9'F'#9
      'PESO_LIQUIDO'#9'10'#9'PESO_LIQUIDO'#9'F'#9
      'FARMACIA_CONTROLADO'#9'1'#9'FARMACIA_CONTROLADO'#9'F'#9
      'FARMACIA_APRESENTACAO'#9'10'#9'FARMACIA_APRESENTACAO'#9'F'#9
      
        'FARMACIA_REGISTRO_MEDICAMENTO'#9'20'#9'FARMACIA_REGISTRO_MEDICAMENTO'#9'F' +
        #9
      'FARMACIA_PMC'#9'10'#9'FARMACIA_PMC'#9'F'#9
      'ULTIMA_ALTERACAO'#9'18'#9'ULTIMA_ALTERACAO'#9'F'#9
      'ULTIMA_CARGA'#9'18'#9'ULTIMA_CARGA'#9'F'#9
      'DATA_INVENTARIO'#9'18'#9'DATA_INVENTARIO'#9'F'#9
      'CUSTO_INVENTARIO'#9'10'#9'CUSTO_INVENTARIO'#9'F'#9
      'ESTOQUE_INVENTARIO'#9'10'#9'ESTOQUE_INVENTARIO'#9'F'#9
      'ESTOQUE_ANTERIOR'#9'10'#9'ESTOQUE_ANTERIOR'#9'F'#9
      'PRECOVENDA_NOVO'#9'10'#9'PRECOVENDA_NOVO'#9'F'#9
      'USA_RENTABILIDADE'#9'10'#9'USA_RENTABILIDADE'#9'F'#9
      'QUANTIDADE_MINIMA_FAB'#9'10'#9'QUANTIDADE_MINIMA_FAB'#9'F'#9
      'APRESENTACAO'#9'60'#9'APRESENTACAO'#9'F'#9
      'SITUACAO'#9'10'#9'SITUACAO'#9'F'#9
      'PRECOVENDA1'#9'10'#9'PRECOVENDA1'#9'F'#9
      'PRECOVENDA2'#9'10'#9'PRECOVENDA2'#9'F'#9
      'PRECOVENDA3'#9'10'#9'PRECOVENDA3'#9'F'#9
      'PRECOVENDA4'#9'10'#9'PRECOVENDA4'#9'F'#9
      'PRECOVENDA5'#9'10'#9'PRECOVENDA5'#9'F'#9
      'DESCONTO_PRECOVENDA'#9'10'#9'DESCONTO_PRECOVENDA'#9'F'#9
      'DATA_INVENTARIO_ATUAL'#9'18'#9'DATA_INVENTARIO_ATUAL'#9'F'#9
      'CUSTO_INVENTARIO_ATUAL'#9'10'#9'CUSTO_INVENTARIO_ATUAL'#9'F'#9
      'ESTOQUE_INVENTARIO_ATUAL'#9'10'#9'ESTOQUE_INVENTARIO_ATUAL'#9'F'#9
      'MARGEM_MINIMA'#9'10'#9'MARGEM_MINIMA'#9'F'#9
      'PISCOFINS'#9'1'#9'PISCOFINS'#9'F'#9
      'REFERENCIA_FORNECEDOR'#9'30'#9'REFERENCIA_FORNECEDOR'#9'F'#9
      'COMISSAO1'#9'10'#9'COMISSAO1'#9'F'#9
      'MARGEM_DESCONTO'#9'10'#9'MARGEM_DESCONTO'#9'F'#9
      'TAMANHO'#9'6'#9'TAMANHO'#9'F'#9
      'COR'#9'6'#9'COR'#9'F'#9
      'INCIDENCIA_PISCOFINS'#9'30'#9'INCIDENCIA_PISCOFINS'#9'F'#9
      'VEIC_CHASSI'#9'50'#9'VEIC_CHASSI'#9'F'#9
      'VEIC_SERIE'#9'50'#9'VEIC_SERIE'#9'F'#9
      'VEIC_POTENCIA'#9'50'#9'VEIC_POTENCIA'#9'F'#9
      'VEIC_PESO_LIQUIDO'#9'15'#9'VEIC_PESO_LIQUIDO'#9'F'#9
      'VEIC_PESO_BRUTO'#9'15'#9'VEIC_PESO_BRUTO'#9'F'#9
      'VEIC_TIPO_COMBUSTIVEL'#9'20'#9'VEIC_TIPO_COMBUSTIVEL'#9'F'#9
      'VEIC_RENAVAM'#9'50'#9'VEIC_RENAVAM'#9'F'#9
      'VEIC_ANO_FABRICACAO'#9'10'#9'VEIC_ANO_FABRICACAO'#9'F'#9
      'VEIC_ANO_MODELO'#9'10'#9'VEIC_ANO_MODELO'#9'F'#9
      'VEIC_TIPO'#9'50'#9'VEIC_TIPO'#9'F'#9
      'VEIC_TIPO_PINTURA'#9'15'#9'VEIC_TIPO_PINTURA'#9'F'#9
      'VEIC_COD_COR'#9'15'#9'VEIC_COD_COR'#9'F'#9
      'VEIC_COR'#9'30'#9'VEIC_COR'#9'F'#9
      'VEIC_VIN'#9'10'#9'VEIC_VIN'#9'F'#9
      'VEIC_NUMERO_MOTOR'#9'50'#9'VEIC_NUMERO_MOTOR'#9'F'#9
      'VEIC_CMKG'#9'15'#9'VEIC_CMKG'#9'F'#9
      'VEIC_CM3'#9'15'#9'VEIC_CM3'#9'F'#9
      'VEIC_DISTANCIA_EIXO'#9'15'#9'VEIC_DISTANCIA_EIXO'#9'F'#9
      'VEIC_COD_MARCA'#9'15'#9'VEIC_COD_MARCA'#9'F'#9
      'VEIC_ESPECIE'#9'50'#9'VEIC_ESPECIE'#9'F'#9
      'VEIC_CONDICAO'#9'50'#9'VEIC_CONDICAO'#9'F'#9
      'LOTE_FABRICACAO'#9'20'#9'LOTE_FABRICACAO'#9'F'#9
      'LOTE_VALIDADE'#9'18'#9'LOTE_VALIDADE'#9'F'#9
      'MARGEM_AGREGADA'#9'10'#9'MARGEM_AGREGADA'#9'F'#9
      'CODBARRA_NOVARTIS'#9'13'#9'CODBARRA_NOVARTIS'#9'F'#9
      'FARMACIA_DCB'#9'20'#9'FARMACIA_DCB'#9'F'#9
      'FARMACIA_ABCFARMA'#9'10'#9'FARMACIA_ABCFARMA'#9'F'#9
      'FARMACIA_APRESENTACAO_CAIXA'#9'10'#9'FARMACIA_APRESENTACAO_CAIXA'#9'F'#9
      'FARMACIA_PRINCIPIOATIVO'#9'30'#9'FARMACIA_PRINCIPIOATIVO'#9'F'#9
      'ULTIMA_COMPRA'#9'18'#9'ULTIMA_COMPRA'#9'F'#9
      'FARMACIA_DATAVIGENCIA'#9'18'#9'FARMACIA_DATAVIGENCIA'#9'F'#9
      'FARMACIA_TIPO'#9'1'#9'FARMACIA_TIPO'#9'F'#9
      'USA_COMBUSTIVEL'#9'1'#9'USA_COMBUSTIVEL'#9'F'#9
      'REFERENCIA'#9'30'#9'REFERENCIA'#9'F'#9
      'PERDA'#9'10'#9'PERDA'#9'F'#9
      'COMPOSICAO1'#9'30'#9'COMPOSICAO1'#9'F'#9
      'COMPOSICAO2'#9'30'#9'COMPOSICAO2'#9'F'#9
      'IAT'#9'1'#9'IAT'#9'F'#9
      'IPPT'#9'1'#9'IPPT'#9'F'#9
      'SITUACAO_TRIBUTARIA'#9'1'#9'SITUACAO_TRIBUTARIA'#9'F'#9
      'FLAG_SIS'#9'1'#9'FLAG_SIS'#9'F'#9
      'FLAG_ACEITO'#9'3'#9'FLAG_ACEITO'#9'F'#9
      'FLAG_EST'#9'1'#9'FLAG_EST'#9'F'#9
      'CSOSN'#9'60'#9'CSOSN'#9'F'#9
      'CODORIGINAL'#9'20'#9'CODORIGINAL'#9'F'#9
      'CUSTO_ATACADO'#9'10'#9'CUSTO_ATACADO'#9'F'#9
      'UNIDADE_ATACADO'#9'2'#9'UNIDADE_ATACADO'#9'F'#9
      'QTDE_EMBALAGEMATACADO'#9'10'#9'QTDE_EMBALAGEMATACADO'#9'F'#9
      'PMARGEM1'#9'10'#9'PMARGEM1'#9'F'#9
      'PMARGEM2'#9'10'#9'PMARGEM2'#9'F'#9
      'PMARGEM3'#9'10'#9'PMARGEM3'#9'F'#9
      'PMARGEM4'#9'10'#9'PMARGEM4'#9'F'#9
      'PMARGEM5'#9'10'#9'PMARGEM5'#9'F'#9
      'PMARGEMATACADO1'#9'10'#9'PMARGEMATACADO1'#9'F'#9
      'PMARGEMATACADO2'#9'10'#9'PMARGEMATACADO2'#9'F'#9
      'PMARGEMATACADO3'#9'10'#9'PMARGEMATACADO3'#9'F'#9
      'PMARGEMATACADO4'#9'10'#9'PMARGEMATACADO4'#9'F'#9
      'PMARGEMATACADO5'#9'10'#9'PMARGEMATACADO5'#9'F'#9
      'PMARGEMATACADO6'#9'10'#9'PMARGEMATACADO6'#9'F'#9
      'PRECOATACADO1'#9'10'#9'PRECOATACADO1'#9'F'#9
      'PRECOATACADO2'#9'10'#9'PRECOATACADO2'#9'F'#9
      'PRECOATACADO3'#9'10'#9'PRECOATACADO3'#9'F'#9
      'PRECOATACADO4'#9'10'#9'PRECOATACADO4'#9'F'#9
      'PRECOATACADO5'#9'10'#9'PRECOATACADO5'#9'F'#9
      'IND_CFOP'#9'6'#9'IND_CFOP'#9'F'#9
      'CFOP_DESC'#9'30'#9'CFOP_DESC'#9'F'#9
      'USA_LOTE'#9'10'#9'USA_LOTE'#9'F'#9
      'IND_CFOP_VENDA_DENTRO'#9'6'#9'IND_CFOP_VENDA_DENTRO'#9'F'#9
      'CODCONTA'#9'6'#9'CODCONTA'#9'F'#9
      'IND_CFOP_VENDA_FORA'#9'6'#9'IND_CFOP_VENDA_FORA'#9'F'#9
      'IND_CFOP_DEVOLUCAO_DENTRO'#9'6'#9'IND_CFOP_DEVOLUCAO_DENTRO'#9'F'#9
      'IND_CFOP_DEVOLUCAO_FORA'#9'6'#9'IND_CFOP_DEVOLUCAO_FORA'#9'F'#9
      'IND_CFOP_GARANTIA_DENTRO'#9'6'#9'IND_CFOP_GARANTIA_DENTRO'#9'F'#9
      'IND_CFOP_GARANTIA_FORA'#9'6'#9'IND_CFOP_GARANTIA_FORA'#9'F'#9
      'USA_TB_PC'#9'4'#9'USA_TB_PC'#9'F'#9
      'CODPRODUTO'#9'10'#9'CODPRODUTO'#9'F'#9
      'CODFILIAL'#9'10'#9'CODFILIAL'#9'F'#9
      'ESTOQUE_INICIAL'#9'10'#9'ESTOQUE_INICIAL'#9'F'#9
      'ENTRADAS'#9'10'#9'ENTRADAS'#9'F'#9
      'SAIDAS'#9'10'#9'SAIDAS'#9'F'#9
      'ESTOQUE_ATUAL'#9'10'#9'ESTOQUE_ATUAL'#9#9
      'ULTIMA_ENTRADA'#9'18'#9'ULTIMA_ENTRADA'#9'F'#9
      'ULTIMA_SAIDA'#9'18'#9'ULTIMA_SAIDA'#9'F'#9
      'NOTA_FISCAL'#9'10'#9'NOTA_FISCAL'#9'F'#9)
    IniAttributes.Delimiter = ';;'
    IniAttributes.UnicodeIniFile = False
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = ds
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
    PaintOptions.AlternatingRowColor = 15066597
    PaintOptions.ActiveRecordColor = clBlack
    ExplicitWidth = 768
  end
  object FlatPanel2: TFlatPanel
    Left = 0
    Top = 416
    Width = 1018
    Height = 57
    ParentColor = True
    ColorHighLight = clBtnFace
    ColorShadow = clBtnFace
    Align = alBottom
    TabOrder = 2
    ExplicitWidth = 768
    object Bevel3: TBevel
      Left = 64
      Top = 7
      Width = 144
      Height = 18
    end
    object Label8: TLabel
      Left = 35
      Top = 10
      Width = 26
      Height = 13
      Caption = 'NCM:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 29
      Top = 34
      Width = 33
      Height = 13
      Caption = 'Grupo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Bevel4: TBevel
      Left = 66
      Top = 31
      Width = 142
      Height = 18
    end
    object Label10: TLabel
      Left = 213
      Top = 34
      Width = 50
      Height = 13
      Caption = 'Subgrupo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Bevel5: TBevel
      Left = 279
      Top = 31
      Width = 126
      Height = 18
    end
    object DBText1: TDBText
      Left = 67
      Top = 10
      Width = 141
      Height = 14
      DataField = 'CLASSIFICACAO_FISCAL'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object DBText2: TDBText
      Left = 70
      Top = 34
      Width = 134
      Height = 14
      DataField = 'CODGRUPO'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object DBText3: TDBText
      Left = 284
      Top = 34
      Width = 119
      Height = 14
      DataField = 'CODSUBGRUPO'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel7: TBevel
      Left = 413
      Top = 4
      Width = 2
      Height = 49
    end
    object Bevel9: TBevel
      Left = 541
      Top = 4
      Width = 2
      Height = 49
    end
    object Label11: TLabel
      Left = 422
      Top = 4
      Width = 44
      Height = 13
      Caption = 'Visualizar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Bevel2: TBevel
      Left = 279
      Top = 3
      Width = 136
      Height = 18
    end
    object DBPROD: TDBText
      Left = 281
      Top = 6
      Width = 124
      Height = 14
      DataField = 'CODIGO'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 214
      Top = 6
      Width = 61
      Height = 13
      Caption = 'COD. PROD:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBText4: TDBText
      Left = 800
      Top = 16
      Width = 65
      Height = 17
      DataField = 'CODIGO'
      DataSource = ds
    end
    object bitbtn1: TAdvGlowButton
      Left = 554
      Top = 12
      Width = 104
      Height = 28
      Caption = 'F2 | Cadastrar '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 49
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000000467414D410000AFC837058AE90000001974455874536F6674776172
        650041646F626520496D616765526561647971C9653C000002E14944415478DA
        62FCFFFF3F032500208058D0057AF6942AFFFDF737EACFDFBF717FFEFE91F8F3
        EF2FC3EFBF7F5E00F98B80F4B289E18BEF22AB070820466417F4EC2909FEF3F7
        DF645931654975097D064E561E865FFF7E31BCFAF28CE1F89D7D0CAFDEBC7EFE
        E7CF9FDC5971ABD7C2F4000410DC0088E6BF0B4D54ECB955C57419EE7EBAC5F0
        E2FB5386DFFF7E33F0B3F13388714A331CBDB593E1EA9DEB5F812E8B5F92B219
        6C084000810DE8DE5DA20474F66103252B2955713D8683CF77317CFBFA8DE1F7
        FF3F0C1C1CEC0CFF81F0E7BF9F0C9A7C3A0CC76EEE61B879FFEEB3DF7FFED8AE
        CBDE7D0F20809840A60035C708F08B4A298868301C79B197E1FBEF1F0CDF7E7F
        672834AE66C8D42E61F8F0F33DC3BB8F2F188E3F3FC060A1E6C8C0C8F6570A18
        1E3120BD0001043600E8F458793175861B1FAF30BCF9F486E1D3B74F0C1FBEBE
        8787CDD3FB8F187EFFFCCAF0F5F35B86279FEE3358AB5B8302361624071040E0
        580072A43958B9181E7EBE0F0CB49F0C9566AD283133357809982EDC19C5F0F4
        C33D061D6113B01E90184000415DF087E1EBEFCF0C9F7F7D62F8CDFC1B6FBCFF
        FFFB8F811118264003C07C800082B9E0E9D3F70F5578D879183E7C7FC7507828
        85E1EBAB4F0CB34256C16D06DBC6C8C420C527C7F0E8D57D90A54F41620001C4
        043560F185FB2719E4B81419FEFFFEC9C008345D48901BC5E67F7FFF3330FD63
        6490E55364D876712F580F481C2080602E58F2EF1773FAC93B07A42C955C188E
        3EDCC1F0E7DF1FB0CDFFFF821DCEC0C6C4CC60AFE4C9B0E3C216868F9FBF3C03
        063C38600002089E909216040113D29F85D212E2DCB6EA2E0C8F3FDE0706D87D
        86FFFFFE31C8082A31C8F0C9336CBFB899E1E4F52B5F81C93BFE7CC335704202
        082094A41C39CB2B18E89AC97F99FF48DA6BDA3088F349822C6778FCFE11C3CE
        F3FB183E7DF9F61CA83917A61904000288113D37FA4F7652061A12F51B9E99FE
        00BDF8179C99FEFEFBB3EC7CC37594CC0410408C94666780000300708A7F01A2
        891CF10000000049454E44AE426082}
      Transparent = True
      TabOrder = 0
      Appearance.BorderColor = 12179676
      Appearance.BorderColorHot = clHighlight
      Appearance.BorderColorDown = clHighlight
      Appearance.BorderColorChecked = clBlack
      Appearance.ColorTo = 12179676
      Appearance.ColorChecked = 12179676
      Appearance.ColorCheckedTo = 12179676
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 11899524
      Appearance.ColorDownTo = 11899524
      Appearance.ColorHot = 15717318
      Appearance.ColorHotTo = 15717318
      Appearance.ColorMirror = 12179676
      Appearance.ColorMirrorTo = 12179676
      Appearance.ColorMirrorHot = 15717318
      Appearance.ColorMirrorHotTo = 15717318
      Appearance.ColorMirrorDown = 11899524
      Appearance.ColorMirrorDownTo = 11899524
      Appearance.ColorMirrorChecked = 12179676
      Appearance.ColorMirrorCheckedTo = 12179676
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
    end
    object balterar: TAdvGlowButton
      Left = 666
      Top = 12
      Width = 104
      Height = 28
      Caption = 'F6 | Alterar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 49
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        00000004000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BD735200C65A
        0000AD4A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B55A3100C65A
        0000CE630000B5521000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B55A
        3100C6630000CE630000B55A2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00B55A2100CE630000C6630000C6846300FFFFFF00FFFFFF00AD4A0000BD5A
        0000BD5A0000BD5A0000BD5A0000BD5A0000BD5A0000BD5A0000C6846300FFFF
        FF00FFFFFF00AD4A0000CE630000B54A0000FFFFFF00FFFFFF00B5520000D673
        0000CE6B0000CE630000CE630000CE630000CE630000C6630000BD6B4200FFFF
        FF00FFFFFF00CE9C8400C6630000C6630000C6846300FFFFFF00BD5A0000DE7B
        0000D6730000CE630000A5421000CE9C8400CE9C8400CE9C8400FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00AD4A0000CE630000B5521000FFFFFF00C6630000E784
        0000CE630000DE730000CE630000C6846300FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6734200CE630000B54A0000FFFFFF00CE630000F794
        0000B5521000B5520000DE7B0000CE6B0000BD7B5200FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6734200CE630000B54A0000FFFFFF00CE6B0800FF9C
        0800CE844200FFFFFF00B5520000E7840000CE6B0000BD633100FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00B54A0000CE630000B5521000FFFFFF00CE732100FFAD
        3100CE844A00FFFFFF00FFFFFF00C6631000E7840000E77B0000BD520000C67B
        5200C68C7300B5521000C6630000C6630000C6846300FFFFFF00CE7B3900FFBD
        6300C67B5200FFFFFF00FFFFFF00FFFFFF00B55A2100E77B0000E7840000DE7B
        0000D6730000CE6B0000C6630000AD4A1000FFFFFF00FFFFFF00CE947B00C684
        5A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE9C8400C6631000CE6B
        0000CE6B0000BD5A0000BD6B4200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Transparent = True
      TabOrder = 1
      Appearance.BorderColor = 12179676
      Appearance.BorderColorHot = clHighlight
      Appearance.BorderColorDown = clHighlight
      Appearance.BorderColorChecked = clBlack
      Appearance.ColorTo = 12179676
      Appearance.ColorChecked = 12179676
      Appearance.ColorCheckedTo = 12179676
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 11899524
      Appearance.ColorDownTo = 11899524
      Appearance.ColorHot = 15717318
      Appearance.ColorHotTo = 15717318
      Appearance.ColorMirror = 12179676
      Appearance.ColorMirrorTo = 12179676
      Appearance.ColorMirrorHot = 15717318
      Appearance.ColorMirrorHotTo = 15717318
      Appearance.ColorMirrorDown = 11899524
      Appearance.ColorMirrorDownTo = 11899524
      Appearance.ColorMirrorChecked = 12179676
      Appearance.ColorMirrorCheckedTo = 12179676
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
    end
    object combo_situacao: TComboBox
      Left = 422
      Top = 20
      Width = 111
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = 'Somente Ativos'
      OnChange = combo_situacaoChange
      Items.Strings = (
        'Somente Ativos'
        'Somente Inativos'
        'Todos')
    end
  end
  object PPROCURA: TFlatPanel
    Left = 264
    Top = 37
    Width = 369
    Height = 257
    Color = clWindow
    Visible = False
    ColorHighLight = clWindow
    ColorShadow = clWindow
    TabOrder = 3
    object wwDBGrid1: TwwDBGrid
      Left = 0
      Top = -16
      Width = 369
      Height = 255
      Selected.Strings = (
        'CODIGO'#9'7'#9'CODIGO'
        'NOME'#9'42'#9'NOME'#9'F')
      IniAttributes.Delimiter = ';;'
      IniAttributes.UnicodeIniFile = False
      TitleColor = clWindow
      FixedCols = 0
      ShowHorzScrollBar = True
      BorderStyle = bsNone
      Color = 12582911
      DataSource = DS2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      Options = [dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgHideBottomDataLine]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Verdana'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnEnter = wwDBGrid1Enter
      OnExit = wwDBGrid1Exit
      OnKeyPress = wwDBGrid1KeyPress
      FooterColor = clWindow
      FooterCellColor = clWindow
      PaintOptions.ActiveRecordColor = clRed
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 552
    Top = 256
    object Cadastrarnovoprodutos1: TMenuItem
      Caption = 'Cadastrar novo produtos'
      ShortCut = 113
    end
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
    object AlterarProduto1: TMenuItem
      Caption = 'Editar Produto'
      ShortCut = 117
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
  object DS2: TDataSource
    Left = 496
    Top = 200
  end
  object query: TUniQuery
    Connection = frmModulo.Conexao_Numerador
    SQL.Strings = (
      
        'select prod.*, estq.* from c000025 prod, c000100 estq where prod' +
        '.codigo = estq.codproduto')
    Left = 176
    Top = 240
    object queryCODIGO: TStringField
      DisplayWidth = 6
      FieldName = 'CODIGO'
      Required = True
      Size = 6
    end
    object queryCODBARRA: TStringField
      DisplayWidth = 13
      FieldName = 'CODBARRA'
      Size = 13
    end
    object queryPRODUTO: TStringField
      DisplayWidth = 100
      FieldName = 'PRODUTO'
      Size = 100
    end
    object queryUNIDADE: TStringField
      DisplayWidth = 2
      FieldName = 'UNIDADE'
      Size = 2
    end
    object queryDATA_CADASTRO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATA_CADASTRO'
    end
    object queryCODGRUPO: TStringField
      DisplayWidth = 6
      FieldName = 'CODGRUPO'
      Size = 6
    end
    object queryCODSUBGRUPO: TStringField
      DisplayWidth = 6
      FieldName = 'CODSUBGRUPO'
      Size = 6
    end
    object queryCODFORNECEDOR: TStringField
      DisplayWidth = 6
      FieldName = 'CODFORNECEDOR'
      Size = 6
    end
    object queryCODMARCA: TStringField
      DisplayWidth = 6
      FieldName = 'CODMARCA'
      Size = 6
    end
    object queryDATA_ULTIMACOMPRA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATA_ULTIMACOMPRA'
    end
    object queryNOTAFISCAL: TStringField
      DisplayWidth = 7
      FieldName = 'NOTAFISCAL'
      Size = 7
    end
    object queryPRECOCUSTO: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOCUSTO'
    end
    object queryPRECOVENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOVENDA'
    end
    object queryDATA_ULTIMAVENDA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATA_ULTIMAVENDA'
    end
    object queryESTOQUE: TFloatField
      DisplayWidth = 10
      FieldName = 'ESTOQUE'
    end
    object queryESTOQUEMINIMO: TFloatField
      DisplayWidth = 10
      FieldName = 'ESTOQUEMINIMO'
    end
    object queryCODALIQUOTA: TStringField
      DisplayWidth = 5
      FieldName = 'CODALIQUOTA'
      Size = 5
    end
    object queryAPLICACAO: TMemoField
      DisplayWidth = 10
      FieldName = 'APLICACAO'
      BlobType = ftMemo
    end
    object queryLOCALICAZAO: TStringField
      DisplayWidth = 50
      FieldName = 'LOCALICAZAO'
      Size = 50
    end
    object queryPESO: TFloatField
      DisplayWidth = 10
      FieldName = 'PESO'
    end
    object queryVALIDADE: TStringField
      DisplayWidth = 20
      FieldName = 'VALIDADE'
    end
    object queryCOMISSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'COMISSAO'
    end
    object queryUSA_BALANCA: TIntegerField
      DisplayWidth = 10
      FieldName = 'USA_BALANCA'
    end
    object queryUSA_SERIAL: TIntegerField
      DisplayWidth = 10
      FieldName = 'USA_SERIAL'
    end
    object queryUSA_GRADE: TIntegerField
      DisplayWidth = 10
      FieldName = 'USA_GRADE'
    end
    object queryCODRECEITA: TStringField
      DisplayWidth = 6
      FieldName = 'CODRECEITA'
      Size = 6
    end
    object queryFOTO: TStringField
      DisplayWidth = 80
      FieldName = 'FOTO'
      Size = 80
    end
    object queryDATA_ULTIMACOMPRA_ANTERIOR: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATA_ULTIMACOMPRA_ANTERIOR'
    end
    object queryNOTAFISCAL_ANTERIOR: TStringField
      DisplayWidth = 6
      FieldName = 'NOTAFISCAL_ANTERIOR'
      Size = 6
    end
    object queryCODFORNECEDOR_ANTERIOR: TStringField
      DisplayWidth = 6
      FieldName = 'CODFORNECEDOR_ANTERIOR'
      Size = 6
    end
    object queryPRECOCUSTO_ANTERIOR: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOCUSTO_ANTERIOR'
    end
    object queryPRECOVENDA_ANTERIOR: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOVENDA_ANTERIOR'
    end
    object queryCUSTOMEDIO: TFloatField
      DisplayWidth = 10
      FieldName = 'CUSTOMEDIO'
    end
    object queryAUTO_APLICACAO: TStringField
      DisplayWidth = 60
      FieldName = 'AUTO_APLICACAO'
      Size = 60
    end
    object queryAUTO_COMPLEMENTO: TStringField
      DisplayWidth = 60
      FieldName = 'AUTO_COMPLEMENTO'
      Size = 60
    end
    object queryDATA_REMARCACAO_CUSTO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATA_REMARCACAO_CUSTO'
    end
    object queryDATA_REMARCACAO_VENDA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATA_REMARCACAO_VENDA'
    end
    object queryPRECO_PROMOCAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECO_PROMOCAO'
    end
    object queryDATA_PROMOCAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATA_PROMOCAO'
    end
    object queryFIM_PROMOCAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'FIM_PROMOCAO'
    end
    object queryCST: TStringField
      DisplayWidth = 10
      FieldName = 'CST'
      Size = 10
    end
    object queryCLASSIFICACAO_FISCAL: TStringField
      DisplayWidth = 20
      FieldName = 'CLASSIFICACAO_FISCAL'
    end
    object queryNBM: TStringField
      DisplayWidth = 20
      FieldName = 'NBM'
    end
    object queryNCM: TStringField
      DisplayWidth = 20
      FieldName = 'NCM'
    end
    object queryALIQUOTA: TFloatField
      DisplayWidth = 10
      FieldName = 'ALIQUOTA'
    end
    object queryIPI: TFloatField
      DisplayWidth = 10
      FieldName = 'IPI'
    end
    object queryREDUCAO: TFloatField
      DisplayWidth = 10
      FieldName = 'REDUCAO'
    end
    object queryQTDE_EMBALAGEM: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDE_EMBALAGEM'
    end
    object queryTIPO: TStringField
      DisplayWidth = 30
      FieldName = 'TIPO'
      Size = 30
    end
    object queryPESO_LIQUIDO: TFloatField
      DisplayWidth = 10
      FieldName = 'PESO_LIQUIDO'
    end
    object queryFARMACIA_CONTROLADO: TStringField
      DisplayWidth = 1
      FieldName = 'FARMACIA_CONTROLADO'
      Size = 1
    end
    object queryFARMACIA_APRESENTACAO: TIntegerField
      DisplayWidth = 10
      FieldName = 'FARMACIA_APRESENTACAO'
    end
    object queryFARMACIA_REGISTRO_MEDICAMENTO: TStringField
      DisplayWidth = 20
      FieldName = 'FARMACIA_REGISTRO_MEDICAMENTO'
    end
    object queryFARMACIA_PMC: TFloatField
      DisplayWidth = 10
      FieldName = 'FARMACIA_PMC'
    end
    object queryULTIMA_ALTERACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'ULTIMA_ALTERACAO'
    end
    object queryULTIMA_CARGA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'ULTIMA_CARGA'
    end
    object queryDATA_INVENTARIO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATA_INVENTARIO'
    end
    object queryCUSTO_INVENTARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'CUSTO_INVENTARIO'
    end
    object queryESTOQUE_INVENTARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'ESTOQUE_INVENTARIO'
    end
    object queryESTOQUE_ANTERIOR: TFloatField
      DisplayWidth = 10
      FieldName = 'ESTOQUE_ANTERIOR'
    end
    object queryPRECOVENDA_NOVO: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOVENDA_NOVO'
    end
    object queryUSA_RENTABILIDADE: TIntegerField
      DisplayWidth = 10
      FieldName = 'USA_RENTABILIDADE'
    end
    object queryQUANTIDADE_MINIMA_FAB: TFloatField
      DisplayWidth = 10
      FieldName = 'QUANTIDADE_MINIMA_FAB'
    end
    object queryAPRESENTACAO: TStringField
      DisplayWidth = 60
      FieldName = 'APRESENTACAO'
      Size = 60
    end
    object querySITUACAO: TIntegerField
      DisplayWidth = 10
      FieldName = 'SITUACAO'
    end
    object queryPRECOVENDA1: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOVENDA1'
    end
    object queryPRECOVENDA2: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOVENDA2'
    end
    object queryPRECOVENDA3: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOVENDA3'
    end
    object queryPRECOVENDA4: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOVENDA4'
    end
    object queryPRECOVENDA5: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOVENDA5'
    end
    object queryDESCONTO_PRECOVENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'DESCONTO_PRECOVENDA'
    end
    object queryDATA_INVENTARIO_ATUAL: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATA_INVENTARIO_ATUAL'
    end
    object queryCUSTO_INVENTARIO_ATUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'CUSTO_INVENTARIO_ATUAL'
    end
    object queryESTOQUE_INVENTARIO_ATUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'ESTOQUE_INVENTARIO_ATUAL'
    end
    object queryMARGEM_MINIMA: TFloatField
      DisplayWidth = 10
      FieldName = 'MARGEM_MINIMA'
    end
    object queryPISCOFINS: TStringField
      DisplayWidth = 1
      FieldName = 'PISCOFINS'
      Size = 1
    end
    object queryREFERENCIA_FORNECEDOR: TStringField
      DisplayWidth = 30
      FieldName = 'REFERENCIA_FORNECEDOR'
      Size = 30
    end
    object queryCOMISSAO1: TFloatField
      DisplayWidth = 10
      FieldName = 'COMISSAO1'
    end
    object queryMARGEM_DESCONTO: TFloatField
      DisplayWidth = 10
      FieldName = 'MARGEM_DESCONTO'
    end
    object queryTAMANHO: TStringField
      DisplayWidth = 6
      FieldName = 'TAMANHO'
      Size = 6
    end
    object queryCOR: TStringField
      DisplayWidth = 6
      FieldName = 'COR'
      Size = 6
    end
    object queryINCIDENCIA_PISCOFINS: TStringField
      DisplayWidth = 30
      FieldName = 'INCIDENCIA_PISCOFINS'
      Size = 30
    end
    object queryVEIC_CHASSI: TStringField
      DisplayWidth = 50
      FieldName = 'VEIC_CHASSI'
      Size = 50
    end
    object queryVEIC_SERIE: TStringField
      DisplayWidth = 50
      FieldName = 'VEIC_SERIE'
      Size = 50
    end
    object queryVEIC_POTENCIA: TStringField
      DisplayWidth = 50
      FieldName = 'VEIC_POTENCIA'
      Size = 50
    end
    object queryVEIC_PESO_LIQUIDO: TStringField
      DisplayWidth = 15
      FieldName = 'VEIC_PESO_LIQUIDO'
      Size = 15
    end
    object queryVEIC_PESO_BRUTO: TStringField
      DisplayWidth = 15
      FieldName = 'VEIC_PESO_BRUTO'
      Size = 15
    end
    object queryVEIC_TIPO_COMBUSTIVEL: TStringField
      DisplayWidth = 20
      FieldName = 'VEIC_TIPO_COMBUSTIVEL'
    end
    object queryVEIC_RENAVAM: TStringField
      DisplayWidth = 50
      FieldName = 'VEIC_RENAVAM'
      Size = 50
    end
    object queryVEIC_ANO_FABRICACAO: TIntegerField
      DisplayWidth = 10
      FieldName = 'VEIC_ANO_FABRICACAO'
    end
    object queryVEIC_ANO_MODELO: TIntegerField
      DisplayWidth = 10
      FieldName = 'VEIC_ANO_MODELO'
    end
    object queryVEIC_TIPO: TStringField
      DisplayWidth = 50
      FieldName = 'VEIC_TIPO'
      Size = 50
    end
    object queryVEIC_TIPO_PINTURA: TStringField
      DisplayWidth = 15
      FieldName = 'VEIC_TIPO_PINTURA'
      Size = 15
    end
    object queryVEIC_COD_COR: TStringField
      DisplayWidth = 15
      FieldName = 'VEIC_COD_COR'
      Size = 15
    end
    object queryVEIC_COR: TStringField
      DisplayWidth = 30
      FieldName = 'VEIC_COR'
      Size = 30
    end
    object queryVEIC_VIN: TStringField
      DisplayWidth = 10
      FieldName = 'VEIC_VIN'
      Size = 10
    end
    object queryVEIC_NUMERO_MOTOR: TStringField
      DisplayWidth = 50
      FieldName = 'VEIC_NUMERO_MOTOR'
      Size = 50
    end
    object queryVEIC_CMKG: TStringField
      DisplayWidth = 15
      FieldName = 'VEIC_CMKG'
      Size = 15
    end
    object queryVEIC_CM3: TStringField
      DisplayWidth = 15
      FieldName = 'VEIC_CM3'
      Size = 15
    end
    object queryVEIC_DISTANCIA_EIXO: TStringField
      DisplayWidth = 15
      FieldName = 'VEIC_DISTANCIA_EIXO'
      Size = 15
    end
    object queryVEIC_COD_MARCA: TStringField
      DisplayWidth = 15
      FieldName = 'VEIC_COD_MARCA'
      Size = 15
    end
    object queryVEIC_ESPECIE: TStringField
      DisplayWidth = 50
      FieldName = 'VEIC_ESPECIE'
      Size = 50
    end
    object queryVEIC_CONDICAO: TStringField
      DisplayWidth = 50
      FieldName = 'VEIC_CONDICAO'
      Size = 50
    end
    object queryLOTE_FABRICACAO: TStringField
      DisplayWidth = 20
      FieldName = 'LOTE_FABRICACAO'
    end
    object queryLOTE_VALIDADE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'LOTE_VALIDADE'
    end
    object queryMARGEM_AGREGADA: TFloatField
      DisplayWidth = 10
      FieldName = 'MARGEM_AGREGADA'
    end
    object queryCODBARRA_NOVARTIS: TStringField
      DisplayWidth = 13
      FieldName = 'CODBARRA_NOVARTIS'
      Size = 13
    end
    object queryFARMACIA_DCB: TStringField
      DisplayWidth = 20
      FieldName = 'FARMACIA_DCB'
    end
    object queryFARMACIA_ABCFARMA: TStringField
      DisplayWidth = 10
      FieldName = 'FARMACIA_ABCFARMA'
      Size = 10
    end
    object queryFARMACIA_APRESENTACAO_CAIXA: TStringField
      DisplayWidth = 10
      FieldName = 'FARMACIA_APRESENTACAO_CAIXA'
      Size = 10
    end
    object queryFARMACIA_PRINCIPIOATIVO: TStringField
      DisplayWidth = 30
      FieldName = 'FARMACIA_PRINCIPIOATIVO'
      Size = 30
    end
    object queryULTIMA_COMPRA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'ULTIMA_COMPRA'
    end
    object queryFARMACIA_DATAVIGENCIA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'FARMACIA_DATAVIGENCIA'
    end
    object queryFARMACIA_TIPO: TStringField
      DisplayWidth = 1
      FieldName = 'FARMACIA_TIPO'
      Size = 1
    end
    object queryUSA_COMBUSTIVEL: TStringField
      DisplayWidth = 1
      FieldName = 'USA_COMBUSTIVEL'
      Size = 1
    end
    object queryREFERENCIA: TStringField
      DisplayWidth = 30
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object queryPERDA: TFloatField
      DisplayWidth = 10
      FieldName = 'PERDA'
    end
    object queryCOMPOSICAO1: TStringField
      DisplayWidth = 30
      FieldName = 'COMPOSICAO1'
      Size = 30
    end
    object queryCOMPOSICAO2: TStringField
      DisplayWidth = 30
      FieldName = 'COMPOSICAO2'
      Size = 30
    end
    object queryIAT: TStringField
      DisplayWidth = 1
      FieldName = 'IAT'
      Size = 1
    end
    object queryIPPT: TStringField
      DisplayWidth = 1
      FieldName = 'IPPT'
      Size = 1
    end
    object querySITUACAO_TRIBUTARIA: TStringField
      DisplayWidth = 1
      FieldName = 'SITUACAO_TRIBUTARIA'
      Size = 1
    end
    object queryFLAG_SIS: TStringField
      DisplayWidth = 1
      FieldName = 'FLAG_SIS'
      Size = 1
    end
    object queryFLAG_ACEITO: TStringField
      DisplayWidth = 3
      FieldName = 'FLAG_ACEITO'
      Size = 3
    end
    object queryFLAG_EST: TStringField
      DisplayWidth = 1
      FieldName = 'FLAG_EST'
      Size = 1
    end
    object queryCSOSN: TStringField
      DisplayWidth = 60
      FieldName = 'CSOSN'
      Size = 60
    end
    object queryCODORIGINAL: TStringField
      DisplayWidth = 20
      FieldName = 'CODORIGINAL'
    end
    object queryCUSTO_ATACADO: TFloatField
      DisplayWidth = 10
      FieldName = 'CUSTO_ATACADO'
    end
    object queryUNIDADE_ATACADO: TStringField
      DisplayWidth = 2
      FieldName = 'UNIDADE_ATACADO'
      Size = 2
    end
    object queryQTDE_EMBALAGEMATACADO: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDE_EMBALAGEMATACADO'
    end
    object queryPMARGEM1: TFloatField
      DisplayWidth = 10
      FieldName = 'PMARGEM1'
    end
    object queryPMARGEM2: TFloatField
      DisplayWidth = 10
      FieldName = 'PMARGEM2'
    end
    object queryPMARGEM3: TFloatField
      DisplayWidth = 10
      FieldName = 'PMARGEM3'
    end
    object queryPMARGEM4: TFloatField
      DisplayWidth = 10
      FieldName = 'PMARGEM4'
    end
    object queryPMARGEM5: TFloatField
      DisplayWidth = 10
      FieldName = 'PMARGEM5'
    end
    object queryPMARGEMATACADO1: TFloatField
      DisplayWidth = 10
      FieldName = 'PMARGEMATACADO1'
    end
    object queryPMARGEMATACADO2: TFloatField
      DisplayWidth = 10
      FieldName = 'PMARGEMATACADO2'
    end
    object queryPMARGEMATACADO3: TFloatField
      DisplayWidth = 10
      FieldName = 'PMARGEMATACADO3'
    end
    object queryPMARGEMATACADO4: TFloatField
      DisplayWidth = 10
      FieldName = 'PMARGEMATACADO4'
    end
    object queryPMARGEMATACADO5: TFloatField
      DisplayWidth = 10
      FieldName = 'PMARGEMATACADO5'
    end
    object queryPMARGEMATACADO6: TFloatField
      DisplayWidth = 10
      FieldName = 'PMARGEMATACADO6'
    end
    object queryPRECOATACADO1: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOATACADO1'
    end
    object queryPRECOATACADO2: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOATACADO2'
    end
    object queryPRECOATACADO3: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOATACADO3'
    end
    object queryPRECOATACADO4: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOATACADO4'
    end
    object queryPRECOATACADO5: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOATACADO5'
    end
    object queryIND_CFOP: TStringField
      DisplayWidth = 6
      FieldName = 'IND_CFOP'
      Size = 6
    end
    object queryCFOP_DESC: TStringField
      DisplayWidth = 30
      FieldName = 'CFOP_DESC'
      Size = 30
    end
    object queryUSA_LOTE: TIntegerField
      DisplayWidth = 10
      FieldName = 'USA_LOTE'
    end
    object queryIND_CFOP_VENDA_DENTRO: TStringField
      DisplayWidth = 6
      FieldName = 'IND_CFOP_VENDA_DENTRO'
      Size = 6
    end
    object queryCODCONTA: TStringField
      DisplayWidth = 6
      FieldName = 'CODCONTA'
      Size = 6
    end
    object queryIND_CFOP_VENDA_FORA: TStringField
      DisplayWidth = 6
      FieldName = 'IND_CFOP_VENDA_FORA'
      Size = 6
    end
    object queryIND_CFOP_DEVOLUCAO_DENTRO: TStringField
      DisplayWidth = 6
      FieldName = 'IND_CFOP_DEVOLUCAO_DENTRO'
      Size = 6
    end
    object queryIND_CFOP_DEVOLUCAO_FORA: TStringField
      DisplayWidth = 6
      FieldName = 'IND_CFOP_DEVOLUCAO_FORA'
      Size = 6
    end
    object queryIND_CFOP_GARANTIA_DENTRO: TStringField
      DisplayWidth = 6
      FieldName = 'IND_CFOP_GARANTIA_DENTRO'
      Size = 6
    end
    object queryIND_CFOP_GARANTIA_FORA: TStringField
      DisplayWidth = 6
      FieldName = 'IND_CFOP_GARANTIA_FORA'
      Size = 6
    end
    object queryUSA_TB_PC: TStringField
      DisplayWidth = 4
      FieldName = 'USA_TB_PC'
      Size = 4
    end
    object queryCODPRODUTO: TStringField
      DisplayWidth = 10
      FieldName = 'CODPRODUTO'
      ReadOnly = True
      Size = 10
    end
    object queryCODFILIAL: TStringField
      DisplayWidth = 10
      FieldName = 'CODFILIAL'
      ReadOnly = True
      Size = 10
    end
    object queryESTOQUE_INICIAL: TFloatField
      DisplayWidth = 10
      FieldName = 'ESTOQUE_INICIAL'
      ReadOnly = True
    end
    object queryENTRADAS: TFloatField
      DisplayWidth = 10
      FieldName = 'ENTRADAS'
      ReadOnly = True
    end
    object querySAIDAS: TFloatField
      DisplayWidth = 10
      FieldName = 'SAIDAS'
      ReadOnly = True
    end
    object queryESTOQUE_ATUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'ESTOQUE_ATUAL'
      ReadOnly = True
    end
    object queryULTIMA_ENTRADA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'ULTIMA_ENTRADA'
      ReadOnly = True
    end
    object queryULTIMA_SAIDA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'ULTIMA_SAIDA'
      ReadOnly = True
    end
    object queryNOTA_FISCAL: TStringField
      DisplayWidth = 10
      FieldName = 'NOTA_FISCAL'
      ReadOnly = True
      Size = 10
    end
  end
  object query2: TUniQuery
    Connection = frmModulo.Conexao_Numerador
    SQL.Strings = (
      'select * from c000009')
    Left = 288
    Top = 245
  end
end
