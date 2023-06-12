unit principal;

interface

uses
  //SYSTEM
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Actions,
  System.ImageList,
  //WINAPI
  Winapi.Windows,
  Winapi.Messages,
  //JV
  JvBaseDlg,
  JvSelectDirectory,
  //ACBR
  ACBrBAL,
  ACBrDevice,
  ACBrValidador,
  ACBrBase,
  ACBrDFe,
  ACBrNFe,
  //VCL
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ActnList,
  Vcl.Buttons,
  Vcl.ImgList,
  Vcl.ExtCtrls,
  //ADV
  AdvSmoothButton,
  AdvMetroButton,
  AdvSmoothPanel,
  AdvSmoothExpanderPanel,
  //DX
  dxGDIPlusClasses,
  dxTileControl,
  dxCustomTileControl,
  //CY
  cyBaseSpeedButton,
  cySpeedButton,
  //Outros
  cxClasses,
  MidasLib,
  Data.DB,
  MemDS,
  DBAccess,
  Uni,
  TFlatHintUnit,
  LockApplication,
  ResizeKit,
  IniFiles,
  acPNG, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, Vcl.ComCtrls, CellEditors,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet, frxClass;








type
  TImpressora = (SemImpressora, NaoFiscal, Fiscal);
  TGaveta = (SemGaveta, GavImpNaoFiscal, GavImpFiscal);

type
  TfrmPrincipal = class(TForm)
    ImageList1: TImageList;
    ResizeKit1: TResizeKit;
    AdvSmoothExpanderPanel1: TAdvSmoothExpanderPanel;
    Label17: TLabel;
    AdvMetroButton1: TAdvMetroButton;
    AdvMetroButton2: TAdvMetroButton;
    imgFundo: TImage;
    store_protect: TLockApplication;
    FlatHint1: TFlatHint;
    IBCDataSource1: TUniDataSource;
    qrForma: TUniQuery;
    query: TUniQuery;
    query2: TUniQuery;
    query3: TUniQuery;
    ActionList1: TActionList;
    vender: TAction;
    configuracoes: TAction;
    menu_fiscal: TAction;
    balanca: TAction;
    ecf: TAction;
    sobre: TAction;
    sair: TAction;
    usuario: TAction;
    mudarsenha: TAction;
    logoff: TAction;
    ACBrNFe1: TACBrNFe;
    CheckCPF1: TACBrValidador;
    TestaCnpj: TACBrValidador;
    GerenciarNFCe: TAction;
    DIretorio: TJvSelectDirectory;
    cyspdbtn1: TcySpeedButton;
    cyspdbtnvenda: TcySpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Query_dbservidor: TUniQuery;
    cySpeedButton1: TcySpeedButton;
    bt_ok: TButton;
    IdFTP1: TIdFTP;
    Label18: TLabel;
    qrPDV: TUniQuery;
    qrServidor: TUniQuery;
    dataini: TDatePickerEditor;
    FDQrmestre: TFDQuery;
    FDconn_servidor: TFDConnection;
    FBquery: TFDQuery;
    lbip_servidor: TLabel;
    qrpdv2: TUniQuery;
    qrfilial: TUniQuery;
    qrfilialDATA_VENCIMENTO: TDateField;
    AdvSmoothButton7: TcySpeedButton;
    cySpeedButton2: TcySpeedButton;
    frxRelSimples: TfrxReport;
    qrverificar_data: TUniQuery;
    qrverificar_dataSV: TUniQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ECF1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure NotaFiscalMod2SerieD1Click(Sender: TObject);
    procedure MenuFiscal1Click(Sender: TObject);
    procedure Balana1Click(Sender: TObject);
    procedure Geral1Click(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure AdvGlowButton175Click(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure AdvGlowButton4Click(Sender: TObject);
    procedure CarregaSistemaVenda;
    procedure VendasPDV1Click(Sender: TObject);
    procedure tlResearchClick(Sender: TdxTileControlItem);
    procedure tlPhotosClick(Sender: TdxTileControlItem);
    procedure tlAgentsClick(Sender: TdxTileControlItem);
    procedure dxtlcntrltmTileItem1Click(Sender: TdxTileControlItem);
    procedure tlUserManagementClick(Sender: TdxTileControlItem);
    procedure tlSystemInformationClick(Sender: TdxTileControlItem);
    procedure dxTileItem1Click(Sender: TdxTileControlItem);
    procedure V1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure pstatusClick(Sender: TObject);
    procedure AdvMetroButton2Click(Sender: TObject);
    procedure bt_menu02Click(Sender: TObject);
    procedure AdvMetroButton1Click(Sender: TObject);
    procedure cyspdbtnvendaClick(Sender: TObject);
    procedure venderExecute(Sender: TObject);
    procedure configuracoesExecute(Sender: TObject);
    procedure menu_fiscalExecute(Sender: TObject);
    procedure balancaExecute(Sender: TObject);
    procedure ecfExecute(Sender: TObject);
    procedure sobreExecute(Sender: TObject);
    procedure sairExecute(Sender: TObject);
    procedure GerenciarNFCeExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cyspdbtn1Click(Sender: TObject);
    procedure cySpeedButton1Click(Sender: TObject);
    function autentica(FUNCAO: string; nivel: Integer): Boolean;
    function autentica_caixa(FUNCAO: string; nivel: Integer): Boolean;
    procedure bt_okClick(Sender: TObject);
  private
    iGaveta: Integer;
    { Private declarations }
    function LerFormasPagto: Boolean;
    procedure AdicionarCaixas;
    procedure AdicionarUsuarios;
    procedure AdicionarVendedores;
    procedure AdicionarClientes;

  public
    { Public declarations }
    TipoImpressora: TImpressora;
    GavetaImpressora: TGaveta;

    procedure GravaIni(sArquivo, Secao, Linha, Valor: string);
    function LerIni(sArquivo, Secao, Linha: string; Def: string): string;

    function ApenasNumerosStr(pStr: string): string;

    function IsInteger(s: string): integer;

    function codifica(Tabela: string; qtde_digitos: integer): string;
    function adic_codifica(TABELA: string): string;

  end;

type
 // tipo de bandeira tef
  Tbandeira_tef = (Tef_Redecard, Tef_Visanet, Tef_Amex, Tef_TecBan,
    Tef_Hipercard, Tef_Tribanco);

var
  frmPrincipal: TfrmPrincipal;

  // configura��es

  bPermite_DAV_ECF, // ativa/desativa impressao do dav no ECF
    bPermite_DAV_NF, // ativa/desativa impressao do dav em equipamento nao fiscal
    bPermite_Prevenda, // ativa/desativa fechamento de pre-venda
    bPermite_OS // ativa/desativa ordem de servico
    : boolean;

  // retorno da busca de produtos
  sProd_nome,
    sProd_barra,
    sProd_unidade,
    sProd_CST: string;
  iImpressora, iProd_codigo: integer;
  rProd_aliquota,
    rProd_Estoque,
    rProd_preco,
    rProd_qtde,
    rProd_total,
    rProd_desconto_maximo,
    rProd_acrescimo_maximo: real; // armazenar o desconto maximo permitido por produto
  rProd_desconto, rProd_acrescimo: real; // armazenar o desconto e acrescimo no item
  bProd_promocao: boolean; // armazenar se o produto estah em promocao
  sProd_Tamanho: string;
  sProd_Cor: string;

  (* Retorno do ECF *)
  sMsg: string;

  (*Lista de aliquotas*)
  laliquota: TstringList;
  (* Lista de Formas de Pagamento que exigem tratamento especial no fechamento da venda*)
  lForma_pgto_Cheque_Avista,lForma_pgto_Cheque_Aprazo, lForma_pgto_Crediario,
  lForma_pgto_Cartao_Debito,lForma_pgto_Cartao_Credito, lForma_pgto_dinheiro,
  lForma_pgto_Convenio: string;
  (* Dados do ECF *)
  sECF_Serial: string; // numero de serie do ECF registrado no sistema
  sECF_Caixa: string; // numero do caixa do ECF
  sECF_Operador: string; // numero do operadoro do ECF
  iECF_Modelo: integer; // modelo do ECF - 1 Bema / 2 Daruma / 3 Sweda
  sECF_Codigo_Sefa: string; // Cod do ECf na Sefa - Ver sistema VALIDADOR ECF
  sECF_MF_Adicional: string; // Letra indicativa da MF adicional do ECF (geralmente em branco)
  sECF_Tipo: string; // tipo do ecf ECF-IF ou ECF-PDV
  sECF_Marca: string; // Marcao do Ecf
  sECF_Modelo: string; // Modelo do ECF
  sECF_Versao_SB: string; // Versao do Software Basico do ECF
  sECF_Data_SB: string; // data de instalacao do Software basico do ecf
  sECF_Hora_SB: string; // hora de instalacao do software basico
  sECF_Porta: string;
  sECF_usuario: string;
  sECF_Desconto_Iss: string;
  sECF_Diretorio_MFD: string; // diretorio onde serah gravado o arquivo mdf feito por sistema
                                 // externo
  (* Informacoes temporarias do ECF *)
  dData_Sistema: Tdatetime;
  dData_Movimento: Tdatetime;
  hHora_Cupom: TDateTime;
  sNumero_Cupom: string; // numero do coo atual
  sNumero_Venda: string; // Numero do cupom fiscal atual
  sNumero_contador_cupom: string; // numero de contador do cupom fiscal atual
  sCOO, sGNF, sGRG, sCDC, sCER: string; // outros contadores do ecf
  (* Display do Teclado *)
  men: array[0..40] of byte; // armazenar dados para impressao no display do teclado
  (* Dados da empresa *)
  sEmpresa_CNPJ, sEmpresa_Nome, sEmpresa_IE, sEmpresa_IM,
    sEmpresa_Endereco, sempresa_Rua, sempresa_Numero, sempresa_Bairro,
    sEmpresa_Cidade, sempresa_complemento, sempresa_CEP,
    sempresa_telefone, sempresa_fax, sempresa_email,
    sEmpresa_UF, sempresa_Codigo, sempresa_ibge: string;
  (* Dados do Sistema / Empresa Desenvolvedora *)
  sPAF_Nome: string;
  sPAF_Versao: string;
  sPAF_Executavel: string;
  sPAF_Empresa: string;
  sPAF_CNPJ: string;
  sPAF_IE: string;
  sPAF_IM: string;
  sPAF_Endereco: string;
  sPAF_Telefone: string;
  sPAF_Contato: string;
  sPAF_Laudo: string;
  sPAF_MD5: string;
  (* Classificar o tipo de venda do sistema*)
  iTipo_Venda: integer; // 1 Super 2 Prevenda 3 Posto
  (* Configura�oes do Banco de Dados *)
  iTamanho_codigo_balanca: integer; // tamanho do codigo da balaca 4 ou 5
  bTruncar_valor: boolean; // config para nao permitir arredondamento do valor total do item
  bMuda_qtde: boolean; // configuracao para permitir a edicao da qtde
  bMudouProvisorio,  bMuda_unitario, bMensagem_Cupom: boolean; // configuracao para permitir a edicao do preco unitario
  bSenha_Cancel_Item: boolean; // exigir senha no cancelamento do item
  bSenha_Cancel_Cupom: boolean; // exigir senha no cancelamento do cupom

  iBal_time: integer; // configuracao de time out da balanca
  sBal_Resposta: string; // resposta da balanca
  rBal_peso: real; // peso lido na balanca

  iTeclado_Modelo: integer; // modelo do teclado
  sTeclado_porta: string; // porta do teclado
  sPasta_foto_produto: string; // pasta onde estao as fotos dos produtos
  sPasta_config: string;
  sArquivo_config: string;
  sPasta_sistema: string;

  bHabLogoMarca: Boolean; // Logo Marca PDV

  bBusca_foto_produto: boolean; // buscar foto do produto
  iPesquisa_produto: integer; // listar no grid do form produto_consulta os itens filtrados
                                 // 0 - pesquisa feita no form de pesquisa
                                 // 1 - pesquisa feita na venda
                                 // 2 - pesquisa feita no form de consulta de preco



  SDAV_ATUALIZADO: string;

  (* Dados do Consumidor *)
  sCli_Nome, sCli_Endereco, sCli_CPF, sCli_Cidade, sCli_Placa, sCli_Km,
    sCli_uf, sCli_codigo, scli_cep, scli_vendedor: string;

  (* Controles de venda *)
  bVenda_Cartao, bVenda_Crediario,
    bVenda_Cheque, bVenda_dinheiro,
    bVenda_Convenio: boolean; // verificar se foi vendido nas formas de pagamento que exigem
                               // tratamento especial
  bConsulta_crediario: boolean; // verificar se a consulta na tela de clientes � para o
                                   // crediario;
  iCrediario_prestacao: integer; // armazenar a qtde de prestacoes no crediario
  sCrediario_Nome: string; // nome da forma de pagamento de creadiario

  bCadastra_Cheque, bCadastra_Placa,
    bCadastra_Convenio, bCadastra_Crediario: boolean; // verificar cadastramentos no final da venda

  sTotalizador_Crediario,
    sNome_Totalizador_Crediario: string; // nome do totalizador gravado no ecf para emissao de compro-
                                     // vante nao fiscal no final da venda em crediario.

  sTotalizador_Recebimento,
    sNome_Totalizador_Recebimento: string; // nome do totalizador gravado no ecf para emissao de compro-
                                     // vante nao fiscal no final da venda em crediario.


  sIndice_Sangria, sIndice_Suprimento: string; // numero do indice gravado na impressora da
                                           // sangria e do suprimento
  iComprovente_Crediario,
    iComprovante_Crediario_produto: integer; // Imprimir comprovante nao fiscal do crediairo

  (* T E F *)
  bTEF, // verificar se utiliza TEF
    bTEF_Cheque, // Utiliza Consulta de Cheque por TEF
    bTEF_TecBan: boolean; // Utiliza bandeira TECBAN
  sForma_Temp: string; // armezar temporariamente a forma de pagamento a ser lancada no tef
  // armazenar bandeira escolhida do tef
  Tef_Bandeira_escolhida: Tbandeira_tef;


  (* Outras*)
  bContinua: boolean; // Continuar ou nao um procedimento/funcao
  bSair_campo: boolean; // for�ar a edicao do campo
  bSupervisor_autenticado: boolean; // verifiar se o supervisor foi logado

  (* Usuario e Senha *)
  sFuncao_Senha: string; // determinar a funcao para a tela de senha
  busuario_autenticado: boolean; // verificar se o usuario foi autenticado
  icodigo_Usuario: integer; // codigo do usuario logado
  sNome_Operador: string; // nome do operador
  iNumCaixa: integer; // Identifica��o do caixa
  iCFOP: string; // cfop de venda paf

  (* Identificacao do consumidor no inicio da venda --> CAt52 *)
  bIdentifica_consumidor: boolean;
  sConsumidor_CPF, sConsumidor_Nome, sConsumidor_Endereco: string;

  (* variaveis de comunicao com o servidor *)
  sServidor_host, sServidor_Base: string;
  bServidor_Conexao: boolean;

  (* Pre venda *)
  bLanca_pre_venda: boolean; // flag para fazer o fechamento da pre-venda
  sPre_Venda_Numero: string; // armazenar o numero da prevenda para ser impresso no final do cupom
  iPre_venda_codigo, iPre_Venda_Vendedor, iPre_venda_cliente: integer; // codigo do vendedor e do cliente
  rPre_venda_desconto, rPre_venda_acrescimo: real; // acrescimo e desconto no fechamento


  (* OS *)
  bLanca_OS: boolean; // flag para fazer o fechamento da OS
  sOS_Numero: string; // armazenar o numero da prevenda para ser impresso no final do cupom
  iOS_codigo, iOS_Vendedor, iOS_cliente: integer; // codigo do vendedor e do cliente
  rOS_desconto, rOS_acrescimo: real; // acrescimo e desconto no fechamento


  (* Abasteciento *)
  bLanca_Abastecimento: boolean; // flag para fazer o fechamento do abastecimento

  (* Mesas *)
  bLanca_Mesa: boolean; // flag para fazer o fechamento da Mesa
  bLanca_Comanda: boolean; // flag para fazer o fechamento da Comanda/Mesa
  sMesa_Numero: string; // armazenar o numero da mesa para ser impresso no final do cupom
  iMesa_codigo: integer; // codigo da Mesa


  (* dav *)
  sDav_numero: string; // armazenar o numero do dav caso for ser impresso no final do cupom
  iDav_Os_tipo: integer; // tipo de os 0 -> Comum, 1 -> Mecanica

  (* atualizacao de dados *)
  sCarga_data, scarga_hora: string; // data e hora da ultima atualizacao de dados
  Arquivo_ini: TIniFile; // nome do arquivo .ini

  (*flag de retorno da situacao do caixa e da venda*)
  bCaixa_aberto: boolean;
  bativa_venda: boolean;

  // ramo de atividade
  sRamo_Tipo: string;

  // posto - rodape do cupom fiscal
  sPosto_rodape: string;
  iCodigo_abastecimento, ilinha_abastecimento: integer;

  // posto - porta de comunicacao com Concentrador
  iPosto_porta: integer;

  // habilitar mensagem de apuracao de erro no tef
  bHabilita_msg: boolean;

  // verificar se o cupom estah aberto, caso o comando direto da ecf falhe
  bcupom_aberto: boolean;

  // verificar se pede senha ao dar desconto
  isenha_desconto: integer;
  rDesconto_maximo, racrescimo_maximo: real;

  // GUIO: Identifica o �ndice de Substitui��o, Isento e N�o Incid�ncia
  // de acordo com o ECF
  sFF: string; // Substituicao
  sNN: string; // N�o Incid�ncia
  sII: string; // Isento

  // Verificar se vai pedir para identificar o vendedor no fechamento
  // da venda ou n�o
  bIdentificarVendedor: Integer;

  //  Identifica qual o campo ser� mostrado na coluna onde �tem o c�digo
  // de barras na consulta do produto
  // 0 - C�digo de Barras, 1 - Refer�ncia, 2 - Refer�ncia+Tamanho+Cor
  iColunaCOnsultaProdutos: Integer;

  sPortaNaoFiscal, sPortaGaveta: string; // Porta de Impressora e gaveta nao Fiscal
  iQtdLinhasFinal: Integer; // quantidade de linhas no final da nota 40c

implementation

uses modulo, funcoes, venda, senha, unECF, msg_Operador, config_ecf, unTEF,
  TEF_Cancelamento, Orcamento, produto_consulta, Orcamento_Abrir, Math,
  caixa_abertura, menu_fiscal, notafiscal_menu, config_balanca, Config,
  UtiSplash, UFuncoes, sobre, Unit_ativar, contasreceber, frmNFCEs,
  senha_supervisor, BalancaTeste1, splash, splash_venda;


{$R *.dfm}

function tfrmprincipal.codifica(tabela: string; qtde_digitos: integer): string;
begin
  frmmodulo.qrmestre.close;
  frmmodulo.qrmestre.sql.Clear;
  frmmodulo.qrmestre.sql.add('select * from c000000 where codigo = ''' + tabela + '''');
  frmmodulo.qrMestre.Open;
  if frmmodulo.qrmestre.RecNo = 1 then
  begin
    if frmmodulo.qrmestre.FieldByName('sequencia').asinteger < 1 then
    begin
      result := '0000000001';
      frmmodulo.qrMestre.Edit;
      frmmodulo.qrMestre.fieldbyname('sequencia').asinteger := 2;
      frmmodulo.qrMestre.Post;

    end
    else
    begin
      result := zerar(inttostr(frmmodulo.qrMestre.fieldbyname('sequencia').asinteger), qtde_digitos);
      frmmodulo.qrMestre.Edit;
      frmmodulo.qrMestre.fieldbyname('sequencia').asinteger := frmmodulo.qrMestre.fieldbyname('sequencia').asinteger + 1;
      frmmodulo.qrMestre.Post;
    end;
  end
  else
  begin
    Showmessage('N�o foi poss�vel concluir com a opera��o!' + #13 + 'Erro: C�digo de sequ�ncia n�o encontrado na tabela de c�digos.');
  end;
end;

procedure TfrmPrincipal.configuracoesExecute(Sender: TObject);
begin

  frmsenha_supervisor := tfrmsenha_supervisor.create(self);
  frmsenha_supervisor.showmodal;

  if not bSupervisor_autenticado then
    Exit;
  frmconfig_balanca := tfrmconfig_balanca.create(self);
  frmconfig_balanca.showmodal;


  {frmsenha_supervisor := tfrmsenha_supervisor.create(self);
  frmsenha_supervisor.showmodal;

  if not bSupervisor_autenticado then
    Exit;
  frmconfig := tfrmconfig.create(self);
  frmconfig.showmodal;}
end;

function TfrmPrincipal.autentica(FUNCAO: string; nivel: Integer): Boolean;
begin
  frmsenha := tfrmsenha.create(self);
 // frmsenha.lfuncao.caption := IntToStr(nivel) + ' - ' + FUNCAO;
  frmsenha.showmodal;
  //result := autenticado;
end;

function TfrmPrincipal.autentica_caixa(FUNCAO: string; nivel: Integer): Boolean;
begin
  //frmsenha_caixa := tfrmsenha_caixa.create(self);
 // frmsenha_caixa.lfuncao.caption := IntToStr(nivel) + ' - ' + FUNCAO;
 // frmsenha_caixa.showmodal;

  //result := autenticado;
end;

procedure TfrmPrincipal.cyspdbtnvendaClick(Sender: TObject);

begin
       {frmsenha := tfrmsenha.create(self);
       frmsenha.showmodal;}
            CarregaSistemaVenda;
end;

procedure TfrmPrincipal.cySpeedButton1Click(Sender: TObject);
begin
  frmNotasconsumidor := tfrmNotasconsumidor.create(self);
  frmNotasconsumidor.showmodal;
  FreeAndNil(frmNotasconsumidor);
end;

procedure TfrmPrincipal.cyspdbtn1Click(Sender: TObject);
begin
  frmsenha_supervisor := tfrmsenha_supervisor.create(self);
  frmsenha_supervisor.showmodal;

  if not bSupervisor_autenticado then
    Exit;
  frmconfig := tfrmconfig.create(self);
  frmconfig.showmodal;
end;

procedure TfrmPrincipal.bt_okClick(Sender: TObject);
begin

end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
  MyClass: TObject;
  wOldErrorMode: Word;
begin
    {wOldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
  if Application.MessageBox('Confirma o encerramento do sistema?', 'Aviso',
    mb_yesno + MB_ICONWARNING) = idNo then
    abort;
  application.Terminate;
  Action := cafree; }
  //close;
  // liberar array da memoria
  Finalize(men);
  Finalize(tbTotalizador);

  // liberar sistema da memoria
  action := cafree;
end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

   begin
   frmsplash := Tfrmsplash.create(self);
   frmsplash.showmodal
   end;


  //store_protect.IDSistema := 1989;
  //store_protect.executar;
  // Configura��es para gaveta e tipo de impressora - nao remover o extractfilepath
  iImpressora := 1;
  iGaveta := StrToInt(frmPrincipal.LerINi(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'GAVETA', 'LOCAL', '0'));


  case iImpressora of
    0: begin // Sem Impressora
        TipoImpressora := SemImpressora;
      end;
    1: begin // Nao Fiscal
        TipoImpressora := NaoFiscal;
      end;
    2: begin // Fiscal
        TipoImpressora := Fiscal;
      end;

  end;

  case iGaveta of
    0: begin // Sem Gaveta
        GavetaImpressora := SemGaveta;
      end;
    1: begin // Gaveta Impressora Nao Fiscal
        GavetaImpressora := GavImpNaoFiscal;
      end;
    2: begin // Gaveta Impressora Fiscal
        GavetaImpressora := GavImpFiscal;
      end;

  end;



  Top := 0;
  Left := 0;


//  bHabilita_msg := true;

  try
    AcertaPadraoData;
  except
  end;

  frmModulo := TfrmModulo.create(self);

  frmModulo.conexao.Connected := false;
  frmModulo.conexao.Server := LerINi(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'CONFIGURACOES', 'SERVIDOR_PDV', '');
  frmModulo.conexao.Database := LerINi(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'CONFIGURACOES', 'BDLOCAL', '');
  frmModulo.conexao.Connected := true;

  try
    frmModulo.Conexao_Servidor.Connected := false;
    frmModulo.Conexao_Servidor.Server := LerINi(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'CONFIGURACOES', 'SERVIDOR', '');
    frmModulo.Conexao_Servidor.Database := LerINi(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'CONFIGURACOES', 'BDSERVIDOR', '');
    frmModulo.Conexao_Servidor.Connected := true;

    frmModulo.Conexao_Numerador.Connected := false;
    frmModulo.Conexao_Numerador.Server := LerINi(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'CONFIGURACOES', 'SERVIDOR', '');
    frmModulo.Conexao_Numerador.Database := LerINi(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'CONFIGURACOES', 'BDSERVIDOR', '');
    frmModulo.Conexao_Numerador.Connected := true;
    lbip_servidor.Caption := LerINi(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'CONFIGURACOES', 'SERVIDOR', '');
    bServidor_Conexao := true;
  except
    bServidor_Conexao := false;
  end;

   begin
    AdicionarCaixas;
    AdicionarUsuarios;
    AdicionarVendedores;
    AdicionarClientes;
   end;

  if strtoint(LerINi(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'BALANCA', 'Modelo', '0')) <> 0 then begin
    frmmodulo.balanca.Modelo :=  TACBrBALModelo(StrToInt(LerIni(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'BALANCA', 'Modelo', '0')));
    frmmodulo.balanca.Device.HandShake := TACBrHandShake(StrToInt(LerIni(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'BALANCA', 'Handshaking', '0')));
    frmmodulo.balanca.Device.Parity := TACBrSerialParity(StrToInt(LerIni(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'BALANCA', 'Parity', '0')));
    frmmodulo.balanca.Device.Stop := TACBrSerialStop(StrToInt(LerIni(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'BALANCA', 'Stopbits', '0')));
    frmmodulo.balanca.Device.Porta := LerIni(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'BALANCA', 'Porta', '');
    frmmodulo.balanca.Device.Data  :=  StrToInt(LerIni(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'BALANCA', 'Databits', '0'));
    frmmodulo.balanca.Device.Baud :=  StrToInt(LerIni(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'BALANCA', 'Baudrate', '0'));
    frmmodulo.balanca.Device.TimeOut :=  StrToInt(LerIni(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'BALANCA', 'Timeout', ''));
  end;

  if LerINi(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'Teclado', 'Modelo', '') <> ''  then begin
    iteclado_modelo := strtoint(LerINi(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'Teclado', 'Modelo', ''));
    steclado_porta := LerINi(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'Teclado', 'Porta', '');
  end;

  sECF_Porta := LerINi(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'ECF', 'Porta', '');

  sECF_Caixa := Zerar(LerIni(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'CAIXA', 'NUMERO', '99'),3);

   begin
      FDconn_servidor.Params.Database := lbip_servidor.Caption+':'+'C:\ACTHAUROS\Server\BD\BASE.FDB';

   end;



  Arquivo_ini := TIniFile.Create('.\cfg\Paf.ini');

  //[PAF]
  //NOME
  sPAF_Nome := Cript('D', Arquivo_ini.ReadString('D37DEB63', 'C84EC847C0', ''));
  //VERSAO
  sPAF_Versao := Cript('D', Arquivo_ini.ReadString('D37DEB63', '49C659FA0271F3', ''));
  //MD5
  sPAF_MD5 := Cript('D', Arquivo_ini.ReadString('D37DEB63', '2329383C', ''));
  //LAUDO
  sPAF_LAUDO := Cript('D', Arquivo_ini.ReadString('D37DEB63', '2329383D', ''));

  //pStatus.Panels[1].Text := sPAF_Nome + ' - ' + sPAF_Versao;
  //pStatus.Panels[2].Text := 'Laudo PAF-ECF: ' + sPAF_Laudo;

  //EXECUTAVEL
  sPaf_Executavel := Cript('D', Arquivo_ini.ReadString('D37DEB63', '75E369FF0F569991D64CD1', ''));


  //[EMPRESA DESENVOLVEDORA]
  //NOME
  sPAF_Empresa := Cript('D', Arquivo_ini.ReadString('F764E464FA72F673A2B6B253DE145AE870948F9DA2B9B1', '61F613313A', ''));
  //CNPJ
  sPAF_CNPJ := Cript('D', Arquivo_ini.ReadString('F764E464FA72F673A2B6B253DE145AE870948F9DA2B9B1', '031F38D968', ''));
  //IE
  sPAF_IE := Cript('D', Arquivo_ini.ReadString('F764E464FA72F673A2B6B253DE145AE870948F9DA2B9B1', '75E778', ''));
  //IM
  sPAF_IM := Cript('D', Arquivo_ini.ReadString('F764E464FA72F673A2B6B253DE145AE870948F9DA2B9B1', '8696B6', ''));
  //TELEFONE
  sPAF_Telefone := Cript('D', Arquivo_ini.ReadString('F764E464FA72F673A2B6B253DE145AE870948F9DA2B9B1', '8FBA55F07AF271F40B', ''));
  //ENDERECO
  SPAF_Endereco := Cript('D', Arquivo_ini.ReadString('F764E464FA72F673A2B6B253DE145AE870948F9DA2B9B1', '8FBA55F07AF271F40c', ''));
  //CONTATO
  sPAF_Contato := Cript('D', Arquivo_ini.ReadString('F764E464FA72F673A2B6B253DE145AE870948F9DA2B9B1', '8FBA55F07AF271F40D', ''));


  //[ECF]
  //MARCA
  sECF_Marca := Cript('D', Arquivo_ini.ReadString('B9A7BF57', '13392FD058AB', ''));
  // COD DO ECF
  if Arquivo_ini.ReadString('B9A7BF57', '13392FD058AC', '0') <> '0' then
    iECF_Modelo := strtoint(Cript('D', Arquivo_ini.ReadString('B9A7BF57', '13392FD058AC', '0')))
  else
    iECF_Modelo := 0;
  //MODELO
  sECF_Modelo := Cript('D', Arquivo_ini.ReadString('B9A7BF57', 'A4A8A2B7B0CE2D', ''));
  //TIPO
  sECF_Tipo := Cript('D', Arquivo_ini.ReadString('B9A7BF57', '6E9BB153EE', ''));
  //SERIAL
  sECF_Serial := Trim(TrimLeft(TrimRight(Cript('D', Arquivo_ini.ReadString('B9A7BF57', 'D875EF1310639C', '')))));
  //NUMERO
//  sECF_Caixa := Cript('D', Arquivo_ini.ReadString('B9A7BF57', '7299BB58D11656', ''));
  //CNIF
  sECF_Codigo_Sefa := Cript('D', Arquivo_ini.ReadString('B9A7BF57', '5CC640D853', ''));
  //USUARIO
  sECF_Usuario := Cript('D', Arquivo_ini.ReadString('B9A7BF57', 'B655FD020F53AFB5', ''));
  //PERMITE_ISSQN
  sECF_Desconto_Iss := Cript('D', Arquivo_ini.ReadString('B9A7BF57', 'B058C84ADB1758D607001A38CF27', ''));
  //DIRETORIO_:= Cript('D',Arquivo_FISCAL
  sECF_Diretorio_MFD := Cript('D', Arquivo_ini.ReadString('B9A7BF57', 'BC58F41617599BA6DE7E948094DC020A2526D354D36AE6609C', ''));


  //[USUARIO]

  //NOME
  sEmpresa_Nome := Cript('D', Arquivo_ini.ReadString('4CF8193FCC2D45DF', '5EF5100C1D', ''));
  //CNPJ
  sEmpresa_CNPJ := Cript('D', Arquivo_ini.ReadString('4CF8193FCC2D45DF', 'C855F6162C', ''));
  //IE
  sEmpresa_IE := Cript('D', Arquivo_ini.ReadString('4CF8193FCC2D45DF', '292B25', ''));
  //IM
  sEmpresa_IM := Cript('D', Arquivo_ini.ReadString('4CF8193FCC2D45DF', '3ADA7D', ''));
  //ENDERECO
  sEmpresa_Endereco := Cript('D', Arquivo_ini.ReadString('4CF8193FCC2D45DF', '3ADA7E', '')) + ' ' +
  {BAIRRO}Cript('D', Arquivo_ini.ReadString('4CF8193FCC2D45DF', '3ADA7F', '')) + ' ' +
  {CIDADE}Cript('D', Arquivo_ini.ReadString('4CF8193FCC2D45DF', '3ADA7G', '')) + ' ' +
  {UF}Cript('D', Arquivo_ini.ReadString('4CF8193FCC2D45DF', '3ADA7H', '')) + ' ' +
  {CEP}Cript('D', Arquivo_ini.ReadString('4CF8193FCC2D45DF', '3ADA7I', ''));
  // UF
  sEmpresa_UF := Cript('D', Arquivo_ini.ReadString('4CF8193FCC2D45DF', '3ADA7H', ''));

  // TIPO DE ATIVIDADE
  // 1 NORMAL, 2 AUTOPECAS , 3 POSTO , 4 RESTAURANTE
  sRamo_Tipo := Cript('D', Arquivo_ini.ReadString('4CF8193FCC2D45DF', '3ADA80', ''));

  //[OUTRAS OPCOES]
  //PRE-VENDA
  if Cript('D', Arquivo_ini.ReadString('43CB7499A7DA1D76F41511353CB6', 'D67E859B84E81D2055C6', '')) = 'ATIVADO' then
    bPermite_Prevenda := true
  else
    bPermite_Prevenda := false;

  //DAV_ECF
  if Cript('D', Arquivo_ini.ReadString('43CB7499A7DA1D76F41511353CB6', '78E57299B4CB3CC9', '')) = 'ATIVADO' then
    bPermite_DAV_ECF := true
  else
    bPermite_DAV_ECF := false;

  //DAV_NF
  if Cript('D', Arquivo_ini.ReadString('43CB7499A7DA1D76F41511353CB6', '6AF76C93BE3FB6', '')) = 'ATIVADO' then
    bPermite_DAV_NF := true
  else
    bPermite_DAV_NF := false;

  //OS
  if Cript('D', Arquivo_ini.ReadString('43CB7499A7DA1D76F41511353CB6', '6AF76C93BE3FB7', '')) = 'ATIVADO' then
    bPermite_OS := true
  else
    bPermite_OS := false;

  //OS  - tipo de dav
  if Cript('D', Arquivo_ini.ReadString('43CB7499A7DA1D76F41511353CB6', '6AF76C93BE3FC8', '')) = 'ATIVADO' then
    iDav_Os_tipo := 1
  else
    iDav_Os_tipo := 0;

  // liberar arquivo ini da memoria
  Arquivo_ini.Free;

  // codigo da empresa
  if bServidor_Conexao then
  begin
    frmmodulo.qrfilial.open;
    sempresa_Codigo := frmModulo.qrfilial.fieldbyname('codigo').asstring;
    sempresa_ibge := frmModulo.qrfilial.fieldbyname('COD_MUNICIPIO_IBGE').asstring;
    sempresa_Rua := frmModulo.qrfilial.fieldbyname('endereco').asstring;
    sempresa_Numero := frmModulo.qrfilial.fieldbyname('numero').asstring;
    sempresa_Bairro := frmModulo.qrfilial.fieldbyname('bairro').asstring;
    sEmpresa_Cidade := frmModulo.qrfilial.fieldbyname('cidade').asstring;
    sempresa_complemento := frmModulo.qrfilial.fieldbyname('complemento').asstring;
    sempresa_CEP := frmModulo.qrfilial.fieldbyname('Cep').asstring;
    sempresa_telefone := frmModulo.qrfilial.fieldbyname('telefone').asstring;
    sempresa_fax := frmModulo.qrfilial.fieldbyname('fax').asstring;
    sempresa_email := frmModulo.qrfilial.fieldbyname('email').asstring;
  end
  else
  begin
    sempresa_Codigo := '';
    sempresa_ibge := '';
    sempresa_Rua := '';
    sempresa_Numero := '';
    sempresa_Bairro := '';
    sEmpresa_Cidade := '';
    sempresa_complemento := '';
    sempresa_CEP := '';
    sempresa_telefone := '';
    sempresa_fax := '';
    sempresa_email := '';
  end;

  // abrir banco de dados de configuracoes local
  frmmodulo.query.close;
  frmmodulo.query.sql.clear;
  frmmodulo.query.sql.add('select * from config');
  frmmodulo.query.open;

  isenha_desconto := frmModulo.query.fieldbyname('senha_desconto').AsInteger;


  iComprovente_Crediario := frmModulo.query.fieldbyname('COMPROVANTE_CREDIARIO').asinteger;
  iComprovante_Crediario_produto := frmmodulo.query.fieldbyname('COMPROVANTE_CREDIARIO_PRODUTO').asinteger;


  sTotalizador_Crediario := frmmodulo.query.fieldbyname('TOTALIZADOR_NF_CREDIARIO').asstring;
  sNome_Totalizador_Crediario :=
    frmmodulo.query.fieldbyname('Nome_TOTALIZADOR_NF_CREDIARIO').asstring;

  sTotalizador_Recebimento := frmmodulo.query.fieldbyname('TOTALIZADOR_NF_RECEBIMENTO').asstring;
  sNome_Totalizador_Recebimento :=
    frmmodulo.query.fieldbyname('Nome_TOTALIZADOR_NF_RECEBIMENTO').asstring;


  sIndice_Sangria := frmModulo.query.fieldbyname('totalizador_sangria').asstring;
  sIndice_Suprimento := frmModulo.query.fieldbyname('totalizador_suprimento').asstring;


  // alimentar as variaveis com as formas de pagamentos pre-definidas que exigem tratamentos
  // especiais no fechamento da venda
  if frmmodulo.query.RecordCount > 0 then
  begin
    lForma_pgto_Cheque_Avista := frmmodulo.query.fieldbyname('forma_cheque').asstring;
    lForma_pgto_Cheque_Aprazo := frmmodulo.query.fieldbyname('forma_cheque_aprazo').asstring;
    lForma_pgto_Cartao_Debito := frmmodulo.query.fieldbyname('forma_cartao').asstring;
    lForma_pgto_Cartao_Credito := frmmodulo.query.fieldbyname('forma_cartao_credito').asstring;
    lForma_pgto_Crediario := frmmodulo.query.fieldbyname('forma_crediario').asstring;
    lForma_pgto_Convenio := frmmodulo.query.fieldbyname('forma_convenio').asstring;
    lForma_pgto_Dinheiro := frmmodulo.query.fieldbyname('forma_dinheiro').asstring;
  end;

  LerFormasPagto;

  // alimentando as variaveis globais do sistema


  bTruncar_valor := True;

  if frmmodulo.query.fieldbyname('muda_qtde').asinteger = 1 then
    bMuda_qtde := true else bMuda_qtde := false;

  if frmmodulo.query.fieldbyname('muda_unitario').asinteger = 1 then
    bMuda_unitario := true else bMuda_unitario := false;
  bMensagem_Cupom := frmModulo.query.fieldbyname('imprime_mensagem_cupom').AsString = 'S';
  bSenha_Cancel_Item := true;
  bSenha_Cancel_Cupom := true;

  bCadastra_cheque := true;

  bCadastra_Crediario := true;

  sPasta_config := ExtractFilePath(Application.ExeName) + '\cfg';
  sArquivo_config := 'cfg.ini';
  sConfiguracoes := sPasta_config + '\' + sArquivo_config;


  iTamanho_codigo_balanca := StrToInt(LerIni(sConfiguracoes, 'BALANCA', 'NDIGITOS', '5'));


  bBusca_foto_produto := StrToBool(LerINI(sConfiguracoes, 'PDV', 'HAB_IMG', BoolToStr(false)));
  sPasta_foto_produto := LerINI(sConfiguracoes, 'PDV', 'CAMINHO_IMG', ExtractFilePath(Application.ExeName) + '\img\produtos\');

  bHabLogoMarca := StrToBool(LerINI(sConfiguracoes, 'PDV', 'HAB_LOGO', BoolToStr(false)));
  EditLogoMarca := LerINI(sConfiguracoes, 'PDV', 'CAMINHO_LOGO', '');

  sPasta_sistema := ExtractFilePath(Application.ExeName);

  if frmmodulo.query.FieldByName('usa_tef').asinteger = 1 then
  begin
    bTEF := true;
    if frmModulo.query.fieldbyname('usa_tef_tecban').asinteger = 1 then
      bTEF_TecBan := true else
      bTEF_TecBan := false;
  end
  else
  begin
    bTEF := false;
    bTEF_TecBan := false;
  end;



end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.FormShow(Sender: TObject);
VAR
ArquivoINI: TIniFile;
vdata     : TDate;
begin
 Begin
   imgFundo.Picture.LoadFromFile('C:\ACTHAUROS\Server\IMG\imagem_fundo.jpeg');
   End;


   dataini.Text := FormatDateTime('dd/mm/yyyy',Now);

    begin
      

         if '11/' + FormatDateTime('mm/yyyy',Now) = dataini.Text then
         Begin
          ShowMessage('Faltam 4 dias para vencimento de sua fatura,'
                       +#13+ 'referente a libera��o da licen�a do sistema!');
         End;

         if '12/' + FormatDateTime('mm/yyyy',Now) = dataini.Text then
         Begin
          ShowMessage('Faltam 3 dias para vencimento de sua fatura,'
                       +#13+ 'referente a libera��o da licen�a do sistema!');
         End;

         if '13/' + FormatDateTime('mm/yyyy',Now) = dataini.Text then
         Begin
          ShowMessage('Faltam 2 dias para vencimento de sua fatura,'
                       +#13+ 'referente a libera��o da licen�a do sistema!');
         End;

         if '14/' + FormatDateTime('mm/yyyy',Now) = dataini.Text then
         Begin
          ShowMessage('Faltam 1 dias para vencimento de sua fatura,'
                       +#13+ 'referente a libera��o da licen�a do sistema!');
         End;

         qrfilial.close;
         qrfilial.SQL.clear;
         qrfilial.SQL.add('select DATA_VENCIMENTO from c999999');
         qrfilial.open;

         if qrFilialDATA_VENCIMENTO.AsDateTime < Date then
         Begin
          Form_ativar := tForm_ativar.create(self);
          Form_ativar.showmodal;
          Close;
         End;

   end;

   Begin
     imgFundo.Picture.LoadFromFile('C:\ACTHAUROS\Server\IMG\imagem_fundo.jpeg');
     WinExec('C:\ACTHAUROS\PDV\GCS_ServidorNFCe.exe', SW_SHOW);

   End;

   Begin
   CarregaSistemaVenda;
   End;

end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.ECF1Click(Sender: TObject);
begin
  frmConfig_ecf := tfrmConfig_ECF.create(self);
  frmconfig_ecf.showmodal;
end;

procedure TfrmPrincipal.ecfExecute(Sender: TObject);
begin
  frmConfig_ecf := tfrmConfig_ECF.create(self);
  frmconfig_ecf.showmodal;
end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  // encerrrar comunicacao com o ecf
  cECF_Fecha(iECF_Modelo);
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPrincipal.sairExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmPrincipal.sobreExecute(Sender: TObject);
begin

end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.NotaFiscalMod2SerieD1Click(Sender: TObject);
begin
  frmNotafiscal_menu := tfrmNotaFiscal_menu.create(self);
  frmNotafiscal_menu.showmodal;
end;

procedure TfrmPrincipal.pstatusClick(Sender: TObject);
begin

end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.MenuFiscal1Click(Sender: TObject);
begin
  frmMenu_fiscal := tfrmMenu_fiscal.create(self);
  frmMenu_fiscal.showmodal;
end;

procedure TfrmPrincipal.menu_fiscalExecute(Sender: TObject);
begin
  frmMenu_fiscal := tfrmMenu_fiscal.create(self);
  frmMenu_fiscal.showmodal;
end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.Balana1Click(Sender: TObject);
begin
  frmconfig_balanca := tfrmconfig_balanca.create(self);
  frmconfig_balanca.showmodal;
end;

procedure TfrmPrincipal.balancaExecute(Sender: TObject);
begin
  frmsenha_supervisor := tfrmsenha_supervisor.create(self);
  frmsenha_supervisor.showmodal;

  if not bSupervisor_autenticado then
    Exit;
  Form1 := TForm1.create(self);
  Form1.showmodal;
end;

procedure TfrmPrincipal.bt_menu02Click(Sender: TObject);
begin

end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.Geral1Click(Sender: TObject);
begin
  frmconfig := tfrmconfig.create(self);
  frmconfig.showmodal;
  frmconfig.free;
end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.AdvGlowButton3Click(Sender: TObject);
begin
  frmConfig_ecf := tfrmConfig_ECF.create(self);
  frmconfig_ecf.showmodal;
end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.venderExecute(Sender: TObject);
begin
  CarregaSistemaVenda;
end;

procedure TfrmPrincipal.GerenciarNFCeExecute(Sender: TObject);
begin
  //frmsenha_supervisor := tfrmsenha_supervisor.create(self);
  //frmsenha_supervisor.showmodal;

  //if not bSupervisor_autenticado then
    //Exit;

  frmNotasconsumidor := tfrmNotasconsumidor.create(self);
  frmNotasconsumidor.showmodal;
  FreeAndNil(frmNotasconsumidor);
end;

procedure TfrmPrincipal.AdvGlowButton175Click(Sender: TObject);
begin
  frmconfig := tfrmconfig.create(self);
  frmconfig.showmodal;
end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.AdvGlowButton1Click(Sender: TObject);
begin
  frmNotafiscal_menu := tfrmNotaFiscal_menu.create(self);
  frmNotafiscal_menu.showmodal;
end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.AdvGlowButton2Click(Sender: TObject);
begin
  frmMenu_fiscal := tfrmMenu_fiscal.create(self);
  frmMenu_fiscal.showmodal;
end;

// -------------------------------------------------------------------------- //

procedure TfrmPrincipal.AdvGlowButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.AdvMetroButton1Click(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TfrmPrincipal.AdvMetroButton2Click(Sender: TObject);

begin
close;
end;

procedure TfrmPrincipal.CarregaSistemaVenda;
var
  sForma: string;
  i, x: integer;
// variaveis para acertar a data e hora
  dDataHora: TSystemTime;
  Ano, Mes, Dia,
    H, M, S, Mil: word;
  sLinha: string;
  txt: textFile;

begin
  bAtiva_Venda    := true;
  sPortaNaoFiscal := LerIni(sConfiguracoes, 'IMPRESSORA', 'impnaof', 'LPT1');
  sPortaGaveta    := LerIni(sConfiguracoes, 'GAVETA', 'gavnaof', 'LPT1');
  iQtdLinhasFinal := IsInteger(LerIni(sConfiguracoes, 'IMPRESSORA', 'qtdlfin', '8'));

  sFuncao_Senha := '001';
  frmSenha := tfrmSenha.create(self);

  if Length(LerIni(sConfiguracoes, 'LOGIN', 'USUARIO', '')) = 0 then
    frmSenha.showmodal
  else
    frmSenha.LogarAutomaticamente;


  if busuario_Autenticado then
    frmSenha.Free
  else
    Exit;

  iNumCaixa := IsInteger(LerIni(sConfiguracoes, 'CAIXA', 'NUMERO', '99'));
  iCFOP := (LerIni(sConfiguracoes, 'Emitente', 'CFOP', ''));
  if iNumCaixa = 0 then
  begin
    Application.MessageBox('N�mero do caixa nao definido, favor verificar', 'Mensagem');
    exit;
  end;

  try
    //Application.CreateForm(TFrmUtiSplash, frmUtiSplash);
   // frmUtiSplash.Show;


    if busuario_Autenticado then
       begin
       // antes de iniciar a tela venda, verificar as configuracoes necessarias
       if TipoImpressora = Fiscal then
          begin

          end
       else
          begin // � nao fiscal ou sem impressora impressora
           dData_Sistema := Date;
           dData_Movimento := Date;//dData_Sistema;
           frmmodulo.query.close;


           frmmodulo.query.sql.clear;
           frmmodulo.query.sql.add('select * from config');
           frmmodulo.query.open;
           bcaixa_aberto := True;
            try
            if frmmodulo.query.fieldbyname('caixa_situacao').asstring = 'FECHADO' then
               begin
               if Application.MessageBox
                (pwidechar('C A I X A   F E C H A D O!' + #13 +
                'Deseja realizar a sua abertura?'), 'Aviso',
                mb_yesno + MB_ICONQUESTION) = idYes then
                  begin
                  bcaixa_aberto := false;
                  bAtiva_Venda := true;
                  end
                 else
                  begin
                   Application.MessageBox
                  (pwidechar('As fun��es de venda ser�o bloqueadas!'),
                  'Aten��o', mb_ok + MB_ICONWARNING);
                   bAtiva_Venda := false;
                  end;

               end;
           finally
            //frmUtiSplash.Show;
           // frmUtiSplash.Refresh;
           end;


            if bAtiva_Venda then
            begin
              frmvenda := Tfrmvenda.CREATE(SELF);
              frmvenda.cpBarra.Panels.Items[3].Text := sECF_Caixa;
              frmvenda.cpBarra.Panels.Items[1].Text := copy(sNome_Operador, 1, 10);
              frmvenda.SHOWMODAL;
            end;
          end;

      end
    else
    begin
      Application.Terminate;
    end;
  finally
//    if frmUtiSplash <> nil then begin
//      FreeAndNil(frmUtiSplash);
//    end;
  end;

end;

procedure TfrmPrincipal.VendasPDV1Click(Sender: TObject);
begin
  CarregaSistemaVenda;
end;

procedure TfrmPrincipal.GravaIni(sArquivo, Secao, Linha, Valor: string);
var
  Ini: TIniFile;
  Arquivo: string;
begin

  Arquivo := sArquivo;
  Ini := TIniFile.Create(Arquivo);
  Ini.WriteString(Secao, Linha, Valor);
  Ini.Free;

end;

function TfrmPrincipal.LerIni(sArquivo, Secao, Linha, Def: string): string;
var
  Ini: TIniFile;
begin

  Ini := TIniFile.Create(sArquivo);
  Result := Ini.ReadString(Secao, Linha, Def);
  Ini.Free;

end;



function TfrmPrincipal.LerFormasPagto: Boolean;
var
  formas: string;
  c:integer;
begin
  try
    Result := False;
    frmModulo.tbForma_pgto.Close;
    frmModulo.tbForma_pgto.Open;

    if frmModulo.tbForma_pgto.RecordCount > 0 then
      frmModulo.tbForma_pgto.Delete;

    c:=0;
     //Dinheiro
    Inc(c);
    frmModulo.tbForma_pgto.Insert;
    frmModulo.tbForma_Pgtoid.Value := c;
    frmModulo.tbForma_PgtoNome.Value := lForma_pgto_dinheiro;
    frmModulo.tbForma_pgto.Post;

     //Cheque
    Inc(c);
    frmModulo.tbForma_pgto.Insert;
    frmModulo.tbForma_Pgtoid.Value := c;
    frmModulo.tbForma_PgtoNome.Value := lForma_pgto_Cheque_Avista;
    frmModulo.tbForma_pgto.Post;

    Inc(c);
    frmModulo.tbForma_pgto.Insert;
    frmModulo.tbForma_Pgtoid.Value := c;
    frmModulo.tbForma_PgtoNome.Value := lForma_pgto_Cheque_Aprazo;
    frmModulo.tbForma_pgto.Post;

    //Cartao
    Inc(c);
    frmModulo.tbForma_pgto.Insert;
    frmModulo.tbForma_Pgtoid.Value := c;
    frmModulo.tbForma_PgtoNome.Value := lForma_pgto_Cartao_Debito;
    frmModulo.tbForma_pgto.Post;

    Inc(c);
    frmModulo.tbForma_pgto.Insert;
    frmModulo.tbForma_Pgtoid.Value := c;
    frmModulo.tbForma_PgtoNome.Value := lForma_pgto_Cartao_Credito;
    frmModulo.tbForma_pgto.Post;

    Inc(c);
    frmModulo.tbForma_pgto.Insert;
    frmModulo.tbForma_Pgtoid.Value := c;
    frmModulo.tbForma_PgtoNome.Value := lForma_pgto_Crediario;
    frmModulo.tbForma_pgto.Post;

    //Convenio
    Inc(c);
    frmModulo.tbForma_pgto.Insert;
    frmModulo.tbForma_Pgtoid.Value := c;
    frmModulo.tbForma_PgtoNome.Value := lForma_pgto_Convenio;
    frmModulo.tbForma_pgto.Post;
    Result := True;
  except
    Result := False;
    ShowMessage('Erro ao carregar formas de pagamento');

  end;
end;

function TfrmPrincipal.ApenasNumerosStr(pStr: string): string;
var
  I: Integer;
begin

  Result := '';

  for I := 1 to Length(pStr) do
    if pStr[I] in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'] then
      Result := Result + pStr[I];

end;


function TfrmPrincipal.IsInteger(s: string): integer;
begin
  try
    Result := strtoint(s);

  except
    Result := 0;
  end;
end;

procedure TfrmPrincipal.tlResearchClick(Sender: TdxTileControlItem);
begin
  frmConfig_ecf := tfrmConfig_ECF.create(self);
  frmconfig_ecf.showmodal;
end;

procedure TfrmPrincipal.tlPhotosClick(Sender: TdxTileControlItem);
begin
  CarregaSistemaVenda;
end;

procedure TfrmPrincipal.tlAgentsClick(Sender: TdxTileControlItem);
begin
  Close;
end;

procedure TfrmPrincipal.dxtlcntrltmTileItem1Click(
  Sender: TdxTileControlItem);
begin
  frmconfig := tfrmconfig.create(self);
  frmconfig.showmodal;

end;

procedure TfrmPrincipal.tlUserManagementClick(Sender: TdxTileControlItem);
begin
  frmMenu_fiscal := tfrmMenu_fiscal.create(self);
  frmMenu_fiscal.showmodal;
end;

procedure TfrmPrincipal.tlSystemInformationClick(
  Sender: TdxTileControlItem);
begin
  frmconfig := tfrmconfig.create(self);
  frmconfig.showmodal;
end;

procedure TfrmPrincipal.dxTileItem1Click(Sender: TdxTileControlItem);
begin
  frmconfig_balanca := tfrmconfig_balanca.create(self);
  frmconfig_balanca.showmodal;
end;

procedure TfrmPrincipal.V1Click(Sender: TObject);
begin
  CarregaSistemaVenda
end;

procedure TfrmPrincipal.S1Click(Sender: TObject);
begin
  Close
end;

procedure TfrmPrincipal.M1Click(Sender: TObject);
begin
  frmMenu_fiscal := tfrmMenu_fiscal.create(self);
  frmMenu_fiscal.showmodal;
end;

procedure TfrmPrincipal.C1Click(Sender: TObject);
begin
  frmconfig := tfrmconfig.create(self);
  frmconfig.showmodal;
end;

procedure TfrmPrincipal.E1Click(Sender: TObject);
begin
  frmConfig_ecf := tfrmConfig_ECF.create(self);
  frmconfig_ecf.showmodal;
end;

procedure TfrmPrincipal.B1Click(Sender: TObject);
begin
  frmconfig_balanca := tfrmconfig_balanca.create(self);
  frmconfig_balanca.showmodal;
end;

procedure TfrmPrincipal.AdicionarClientes;
begin

end;

procedure TfrmPrincipal.AdicionarVendedores;
begin
  // CGT: Nome dos Vendedores/Caixas cadastrados no retaguarda
  qrservidor.close;
  qrservidor.sql.clear;
  qrservidor.sql.add('select c000008.CODIGO, c000008.NOME from c000008 '
    + ' where (c000008.F_VENDEDOR = 1) order by c000008.codigo');
  qrservidor.open;
  qrservidor.first;

  qrpdv.close;
  qrpdv.sql.clear;
  qrpdv.SQL.add('delete from VENDEDORES');
  qrpdv.ExecSQL;

  while not qrservidor.eof do
  begin
    Application.ProcessMessages;

    qrpdv.close;
    qrpdv.sql.clear;
    qrpdv.sql.add('insert into VENDEDORES (');
    qrpdv.sql.add('CODIGO, NOME) values (');
    qrpdv.sql.add(':CODIGO, :NOME)');
    qrpdv.ParamByName('CODIGO').AsString
      := qrservidor.fieldbyname('CODIGO').AsString;
    qrpdv.parambyname('NOME').AsString
      := qrservidor.fieldbyname('nome').AsString;

    qrpdv.ExecSQL;

    qrservidor.next;
  end;
end;

procedure TfrmPrincipal.AdicionarUsuarios;
var
  Y: Integer;

begin
  qrservidor.close;
  qrservidor.sql.clear;
  qrservidor.sql.add('select * from c000003 where nivel = 4');
  qrservidor.open;
  qrservidor.first;

  y := 1;

  while not qrservidor.eof do
  begin
    qrpdv.close;
    qrpdv.sql.clear;
    qrpdv.sql.add('insert into adm (');
    qrpdv.sql.add('codigo, info1, info2, info3) values (');
    qrpdv.sql.add(':codigo, :info1, :info2, :info3)');
    qrpdv.ParamByName('codigo').asinteger := strtoint('991' + zerar(inttostr(y), 3));
    qrpdv.parambyname('info1').asstring := 'DELPHOS_' + inttostr(y);
    qrpdv.parambyname('info2').asstring := cript('D', qrservidor.fieldbyname('senha').asstring);
    qrpdv.parambyname('info3').asstring := '4';
    qrpdv.ExecSQL;
    inc(y);
    qrservidor.next;
  end;

  qrservidor.close;
  qrservidor.sql.clear;
  qrservidor.sql.add('select nome, senha from c000008 where situacao = 1 and funcao = ' + QuotedStr('SUPERVISOR'));
  qrservidor.open;
  qrservidor.first;
  qrpdv2.close;
  qrpdv2.sql.clear;
  qrpdv2.sql.add('delete from supervisor');
  qrpdv2.ExecSQL;

  while not qrservidor.eof do begin
    qrpdv.close;
    qrpdv.sql.clear;
    qrpdv.sql.add('insert into supervisor (');
    qrpdv.sql.add('nome, senha) values (');
    qrpdv.sql.add(':nome, :senha)');
    qrpdv.ParamByName('nome').AsString := qrServidor.FieldByName('nome').AsString;
    qrpdv.parambyname('senha').asstring := qrServidor.FieldByName('senha').AsString;
    qrpdv.ExecSQL;
    qrservidor.next;
  end;
end;

procedure TfrmPrincipal.AdicionarCaixas;
begin
  qrservidor.close;
  qrservidor.sql.clear;
  qrservidor.sql.add('select c000045.*, c000008.nome from c000045, c000008 where c000045.codfuncionario = c000008.codigo order by c000045.codigo');
  qrservidor.open;
  qrservidor.first;

  qrpdv.close;
  qrpdv.sql.clear;
  qrpdv.SQL.add('delete from adm');
  qrpdv.ExecSQL;

  while not qrservidor.eof do
  begin
    Application.ProcessMessages;

    qrpdv.close;
    qrpdv.sql.clear;
    qrpdv.sql.add('insert into adm (');
    qrpdv.sql.add('codigo, info1, info2, info3) values (');
    qrpdv.sql.add(':codigo, :info1, :info2, :info3)');
    qrpdv.ParamByName('codigo').asinteger := qrservidor.fieldbyname('codigo').asinteger;
    qrpdv.parambyname('info1').asstring := qrservidor.fieldbyname('nome').asstring;
    qrpdv.parambyname('info2').asstring := cript('D', qrservidor.fieldbyname('senha').asstring);
    qrpdv.parambyname('info3').asstring := '3';

    qrpdv.ExecSQL;

    qrservidor.next;
  end;

  qrservidor.close;
  qrservidor.sql.clear;
  qrservidor.sql.add('select c000008.nome, c000008.senha, c000008.funcao from c000008 where c000008.funcao = ''SUPERVISOR'' order by c000008.codigo');
  qrservidor.open;
  qrservidor.first;

  qrpdv.close;
  qrpdv.sql.clear;
  qrpdv.SQL.add('delete from supervisor');
  qrpdv.ExecSQL;

  while not qrservidor.eof do
  begin
    Application.ProcessMessages;

    qrpdv.close;
    qrpdv.sql.clear;
    qrpdv.sql.add('insert into supervisor (');
    qrpdv.sql.add('nome, senha) values (');
    qrpdv.sql.add(':nome, :senha)');
    qrpdv.parambyname('nome').asstring := qrservidor.fieldbyname('nome').asstring;
    qrpdv.parambyname('senha').asstring := qrservidor.fieldbyname('senha').asstring;

    qrpdv.ExecSQL;

    qrservidor.next;
  end;
end;

function TfrmPrincipal.adic_codifica(TABELA: string): string;
var
  terminal: Integer;
  xcod: string;
begin
  FDQrmestre.close;
  FDQrmestre.sql.Clear;
  FDQrmestre.sql.add('select * from c000000 where codigo = ''' + tabela + '''');
  FDQrmestre.Open;
  if FDQrmestre.RecNo = 1 then
  begin
    if FDQrmestre.FieldByName('sequencia').asinteger < 1 then
    begin
      result := '0000000001';
      FDQrmestre.Edit;
      FDQrmestre.fieldbyname('sequencia').asinteger := 2;
      FDQrmestre.Post;

    end         //frmPrincipal.adic_codifica('000034');
    else
    begin
      xcod:= FDQrmestre.fieldbyname('codigo').asstring;
      FBquery.Close;
      FBquery.SQL.clear;
      FBquery.SQL.add
      ('select GEN_ID("'+xcod+'",1)as sequencia from RDB$DATABASE');
      FBquery.Open;
      result := IntToStr(FBquery.fieldbyname('sequencia').asinteger);
      FBquery.close;
    end;
  end
  else
  begin
    Showmessage('N�o foi poss�vel concluir com a opera��o!' + #13 + 'Erro: C�digo de sequ�ncia n�o encontrado na tabela de c�digos.');
  end;

end;

end.
