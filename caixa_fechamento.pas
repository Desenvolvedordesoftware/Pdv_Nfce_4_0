unit caixa_fechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, RzEdit, NxColumnClasses, NxColumns,
  NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid, ComCtrls, DB,
  DBAccess, Menus, AdvMenus, pngimage, AdvGlowButton, AdvMetroButton, AdvSmoothPanel, AdvSmoothExpanderPanel, Uni,
  MemDS, JvExMask, JvToolEdit, principal, frxClass, frxExportPDF, frxDBSet,
  frxDesgn, Datasnap.DBClient, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, NxEdit, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit,
  dxSkinTheBezier;

type
  TfrmCaixa_Fechamento = class(TForm)
    Panel1: TPanel;
    bt_ok: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ed_data1: TJvDateEdit;
    Label3: TLabel;
    ed_ecf: TRzEdit;
    pop_fechamento: TAdvPopupMenu;
    Cancelar1: TMenuItem;
    TabSheet5: TTabSheet;
   // qrArquivo: TIBCQuery;
  //  qrDAV: TIBCQuery;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
  //  qrAbastecimento: TIBCQuery;
    TabSheet8: TTabSheet;
   // qrEncerrante: TIBCQuery;
    Panel3: TPanel;
    Button1: TButton;
    bt_cupom_encerrante: TButton;
    TabFechamento: TTabSheet;
    AdvSmoothExpanderPanel1: TAdvSmoothExpanderPanel;
    Label53: TLabel;
    AdvMetroButton1: TAdvMetroButton;
    Panel4: TPanel;
    bt_fechamento01: TAdvGlowButton;
    bt_fechamento02: TAdvGlowButton;
    bt_fechamento03: TAdvGlowButton;
    bt_fechamento04: TAdvGlowButton;
    bt_fechamento05: TAdvGlowButton;
    bt_fechamento06: TAdvGlowButton;
    bt_fechamento07: TAdvGlowButton;
    bt_fechamento08: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    Panel5: TPanel;
    qrAbastecimento: TUniQuery;
    qrMesa: TUniQuery;
    qrEncerrante: TUniQuery;
    qrDAV: TUniQuery;
    query: TUniQuery;
    qrPre_Venda: TUniQuery;
    qrArquivo: TUniQuery;
    qrFechamento: TUniQuery;
    frxDesigner1: TfrxDesigner;
    fxFechamento: TfrxReport;
    frxEmitente: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    cdsDados: TClientDataSet;
    frxDados: TfrxDBDataset;
    cdsDadosDescricao: TStringField;
    cdsDadosValor: TStringField;
    cdsDadosnegrito: TStringField;
    AdvGlowButton2: TAdvGlowButton;
    cdsDadoslinha: TIntegerField;
    lbEdicao: TLabel;
    ActionManager1: TActionManager;
    Action1: TAction;
    frxdbdtst1: TfrxDBDataset;
    frxDBDFechamento: TfrxDBDataset;
    frxDBDsuprimento: TfrxDBDataset;
    qrsuprimento: TUniQuery;
    qrsangria: TUniQuery;
    frxDBDsangria: TfrxDBDataset;
    frxDBdinheiro: TfrxDBDataset;
    frxDBaprazo: TfrxDBDataset;
    qrdinheiro: TUniQuery;
    qraprazo: TUniQuery;
    frxDBcartaoc: TfrxDBDataset;
    frxDBcartaod: TfrxDBDataset;
    qrcartaoc: TUniQuery;
    qrcartaod: TUniQuery;
    ed_data: TJvDateEdit;
    Label4: TLabel;
    frxrelatorio: TfrxReport;
    frxRelatorioDetalhado: TfrxReport;
    AdvGlowButton3: TAdvGlowButton;
    frxdad: TfrxDBDataset;
    qrdados: TUniQuery;
    frxRel_Ven_Canceladas: TfrxReport;
    qrconfig: TUniQuery;
    frxrelatorio4: TfrxReport;
    AdvGlowButton4: TAdvGlowButton;
    Label6: TLabel;
    Label7: TLabel;
    TimeEdit_IN: TcxTimeEdit;
    TimeEdit_FI: TcxTimeEdit;
    Combo_Usuario: TComboBox;
    ed_operador: TRzEdit;
    frxDBpix: TfrxDBDataset;
    frxDBdep_transf: TfrxDBDataset;
    qrpix: TUniQuery;
    qrdep_transf: TUniQuery;
    frxRelSimples: TfrxReport;
    AdvSmoothExpanderPanel2: TAdvSmoothExpanderPanel;
    AdvSmoothExpanderPanel3: TAdvSmoothExpanderPanel;
    AdvSmoothExpanderPanel4: TAdvSmoothExpanderPanel;
    qrcodcx: TUniQuery;
    frxcodcx: TfrxDBDataset;
    frxDBDsuprimento1: TfrxDBDataset;
    qrsuprimento1: TUniQuery;
    qrsangria1: TUniQuery;
    frxDBDsangria1: TfrxDBDataset;
    frxDBdinheiro1: TfrxDBDataset;
    frxDBaprazo1: TfrxDBDataset;
    qrdinheiro1: TUniQuery;
    qraprazo1: TUniQuery;
    frxDBcartaoc1: TfrxDBDataset;
    frxDBcartaod1: TfrxDBDataset;
    qrcartaoc1: TUniQuery;
    qrcartaod1: TUniQuery;
    frxDBpix1: TfrxDBDataset;
    frxDBdep_transf1: TfrxDBDataset;
    qrpix1: TUniQuery;
    qrdep_transf1: TUniQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_cancelarClick(Sender: TObject);
    procedure grid_resumoCellFormating(Sender: TObject; ACol,
      ARow: Integer; var TextColor: TColor; var FontStyle: TFontStyles;
      CellState: TCellState);
    procedure FormShow(Sender: TObject);
    procedure bt_okClick(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure bt_cupom_encerranteClick(Sender: TObject);
    procedure VendaBruta1Click(Sender: TObject);
    procedure AdvMetroButton1Click(Sender: TObject);
    procedure bt_fechamento01Click(Sender: TObject);
    procedure bt_fechamento02Click(Sender: TObject);
    procedure bt_fechamento03Click(Sender: TObject);
    procedure bt_fechamento04Click(Sender: TObject);
    procedure bt_fechamento05Click(Sender: TObject);
    procedure bt_fechamento06Click(Sender: TObject);
    procedure bt_fechamento07Click(Sender: TObject);
    procedure bt_fechamento08Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ed_dataChange(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure frxDesigner1GetTemplateList(List: TStrings);
    procedure AdvGlowButton4Click(Sender: TObject);
  private
    { Private declarations }
    TipoImp: TImpressora;
    Editar:Boolean;
    function relatorio_posto():boolean;
    function relatorio_dav():boolean;
    function relatorio_mesa():boolean;

    procedure Z_Resumo();
    procedure z_Forma();
    procedure z_aliquota();
    procedure z_outros();
    procedure z_fechamento();
    function arquivo_fiscal(data:tdatetime):string;
    function Zerar(texto: string; qtde: integer): string; // Acrescentar Zeros a esquerda em uma String

  public
    { Public declarations }
  end;

var
  frmCaixa_Fechamento: TfrmCaixa_Fechamento;
  fechamento: string;

implementation

uses modulo, funcoes, unECF, senha_supervisor, venda,
  msg_Operador, Math, menu_fiscal, UFuncoes, Config, Senha_ADM;

{$R *.dfm}

// -------------------------------------------------------------------------- //
function tfrmcaixa_fechamento.relatorio_posto():boolean;
begin
  qrEncerrante.close;
  qrEncerrante.sql.clear;
  qrEncerrante.sql.add('select posto_bico_movimento.*, posto_bico.*');
  qrEncerrante.sql.add('from posto_bico_movimento, posto_bico');

  qrEncerrante.sql.add('where data = :data');
  qrEncerrante.SQL.ADD('and posto_bico_movimento.cod_bico = posto_bico.codigo');
  qrEncerrante.sql.add('order by posto_bico.bomba, posto_bico.bico');
  qrEncerrante.parambyname('data').asdatetime := dData_Sistema;
  qrEncerrante.open;


  if qrEncerrante.RecordCount = 0 then
  begin
    result := true;
    exit;
  end;



  repeat
     if frmPrincipal.TipoImpressora = fiscal then
     begin
      sMsg := cECF_Abre_Gerencial(iECF_Modelo,'CONTROLE DE ENCERRANTES');
      sNumero_Cupom := cECF_Numero_Cupom(iECF_Modelo);
     end
     else
     begin
      sMsg := Imp_Abre_Gerencial(sPortaNaoFiscal,'CONTROLE DE ENCERRANTES');
      sNumero_Cupom := Zerar(FloatToStr( Max('')),6);
     end;

    if sMsg <> 'OK' then
    begin
      if application.messagebox(pwidechar('Erro ao abrir relatório gerencial!'+#13+
                                          'Mensagem: '+sMsg+#13+
                                          'Deseja tentar outra vez?'),'Erro',
                                          mb_yesno+mb_iconerror ) = idno
      then
      begin
        break;
      end;
    end
    else
    begin
      // extrair do ecf o numero dos contadores

      if frmPrincipal.TipoImpressora = fiscal then
      begin
        sGNF := cECF_Numero_Contador_Operacao_NF(iECF_Modelo);
        sGRG := cECF_Numero_Contador_Relatorio_Gerencial(iECF_Modelo);
      end
      else // Nao Fiscal
      begin
        sGNF := Zerar( FloatToStr( max('')), 5);
        sGRG := Zerar( sGNF, 5);
        if Length(sGNF) = 5 then
          sGNF := '9' + sGNF;
        if Length(sGRG) = 5 then
          sGRG := '9' + sGRG;
      end;

    end;
  until sMsg = 'OK';


  if sMsg = 'OK' then
  begin

      repeat

        qrEncerrante.First;
        while not qrEncerrante.eof do
        begin
          if frmPrincipal.TipoImpressora = fiscal then
           sMSG := cECF_Usa_Gerencial(iECF_Modelo,'Tanque '+qrEncerrante.fieldbyname('Tanque').asstring+' '+
                                                  'Bomba '+qrEncerrante.fieldbyname('Bomba').asstring+' '+
                                                  'Bico '+qrEncerrante.fieldbyname('bico').asstring+', '+
                                                  'EI='+zerar(somenteNumero(formatfloat('######0.00',qrEncerrante.fieldbyname('EI').asfloat)),6)+', '+
                                                  'EF='+zerar(somenteNumero(formatfloat('######0.00',qrEncerrante.fieldbyname('EF').asfloat)),6)+', '+
                                                  'Volume='+formatfloat('#########0.000',qrEncerrante.fieldbyname('volume').asfloat))
         else
           sMSG := Imp_Usa_Gerencial(sPortaNaoFiscal,'Tanque '+qrEncerrante.fieldbyname('Tanque').asstring+' '+
                                                  'Bomba '+qrEncerrante.fieldbyname('Bomba').asstring+' '+
                                                  'Bico '+qrEncerrante.fieldbyname('bico').asstring+', '+
                                                  'EI='+zerar(somenteNumero(formatfloat('######0.00',qrEncerrante.fieldbyname('EI').asfloat)),6)+', '+
                                                  'EF='+zerar(somenteNumero(formatfloat('######0.00',qrEncerrante.fieldbyname('EF').asfloat)),6)+', '+
                                                  'Volume='+formatfloat('#########0.000',qrEncerrante.fieldbyname('volume').asfloat));
         qrEncerrante.NEXT;
        end;
        if sMsg <> 'OK' then
        begin
          if application.messagebox(pwidechar('Erro na impressão do relatório gerencial!'+#13+
                                              'Mensagem: '+sMsg+#13+
                                              'Deseja tentar outra vez?'),'Erro',
                                              mb_yesno+mb_iconerror ) = idno
          then
          begin
            break;
          end;
        end;
      until sMsg = 'OK';

  end;

  if sMsg = 'OK' then
  begin
    repeat
      if frmPrincipal.TipoImpressora = fiscal then
        sMsg := cECF_Fecha_Gerencial(iECF_Modelo)
      else
        sMsg := 'OK'; //Imp_Fecha_Gerencial(sPortaNaoFiscal);

      if sMsg <> 'OK' then
      begin
        if application.messagebox(pwidechar('Erro ao fechar relatório gerencial!'+#13+
                                            'Mensagem: '+sMsg+#13+
                                            'Deseja tentar outra vez?'),'Erro',
                                            mb_yesno+mb_iconerror ) = idno
        then
        begin
          break;
        end;
      end
      else
      begin
        // registrar Gerencial no banco de dados
        with frmmodulo do
        begin
          spNao_Fiscal.Close;
          spNao_Fiscal.parambyname('codigo').asstring := codifica_cupom;
          spNao_fiscal.parambyname('ecf').asstring := sECF_Serial;
          spNao_fiscal.ParamByName('data').asdatetime := dData_Sistema;
          spNao_fiscal.ParamByName('hora').Astime := strtotime(copy(cECF_Data_Hora(iECF_Modelo),12,8));
          spNao_fiscal.ParamByName('indice').asstring := 'RG';
          spNao_fiscal.ParamByName('Descricao').asstring := 'RELATÓRIO GERENCIAL';
          spNao_fiscal.ParamByName('valor').asfloat := 0;
          spNao_fiscal.ParamByName('COO').asstring := sNumero_Cupom;
          spNao_fiscal.ParamByName('GNF').asstring := sGNF;
          spNao_fiscal.ParamByName('GRG').asstring := sGRG;
          spNao_fiscal.ParamByName('CDC').Clear;
          spNao_fiscal.ParamByName('DENOMINACAO').asstring := 'RG';
          spNao_Fiscal.Prepare;
          spNao_Fiscal.Execute;
          result := true;
        end;

      end;
    until sMsg = 'OK';


  end;
end;

// -------------------------------------------------------------------------- //
function tfrmcaixa_fechamento.relatorio_mesa():boolean;
var iqtde : integer;
    rtotal : real;
begin
  qrMesa.close;
  qrMesa.sql.clear;
  qrMesa.sql.add('select sum(r000002.total) soma,');
  qrMesa.sql.add('r000001.codigo, r000001.data, r000001.hora');
  qrMesa.sql.add('from r000001, r000002');
  qrMesa.sql.add('where r000001.codigo = r000002.cod_mesa');
  qrMesa.sql.add('group by r000001.codigo, r000001.data, r000001.hora');
  qrMesa.sql.add('order by r000001.codigo');
  qrMesa.open;




  repeat
    if frmPrincipal.TipoImpressora = fiscal then
    begin
      sMsg := cECF_Abre_Gerencial(iECF_Modelo,'MESAS ABERTAS');
      sNumero_Cupom := cECF_Numero_Cupom(iECF_Modelo);
    end
    else
    begin
      sMsg := Imp_Abre_Gerencial(sPortaNaoFiscal,'MESAS ABERTAS');
      sNumero_Cupom := Zerar( FloatToStr(Max('')), 5);
      if Length(sNumero_Cupom) = 5 then
      sNumero_Cupom := '9' + sNumero_Cupom; // Insere o identificador nao fiscal
    end;


    if sMsg <> 'OK' then
    begin
      if application.messagebox(pwidechar('Erro ao abrir relatório gerencial!'+#13+
                                          'Mensagem: '+sMsg+#13+
                                          'Deseja tentar outra vez?'),'Erro',
                                          mb_yesno+mb_iconerror ) = idno
      then
      begin
        break;
      end;
    end
    else
    begin
      // extrair do ecf o numero dos contadores

      if frmPrincipal.TipoImpressora = fiscal then
      begin
        sGNF := cECF_Numero_Contador_Operacao_NF(iECF_Modelo);
        sGRG := cECF_Numero_Contador_Relatorio_Gerencial(iECF_Modelo);
      end
      else // Nao Fiscal
      begin
        sGNF := Zerar( FloatToStr( max('')), 5);
        sGRG := Zerar( sGNF, 5);
        if Length(sGNF) = 5 then
          sGNF := '9' + sGNF;
        if Length(sGRG) = 5 then
          sGRG := '9' + sGRG;
      end;


    end;
  until sMsg = 'OK';


      if sMsg = 'OK' then
      begin

          repeat
            if frmPrincipal.TipoImpressora = fiscal then
            begin
              sMSG := cECF_Usa_Gerencial(iECF_Modelo,'------------------------------------------------');
              sMSG := cECF_Usa_Gerencial(iECF_Modelo,'No.Mesa   Abertura (Data/Hora)     Total Consumo');
              sMSG := cECF_Usa_Gerencial(iECF_Modelo,'------------------------------------------------');
            end
            else
            begin
              sMSG := Imp_Usa_Gerencial(sPortaNaoFiscal,'------------------------------------------------');
              sMSG := Imp_Usa_Gerencial(sPortaNaoFiscal,'No.Mesa   Abertura (Data/Hora)     Total Consumo');
              sMSG := Imp_Usa_Gerencial(sPortaNaoFiscal,'------------------------------------------------');
            end;



            frmModulo.query_servidor.close;
            frmmodulo.query_servidor.sql.clear;
            frmmodulo.query_servidor.sql.add('select sum(r000002.total) soma,');
            frmmodulo.query_servidor.sql.add('r000001.codigo, r000001.data, r000001.hora');
            frmmodulo.query_servidor.sql.add('from r000001, r000002');
            frmmodulo.query_servidor.sql.add('where r000001.codigo = r000002.cod_mesa');
            frmmodulo.query_servidor.sql.add('group by r000001.codigo, r000001.data, r000001.hora');
            frmmodulo.query_servidor.sql.add('order by r000001.codigo');
            frmmodulo.query_servidor.open;

            frmmodulo.query_servidor.First;
            while not frmmodulo.query_servidor.eof do
            begin
              if frmPrincipal.TipoImpressora = fiscal then
               sMSG := cECF_Usa_Gerencial(iECF_Modelo,zerar(frmmodulo.query_servidor.fieldbyname('codigo').asstring,7)+'   '+
                                                      frmmodulo.query_servidor.fieldbyname('data').asstring+' '+
                                                      frmmodulo.query_servidor.fieldbyname('hora').asstring+'      '+
                                                      texto_justifica(formatfloat('###,###,##0.00',
                                                                          frmmodulo.query_servidor.fieldbyname('soma').asfloat),13,' ',taDireita))
              else
               sMSG := Imp_Usa_Gerencial(sPortaNaoFiscal,zerar(frmmodulo.query_servidor.fieldbyname('codigo').asstring,7)+'   '+
                                                      frmmodulo.query_servidor.fieldbyname('data').asstring+' '+
                                                      frmmodulo.query_servidor.fieldbyname('hora').asstring+'      '+
                                                      texto_justifica(formatfloat('###,###,##0.00',
                                                                          frmmodulo.query_servidor.fieldbyname('soma').asfloat),13,' ',taDireita));


             frmmodulo.query_servidor.NEXT;
            end;
            if sMsg <> 'OK' then
            begin
              if application.messagebox(pwidechar('Erro na impressão do relatório gerencial!'+#13+
                                                  'Mensagem: '+sMsg+#13+
                                                  'Deseja tentar outra vez?'),'Erro',
                                                  mb_yesno+mb_iconerror ) = idno
              then
              begin
                break;
              end;
            end;
          until sMsg = 'OK';

      end;

      if sMsg = 'OK' then
      begin
        repeat
          if frmPrincipal.TipoImpressora = Fiscal then
            sMsg := cECF_Fecha_Gerencial(iECF_Modelo)
          else
            sMsg := 'OK';//Imp_Fecha_Gerencial(iECF_Modelo);

          if sMsg <> 'OK' then
          begin
            if application.messagebox(pwidechar('Erro ao fechar relatório gerencial!'+#13+
                                                'Mensagem: '+sMsg+#13+
                                                'Deseja tentar outra vez?'),'Erro',
                                                mb_yesno+mb_iconerror ) = idno
            then
            begin
              break;
            end;
          end
          else
          begin
            // registrar Gerencial no banco de dados
            with frmmodulo do
            begin
              spNao_Fiscal.Close;
              spNao_Fiscal.parambyname('codigo').asstring := codifica_cupom;
              spNao_fiscal.parambyname('ecf').asstring := sECF_Serial;
              spNao_fiscal.ParamByName('data').asdatetime := dData_Sistema;
              spNao_fiscal.ParamByName('hora').Astime := strtotime(copy(cECF_Data_Hora(iECF_Modelo),12,8));
              spNao_fiscal.ParamByName('indice').asstring := 'RG';
              spNao_fiscal.ParamByName('Descricao').asstring := 'RELATÓRIO GERENCIAL';
              spNao_fiscal.ParamByName('valor').asfloat := 0;
              spNao_fiscal.ParamByName('COO').asstring := sNumero_Cupom;
              spNao_fiscal.ParamByName('GNF').asstring := sGNF;
              spNao_fiscal.ParamByName('GRG').asstring := sGRG;
              spNao_fiscal.ParamByName('CDC').Clear;
              spNao_fiscal.ParamByName('DENOMINACAO').asstring := 'RG';
              spNao_Fiscal.Prepare;
              spNao_Fiscal.Execute;
              result := true;
            end;

          end;
        until sMsg = 'OK';


      end;
       frmMsg_Operador.Hide;


end;

// -------------------------------------------------------------------------- //
function tfrmcaixa_fechamento.relatorio_dav():boolean;
var iqtde : integer;
    rtotal : real;
begin


        qrdav.close;
        qrdav.sql.clear;
        qrdav.sql.add('select * from DAV');
        qrdav.sql.add('where ECF = '''+sECF_Serial+'''');
        qrdav.sql.add('and data = :datai');
        qrdav.sql.add('order by numero, data');
        qrdav.parambyname('datai').asdatetime := ed_data.date;
        qrdav.open;


      if qrdav.RecordCount > 0 then
      begin
        frmMsg_Operador.lb_msg.Caption := 'Aguarde! Imprimindo relação de DAV...';
        frmMsg_Operador.Show;
        frmMsg_Operador.Refresh;

      // impressao em relatorio gerencial
      repeat
        // COO
        if frmPrincipal.TipoImpressora = fiscal then
        begin
          sMsg := cECF_Abre_Gerencial(iECF_Modelo,'DAV EMITIDOS');
          sNumero_Cupom := cECF_Numero_Cupom(iECF_Modelo);
        end
        else
        begin
          sMsg := Imp_Abre_Gerencial(sPortaNaoFiscal,'DAV EMITIDOS');
          sNumero_Cupom := Zerar( FloatToStr( max('')), 5);
          if Length(sNumero_Cupom) = 5 then
          sNumero_Cupom := '9' + sNumero_Cupom; // Insere o identificador nao fiscal
        end;

        if sMsg <> 'OK' then
        begin
          result := false;
          break;
          exit;
        end
        else
        begin
          // extrair GNF E GRG
          if frmPrincipal.TipoImpressora = fiscal then
          begin
            sGNF := cECF_Numero_Contador_Operacao_NF(iECF_Modelo);
            sGRG := cECF_Numero_Contador_Relatorio_Gerencial(iECF_Modelo);
          end
          else
          begin
            sGNF := Zerar( FloatToStr( max('')), 5);
            sGRG := Zerar( sGNF, 5);
            if Length(sGNF) = 5 then
              sGNF := '9' + sGNF;
            if Length(sGRG) = 5 then
              sGRG := '9' + sGRG;

          end;
        end;
      until sMsg = 'OK';

      if smsg <> 'OK' then exit;

      if sMsg = 'OK' then
      begin
          repeat
            if frmPrincipal.TipoImpressora = fiscal then
            begin
              SMsg := cECF_Usa_Gerencial(iECF_Modelo,'Numero        Data       Titulo         Valor-R$');
              SMsg := cECF_Usa_Gerencial(iECF_Modelo,'------------------------------------------------');
            end
            else
            begin
              SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,'Numero        Data       Titulo         Valor-R$');
              SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,'------------------------------------------------');
            end;

            if sMsg <> 'OK' then
            begin
              if application.messagebox(pwidechar('Erro na impressão do relatório gerencial!'+#13+
                                                  'Mensagem: '+sMsg+#13+
                                                  'Deseja tentar outra vez?'),'Erro',
                                                  mb_yesno+mb_iconerror ) = idno
              then
              begin
                break;
              end;
            end;
          until sMsg = 'OK';

      end;



      // davs emitidos pelo ecf
      if sMsg = 'OK' then
      begin
        // rodar os davs emitidos pelo ecf
        iqtde := 0;
        rtotal := 0;
        qrDav.first;
        while not qrdav.eof do
        begin
          repeat
            if frmPrincipal.TipoImpressora = fiscal then
              SMsg := cECF_Usa_Gerencial(iECF_Modelo,
            {Numero } texto_justifica(qrDAV.fieldbyname('NUMERO').asstring,13,'0',taDireita)+' '+
            {Emissao} texto_justifica(qrDAV.fieldbyname('data').asstring,10,' ',taEsquerda)+' '+
            {titulo } texto_justifica(qrDAV.fieldbyname('titulo').asstring,13,' ',taEsquerda)+'  '+
            {Valor  } texto_justifica(formatfloat('###,###,##0.00',qrdav.fieldbyname('valor').asfloat),8,' ',taDireita))
            else
              SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
            {Numero } texto_justifica(qrDAV.fieldbyname('NUMERO').asstring,13,'0',taDireita)+' '+
            {Emissao} texto_justifica(qrDAV.fieldbyname('data').asstring,10,' ',taEsquerda)+' '+
            {titulo } texto_justifica(qrDAV.fieldbyname('titulo').asstring,13,' ',taEsquerda)+'  '+
            {Valor  } texto_justifica(formatfloat('###,###,##0.00',qrdav.fieldbyname('valor').asfloat),8,' ',taDireita));

            if sMsg <> 'OK' then
            begin
              if application.messagebox(pwidechar('Erro na impressão do relatório gerencial!'+#13+
                                                  'Mensagem: '+sMsg+#13+
                                                  'Deseja tentar outra vez?'),'Erro',
                                                  mb_yesno+mb_iconerror ) = idno
              then
              begin
                break;
              end;
            end
            else
            begin
              inc(iqtde);
              rtotal := rtotal + qrdav.FieldByName('valor').asfloat;
              qrdav.next;
            end;
          until sMsg = 'OK';
        end;
      end;

(*      // se a conexao com servidor estiver ociosa
      if bServidor_Conexao then
      begin
        // davs os emitidos por impressora nao fiscal
        if sMsg = 'OK' then
        begin
          // rodar os davs - os, emitidos em impressora nf
          // OS emitida por equipamento nao fiscal
          //Codigos 8000
          query.close;
          query.sql.clear;
          query.sql.add('select * from c000051');
          query.sql.add('where data between :datai and :dataf');
          query.sql.add('and dav is not null');
          query.sql.add('order by dav, data');
          query.parambyname('datai').asdatetime := ed_data_ini.Date;
          query.parambyname('dataf').asdatetime := ed_data_fim.Date;
          query.open;

          // rodar os querys emitidos pelo ecf
          query.first;
          while not query.eof do
          begin
            repeat
              SMsg := cECF_Usa_Gerencial(iECF_Modelo,
              {Numero } texto_justifica(query.fieldbyname('DAV').asstring,13,'0',taDireita)+' '+
              {Emissao} texto_justifica(query.fieldbyname('data').asstring,10,' ',taEsquerda)+' '+
              {titulo } texto_justifica('OS',13,' ',taEsquerda)+'  '+
              {Valor  } texto_justifica(formatfloat('###,###,##0.00',query.fieldbyname('total').asfloat),8,' ',taDireita));
              if sMsg <> 'OK' then
              begin
                if application.messagebox(pansichar('Erro na impressão do relatório gerencial!'+#13+
                                                    'Mensagem: '+sMsg+#13+
                                                    'Deseja tentar outra vez?'),'Erro',
                                                    mb_yesno+mb_iconerror ) = idno
                then
                begin
                  break;
                end;
              end
              else
              begin
                inc(iqtde);
                rtotal := rtotal + query.FieldByName('TOTAL').asfloat;
                query.next;
              end;
            until sMsg = 'OK';
          end;
        end;

        // davs os emitidos por impressora nao fiscal
        if sMsg = 'OK' then
        begin
          // ORCAMENTOS emitidos por equipamento nao fiscal
          //Codigos 9000
          query.close;
          query.sql.clear;
          query.sql.add('select * from c000074');
          query.sql.add('where data between :datai and :dataf');
          query.sql.add('and dav is not null');
          query.sql.add('order by dav, data');
          query.parambyname('datai').asdatetime := ed_data_ini.Date;
          query.parambyname('dataf').asdatetime := ed_data_fim.Date;
          query.open;
          // rodar os querys emitidos pelo ecf
          query.first;
          while not query.eof do
          begin
            repeat
              SMsg := cECF_Usa_Gerencial(iECF_Modelo,
              {Numero } texto_justifica(query.fieldbyname('DAV').asstring,13,'0',taDireita)+' '+
              {Emissao} texto_justifica(query.fieldbyname('data').asstring,10,' ',taEsquerda)+' '+
              {titulo } texto_justifica('ORCAMENTO',13,' ',taEsquerda)+'  '+
              {Valor  } texto_justifica(formatfloat('###,###,##0.00',query.fieldbyname('total').asfloat),8,' ',taDireita));
              if sMsg <> 'OK' then
              begin
                if application.messagebox(pansichar('Erro na impressão do relatório gerencial!'+#13+
                                                    'Mensagem: '+sMsg+#13+
                                                    'Deseja tentar outra vez?'),'Erro',
                                                    mb_yesno+mb_iconerror ) = idno
                then
                begin
                  break;
                end;
              end
              else
              begin
                inc(iqtde);
                rtotal := rtotal + query.FieldByName('TOTAL').asfloat;
                query.next;
              end;
            until sMsg = 'OK';
          end;
        end;
      end; // final verificacao da conexao com o servidor


      *)



      if sMsg = 'OK' then
      begin
          repeat
            if frmPrincipal.TipoImpressora = fiscal then
            begin
              SMsg := cECF_Usa_Gerencial(iECF_Modelo,'------------------------------------------------');
              SMsg := cECF_Usa_Gerencial(iECF_Modelo,'Qtde: '+Zerar(inttostr(iqtde),6)+
                      '                     Total: '+
                      texto_justifica(formatfloat('###,###,##0.00',rtotal),8,' ',taDireita));
            end
            else
            begin
              SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,'------------------------------------------------');
              SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,'Qtde: '+Zerar(inttostr(iqtde),6)+
                      '                     Total: '+
                      texto_justifica(formatfloat('###,###,##0.00',rtotal),8,' ',taDireita));
            end;
            if sMsg <> 'OK' then
            begin
              if application.messagebox(pwidechar('Erro na impressão do relatório gerencial!'+#13+
                                                  'Mensagem: '+sMsg+#13+
                                                  'Deseja tentar outra vez?'),'Erro',
                                                  mb_yesno+mb_iconerror ) = idno
              then
              begin
                break;
              end;
            end;
          until sMsg = 'OK';

      end;




      if sMsg = 'OK' then
      begin
        repeat
          if frmPrincipal.TipoImpressora = fiscal then
            sMsg := cECF_Fecha_Gerencial(iECF_Modelo)
          else
            sMsg := 'OK';//Imp_Fecha_Gerencial(sPortaNaoFiscal);

          if sMsg <> 'OK' then
          begin
            if application.messagebox(pwidechar('Erro ao fechar relatório gerencial!'+#13+
                                                'Mensagem: '+sMsg+#13+
                                                'Deseja tentar outra vez?'),'Erro',
                                                mb_yesno+mb_iconerror ) = idno
            then
            begin
              break;
            end;
          end
          else
          begin
            // registrar Gerencial no banco de dados
            with frmmodulo do
            begin
              spNao_Fiscal.Close;
              spNao_Fiscal.parambyname('codigo').asstring := codifica_cupom;
              spNao_fiscal.parambyname('ecf').asstring := sECF_Serial;
              spNao_fiscal.ParamByName('data').asdatetime := dData_Sistema;
              spNao_fiscal.ParamByName('hora').Astime := strtotime(copy(cECF_Data_Hora(iECF_Modelo),12,8));
              spNao_fiscal.ParamByName('indice').asstring := 'RG';
              spNao_fiscal.ParamByName('Descricao').asstring := 'RELATÓRIO GERENCIAL';
              spNao_fiscal.ParamByName('valor').asfloat := 0;
              spNao_fiscal.ParamByName('COO').asstring := sNumero_Cupom;
              spNao_fiscal.ParamByName('GNF').asstring := sGNF;
              spNao_fiscal.ParamByName('GRG').asstring := sGRG;
              spNao_fiscal.ParamByName('CDC').Clear;
              spNao_fiscal.ParamByName('DENOMINACAO').asstring := 'RG';
              spNao_Fiscal.Prepare;
              spNao_Fiscal.Execute;
              result := true;
            end;

          end;
        until sMsg = 'OK';


      end;
       frmMsg_Operador.Hide;
      end;

end;

// -------------------------------------------------------------------------- //
procedure TfrmCaixa_Fechamento.Action1Execute(Sender: TObject);
begin
  if Editar then
    Editar := False
  else
    Editar := True;
  lbEdicao.Visible := Editar;
end;

function TfrmCaixa_Fechamento.Zerar(texto: string; qtde: integer): string;
begin
  while length(texto) < qtde do texto := '0' + texto;
  result := texto;
end;

procedure TfrmCaixa_Fechamento.AdvGlowButton2Click(Sender: TObject);
var
  i,a:Integer;
  begin

   Begin
      qrcartaod.CLOSE;
      qrcartaod.SQL.CLEAR;
      qrcartaod.SQl.ADD ('select CX.DATA, CX.codoperador, FUN.nome, CX.movimento, SUM(CX.VALOR) AS VALOR');
      qrcartaod.SQl.ADD ('FROM C000044 CX, c000008 FUN');
      qrcartaod.SQl.ADD ('WHERE CX.codoperador = FUN.codigo AND');
      qrcartaod.SQl.ADD ('CX.codoperador =:COD_OPERADOR AND');
      qrcartaod.SQl.ADD ('CX.data =:DATA AND CX.movimento = 8');
      qrcartaod.SQl.ADD ('group BY CX.data, CX.codoperador, FUN.nome, CX.movimento');
      qrcartaod.ParamByName('DATA').asdatetime := ed_data.date;
      qrcartaod.ParamByName('COD_OPERADOR').asstring := zerar(frmvenda.lbcod_operador.Caption, 6);
      qrcartaod.OPEN;


      qrcartaoc.CLOSE;
      qrcartaoc.SQL.CLEAR;
      qrcartaoc.SQl.ADD ('select CX.DATA, CX.codoperador, FUN.nome, CX.movimento, SUM(CX.VALOR) AS VALOR');
      qrcartaoc.SQl.ADD ('FROM C000044 CX, c000008 FUN');
      qrcartaoc.SQl.ADD ('WHERE CX.codoperador = FUN.codigo AND');
      qrcartaoc.SQl.ADD ('CX.codoperador =:COD_OPERADOR AND');
      qrcartaoc.SQl.ADD ('CX.data =:DATA AND CX.movimento = 7');
      qrcartaoc.SQl.ADD ('group BY CX.data, CX.codoperador, FUN.nome, CX.movimento');
      qrcartaoc.ParamByName('DATA').asdatetime := ed_data.date;
      qrcartaoc.ParamByName('COD_OPERADOR').asstring := zerar(frmvenda.lbcod_operador.Caption, 6);
      qrcartaoc.OPEN;

      qraprazo.CLOSE;
      qraprazo.SQL.CLEAR;
      qraprazo.SQl.ADD ('select CX.DATA, CX.codoperador, FUN.nome, CX.movimento, SUM(CX.VALOR) AS VALOR');
      qraprazo.SQl.ADD ('FROM C000044 CX, c000008 FUN');
      qraprazo.SQl.ADD ('WHERE CX.codoperador = FUN.codigo AND');
      qraprazo.SQl.ADD ('CX.codoperador =:COD_OPERADOR AND');
      qraprazo.SQl.ADD ('CX.data =:DATA AND CX.movimento = 4');
      qraprazo.SQl.ADD ('group BY CX.data, CX.codoperador, FUN.nome, CX.movimento');
      qraprazo.ParamByName('DATA').asdatetime := ed_data.date;
      qraprazo.ParamByName('COD_OPERADOR').asstring := zerar(frmvenda.lbcod_operador.Caption, 6);
      qraprazo.OPEN;


    qrdinheiro.CLOSE;
    qrdinheiro.SQL.CLEAR;
    qrdinheiro.SQl.ADD ('select CX.DATA, CX.codoperador, FUN.nome, CX.movimento, SUM(CX.VALOR) AS VALOR');
    qrdinheiro.SQl.ADD ('FROM C000044 CX, c000008 FUN');
    qrdinheiro.SQl.ADD ('WHERE CX.codoperador = FUN.codigo AND');
    qrdinheiro.SQl.ADD ('CX.codoperador =:COD_OPERADOR AND');
    qrdinheiro.SQl.ADD ('CX.data =:DATA AND CX.movimento = 3');
    qrdinheiro.SQl.ADD ('group BY CX.data, CX.codoperador, FUN.nome, CX.movimento');
    qrdinheiro.ParamByName('DATA').asdatetime := ed_data.date;
    qrdinheiro.ParamByName('COD_OPERADOR').asstring := zerar(frmvenda.lbcod_operador.Caption, 6);
    qrdinheiro.OPEN;

    qrpix.CLOSE;
    qrpix.SQL.CLEAR;
    qrpix.SQl.ADD ('select CX.DATA, CX.codoperador, FUN.nome, CX.movimento, SUM(CX.VALOR) AS VALOR');
    qrpix.SQl.ADD ('FROM C000044 CX, c000008 FUN');
    qrpix.SQl.ADD ('WHERE CX.codoperador = FUN.codigo AND');
    qrpix.SQl.ADD ('CX.codoperador =:COD_OPERADOR AND');
    qrpix.SQl.ADD ('CX.data =:DATA AND CX.movimento = 5');
    qrpix.SQl.ADD ('group BY CX.data, CX.codoperador, FUN.nome, CX.movimento');
    qrpix.ParamByName('DATA').asdatetime := ed_data.date;
    qrpix.ParamByName('COD_OPERADOR').asstring := zerar(frmvenda.lbcod_operador.Caption, 6);
    qrpix.OPEN;

    qrdep_transf.CLOSE;
    qrdep_transf.SQL.CLEAR;
    qrdep_transf.SQl.ADD ('select CX.DATA, CX.codoperador, FUN.nome, CX.movimento, SUM(CX.VALOR) AS VALOR');
    qrdep_transf.SQl.ADD ('FROM C000044 CX, c000008 FUN');
    qrdep_transf.SQl.ADD ('WHERE CX.codoperador = FUN.codigo AND');
    qrdep_transf.SQl.ADD ('CX.codoperador =:COD_OPERADOR AND');
    qrdep_transf.SQl.ADD ('CX.data =:DATA AND CX.movimento = 6');
    qrdep_transf.SQl.ADD ('group BY CX.data, CX.codoperador, FUN.nome, CX.movimento');
    qrdep_transf.ParamByName('DATA').asdatetime := ed_data.date;
    qrdep_transf.ParamByName('COD_OPERADOR').asstring := zerar(frmvenda.lbcod_operador.Caption, 6);
    qrdep_transf.OPEN;

    qrsuprimento.CLOSE;
    qrsuprimento.SQL.CLEAR;
    qrsuprimento.SQl.ADD ('SELECT CODVENDEDOR, VALOR AS VALORSP');
    qrsuprimento.SQl.ADD ('FROM NAO_FISCAL ');
    qrsuprimento.SQl.ADD ('where DESCRICAO = ''SUPRIMENTO''');
    qrsuprimento.SQl.ADD ('and CODVENDEDOR =:CODVEND AND data = :datam');
    qrsuprimento.ParamByName('CODVEND').asstring := frmvenda.lbcod_operador.Caption;
    qrsuprimento.ParamByName('datam').asdatetime := ed_data.date;
    qrsuprimento.OPEN;


    qrsangria.CLOSE;
    qrsangria.SQL.CLEAR;
    qrsangria.SQl.ADD ('SELECT CODVENDEDOR, VALOR AS VALORS');
    qrsangria.SQl.ADD ('FROM NAO_FISCAL ');
    qrsangria.SQl.ADD ('where DESCRICAO = ''SANGRIA''');
    qrsangria.SQl.ADD ('and CODVENDEDOR =:CODVEND AND data = :datam');
    qrsangria.ParamByName('CODVEND').asstring := frmvenda.lbcod_operador.Caption;
    qrsangria.ParamByName('datam').asdatetime := ed_data.date;
    qrsangria.OPEN;

    qrcodcx.CLOSE;
    qrcodcx.SQL.CLEAR;
    qrcodcx.SQl.ADD ('SELECT MAX(DATA) AS DATA, MAX(COD_CAIXA) AS COD_CAIXA');
    qrcodcx.SQl.ADD ('FROM CUPOM');
    qrcodcx.SQl.ADD ('where ');
    qrcodcx.SQl.ADD ('data = :datam');
    qrcodcx.ParamByName('datam').asdatetime := ed_data.date;
    qrcodcx.OPEN;

     frxRelSimples.ShowReport();
     // exit;
   End;

end;

procedure TfrmCaixa_Fechamento.AdvGlowButton3Click(Sender: TObject);
var
  i,a:Integer;
begin

    qrdinheiro.CLOSE;
    qrdinheiro.SQL.CLEAR;
    qrdinheiro.SQl.ADD ('UPDATE C000045 SET');
    qrdinheiro.SQl.ADD ('SITUACAO_ATUAL =:UP');
    qrdinheiro.SQl.ADD ('WHERE CODFUNCIONARIO =:COD_FUNC');
    qrdinheiro.ParamByName('COD_FUNC').AsString := frmvenda.lbcod_operador.Caption;
    qrdinheiro.ParamByName('UP').AsString := 'CAIXA FECHADO';
    qrdinheiro.ExecSQL;


end;

procedure TfrmCaixa_Fechamento.AdvGlowButton4Click(Sender: TObject);
var
  i,a:Integer;
    begin

    qrcartaod1.CLOSE;
    qrcartaod1.SQL.CLEAR;
    qrcartaod1.SQl.ADD ('SELECT CUPOM_FORMA.forma AS FORMA_PAGAMENTOD, ');
    qrcartaod1.SQl.ADD ('SUM(CUPOM_FORMA.VALOR) AS TOTALD');
    qrcartaod1.SQl.ADD ('FROM CUPOM, CUPOM_FORMA');
    qrcartaod1.SQl.ADD ('where CUPOM_FORMA.cancelado = 0 and CUPOM_FORMA.forma = ''CARTAO DEBITO'' ');
    qrcartaod1.SQl.ADD ('and CUPOM_FORMA.TIPO = ''CUPOM NAO FISCAL''');
    qrcartaod1.SQl.ADD ('and cupom.codigo = CUPOM_FORMA.cod_cupom');
    qrcartaod1.SQl.ADD ('and cupom.data = :datam and cupom.hora between :horaIN and :horaFI');
    qrcartaod1.SQl.ADD ('GROUP BY ');
    qrcartaod1.SQl.ADD ('CUPOM_FORMA.forma');
    qrcartaod1.ParamByName('datam').asdatetime  := ed_data.date;
    qrcartaod1.ParamByName('horaIN').asdatetime := TimeEdit_IN.Time;
    qrcartaod1.ParamByName('horaFI').asdatetime := TimeEdit_FI.Time;
    qrcartaod1.ExecSQL;

    qrcartaoc1.CLOSE;
    qrcartaoc1.SQL.CLEAR;
    qrcartaoc1.SQl.ADD ('SELECT CUPOM_FORMA.forma AS FORMA_PAGAMENTOC, ');
    qrcartaoc1.SQl.ADD ('SUM(CUPOM_FORMA.VALOR) AS TOTALC');
    qrcartaoc1.SQl.ADD ('FROM CUPOM, CUPOM_FORMA');
    qrcartaoc1.SQl.ADD ('where CUPOM_FORMA.cancelado = 0 and CUPOM_FORMA.forma = ''CARTAO CREDITO'' ');
    qrcartaoc1.SQl.ADD ('and CUPOM_FORMA.TIPO = ''CUPOM NAO FISCAL''');
    qrcartaoc1.SQl.ADD ('and cupom.codigo = CUPOM_FORMA.cod_cupom');
    qrcartaoc1.SQl.ADD ('and cupom.data = :datam and cupom.hora between :horaIN and :horaFI');
    qrcartaoc1.SQl.ADD ('GROUP BY ');
    qrcartaoc1.SQl.ADD ('CUPOM_FORMA.forma');
    qrcartaoc1.ParamByName('datam').asdatetime := ed_data.date;
    qrcartaoc1.ParamByName('horaIN').asdatetime := TimeEdit_IN.Time;
    qrcartaoc1.ParamByName('horaFI').asdatetime := TimeEdit_FI.Time;
    qrcartaoc1.OPEN;

    qraprazo1.CLOSE;
    qraprazo1.SQL.CLEAR;
    qraprazo1.SQl.ADD ('SELECT CUPOM_FORMA.forma AS FORMA_PAGAMENTOAP, ');
    qraprazo1.SQl.ADD ('SUM(CUPOM_FORMA.VALOR) AS TOTALAP');
    qraprazo1.SQl.ADD ('FROM CUPOM, CUPOM_FORMA');
    qraprazo1.SQl.ADD ('where CUPOM_FORMA.cancelado = 0 and CUPOM_FORMA.forma = ''APRAZO'' ');
    qraprazo1.SQl.ADD ('and CUPOM_FORMA.TIPO = ''CUPOM NAO FISCAL''');
    qraprazo1.SQl.ADD ('and cupom.codigo = CUPOM_FORMA.cod_cupom');
    qraprazo1.SQl.ADD ('and cupom.data = :datam and cupom.hora between :horaIN and :horaFI');
    qraprazo1.SQl.ADD ('GROUP BY ');
    qraprazo1.SQl.ADD ('CUPOM_FORMA.forma');
    qraprazo1.ParamByName('datam').asdatetime := ed_data.date;
    qraprazo1.ParamByName('horaIN').asdatetime := TimeEdit_IN.Time;
    qraprazo1.ParamByName('horaFI').asdatetime := TimeEdit_FI.Time;
    qraprazo1.OPEN;


    qrdinheiro1.CLOSE;
    qrdinheiro1.SQL.CLEAR;
    qrdinheiro1.SQl.ADD ('SELECT CUPOM_FORMA.forma AS FORMA_PAGAMENTO, CUPOM.COD_VENDEDOR, CUPOM.DATA,');
    qrdinheiro1.SQl.ADD ('SUM(CUPOM_FORMA.VALOR) AS TOTAL, SUM(CUPOM.valor_troco) AS TROCO');
    qrdinheiro1.SQl.ADD ('FROM CUPOM, CUPOM_FORMA');
    qrdinheiro1.SQl.ADD ('where CUPOM_FORMA.cancelado = 0 and');
    qrdinheiro1.SQl.ADD ('cupom.codigo = CUPOM_FORMA.cod_cupom');
    qrdinheiro1.SQl.ADD ('and CUPOM_FORMA.TIPO = ''CUPOM NAO FISCAL''');
    qrdinheiro1.SQl.ADD ('and CUPOM_FORMA.forma = ''DINHEIRO''');
    qrdinheiro1.SQl.ADD ('and cupom.data = :datam and cupom.hora between :horaIN and :horaFI');
    qrdinheiro1.SQl.ADD ('GROUP BY');
    qrdinheiro1.SQl.ADD ('CUPOM_FORMA.forma, CUPOM_FORMA.tipo, CUPOM.COD_VENDEDOR, CUPOM.DATA');
    qrdinheiro1.ParamByName('datam').asdatetime := ed_data.date;
    qrdinheiro1.ParamByName('horaIN').asdatetime := TimeEdit_IN.Time;
    qrdinheiro1.ParamByName('horaFI').asdatetime := TimeEdit_FI.Time;
    qrdinheiro1.OPEN;

    qrsuprimento1.CLOSE;
    qrsuprimento1.SQL.CLEAR;
    qrsuprimento1.SQl.ADD ('SELECT DESCRICAO AS FORMA_PAGAMENTOSP, VALOR AS VALORSP');
    qrsuprimento1.SQl.ADD ('FROM NAO_FISCAL ');
    qrsuprimento1.SQl.ADD ('where DESCRICAO = ''SUPRIMENTO''');
    qrsuprimento1.SQl.ADD ('and data = :datam and hora between :horaIN and :horaFI');
    qrsuprimento1.ParamByName('datam').asdatetime := ed_data.date;
    qrsuprimento1.ParamByName('horaIN').asdatetime := TimeEdit_IN.Time;
    qrsuprimento1.ParamByName('horaFI').asdatetime := TimeEdit_FI.Time;
    qrsuprimento1.OPEN;

    qrsangria1.CLOSE;
    qrsangria1.SQL.CLEAR;
    qrsangria1.SQl.ADD ('SELECT DESCRICAO AS FORMA_PAGAMENTOS, VALOR AS VALORS');
    qrsangria1.SQl.ADD ('FROM NAO_FISCAL ');
    qrsangria1.SQl.ADD ('where DESCRICAO = ''SANGRIA''');
    qrsangria1.SQl.ADD ('and data = :datam and hora between :horaIN and :horaFI');
    qrsangria1.ParamByName('datam').asdatetime := ed_data.date;
    qrsangria1.ParamByName('horaIN').asdatetime := TimeEdit_IN.Time;
    qrsangria1.ParamByName('horaFI').asdatetime := TimeEdit_FI.Time;
    qrsangria1.OPEN;

      frxrelatorio.ShowReport();
end;


procedure TfrmCaixa_Fechamento.AdvMetroButton1Click(Sender: TObject);
begin
   AdvGlowButton2.Visible := false;
  close;
end;

function tfrmcaixa_fechamento.arquivo_fiscal(data:tdatetime):string;
var
  txt : textfile;
  sNOme_arquivo : string;

begin
  {Anexo VI -  Arquivo eletronico dos registros Efetuados pelo ECF
    Registros
    R01 - Identificação do ECF
    R02 - Relações de Reduções Z
    R03 - Detalhamento da Redução Z
    R04 - Cupom Fiscal
    R05 - Detalhamento do Cupoom Fiscal
    R06 - Demais documentos emitidos
    R07 - Detalhes dos Cupons / Cupons Nao fiscais / Meios de Pagamento
    EAD - Assinatura Digital

    Nome do Arquivo: CCCCCCNNNNNNNNNNNNNNDDMMAAAA.txt
    CCCCCC -----> Codigo Nacional de identificação
    NNNNNNNNNNNNNN --> 14 ultimos digitos do do serial do ecf
    DDMMAAAA --> data do movimento no caso da da geracao automatica apos a reducao Z
                 ou data da emissao qdo for solicitado a sua geracao.

  }

   try

    // Inciando a criacao do arquivo
    sNome_Arquivo := '.\Txt\'+sECF_Codigo_Sefa+copy(sECF_Serial,length(sECF_serial)-14,14)+
                   somenteNumero(datetostr(data))+'.txt';
    assignfile(txt, sNOme_arquivo);
    rewrite(txt);
    // Registro R01
    Write(txt,'R01');
    //02 Numero de Serie/Fabricacao
    Write(txt,texto_justifica(sECF_Serial,20,' ',taEsquerda));
    //03 MF Adicional
    write(txt,texto_justifica(sECF_MF_Adicional,1,' ',taEsquerda));
    //04 Tipo de ECF
    write(txt,texto_justifica(sECF_Tipo,7,' ',taEsquerda));
    //05 Marca do ECF
    write(txt,texto_justifica(sECF_Marca,20,' ',taEsquerda));
    //06 Modelo do ECF
    write(txt,texto_justifica(sECF_Modelo,20,' ',taEsquerda));
    //07 Versao do SB
    write(txt,texto_justifica(sECF_Versao_SB,10,' ',taEsquerda));
    //08 Data inst. SB
    write(txt,texto_justifica(sECF_Data_SB,8,' ',taEsquerda));
    //09 Data inst. SB
    write(txt,texto_justifica(sECF_Hora_SB,6,' ',taEsquerda));
    //10 Data inst. SB
    write(txt,texto_justifica(sECF_Caixa,3,'0',taDireita));
    //11 CNPJ do Usuario
    write(txt,texto_justifica(somenteNumero(sEmpresa_CNPJ),14,' ',taEsquerda));
    //12 IE do usuario
    write(txt,texto_justifica(somenteNumero(sEmpresa_IE),14,' ',taEsquerda));
    //13 CNPJ da Desenvolvedora
    write(txt,texto_justifica(somenteNumero(sPAF_CNPJ),14,' ',taEsquerda));
    //14 IE da Desenvolvedora
    write(txt,texto_justifica(somenteNumero(sPAF_IE),14,' ',taEsquerda));
    //15 IM da Desenvolvedora
    write(txt,texto_justifica(somenteNumero(sPAF_IM),14,' ',taEsquerda));
    //16 Nome da Desenvolvedora
    write(txt,texto_justifica(sPAF_Empresa,40,' ',taEsquerda));
    //17 Nome do PAF
    write(txt,texto_justifica(sPAF_Nome,40,' ',taEsquerda));
    //18 Versao do PAF
    write(txt,texto_justifica(sPAF_Versao,10,' ',taEsquerda));
    //19 Codigo MD5
    write(txt,texto_justifica(sPAF_MD5,32,' ',taEsquerda));
    //20 Data Inicial - 8
    write(txt,troca_data(DateToStr(data)));
    //21 Data Final - 8
    write(txt,troca_data(DateToStr(data)));
    //22 Versao do Ato Cotepe
    writeln(txt,sPAF_Versao_ER);


    //Registro 02 - Relações de reduções Z
    // filtrar o banco de dados de reducoes Z
    qrarquivo.close;
    qrarquivo.sql.clear;
    qrarquivo.sql.add('Select * from reducaoZ');
    qrarquivo.sql.add('where data_movimento = :datai');
    qrarquivo.sql.add('and ecf = '''+sECF_Serial+'''');
    qrarquivo.sql.add('order by data_movimento');
    qrarquivo.parambyname('datai').asdatetime := data;
    qrarquivo.open;
    qrarquivo.first;

    // gerar um arquivo R02 para cada reduzao Z emitida
    while not qrarquivo.eof do
    begin
      //01 - Tipo
      write(txt,'R02');
      //02 - Numero de Fabricacao
      write(txt,texto_justifica(sECF_Serial,20,' ',taEsquerda));
      //03 MF Adicional
      write(txt,texto_justifica(sECF_MF_Adicional,1,' ',taEsquerda));
      //04 Modelo do ECF
      write(txt,texto_justifica(sECF_Modelo,20,' ',taEsquerda));
      //05 Numero do Usuario
      write(txt,texto_justifica(sECF_usuario,2,'0',taDireita));
      //06 CRZ - 6
      write(txt,texto_justifica(qrarquivo.fieldbyname('CRZ').asstring,6,'0',taDireita));
      //07 COO - 6
      write(txt,texto_justifica(qrarquivo.fieldbyname('COO').asstring,6,'0',taDireita));
      //08 CRO - 6
      write(txt,texto_justifica(qrarquivo.fieldbyname('CRO').asstring,6,'0',taDireita));
      //09 Data do Movimento - 8 - AAAAMMDD
      write(txt,troca_data(qrarquivo.fieldbyname('data_movimento').asstring));
      //10 Data de Emissao - 8 - AAAAMMDD
      write(txt,troca_data(qrarquivo.fieldbyname('data_emissao').asstring));
      //11 Hora de Emissao - 6 - HHMMSS
      write(txt,texto_justifica(somenteNumero(qrarquivo.fieldbyname('hora_emissao').asstring),6,' ',tadireita));
      //12 Venda bruta diária - 14 - 00000000001011 -> R$ 10,11
      write(txt,texto_justifica(somenteNumero(formatfloat('##########0.00',qrarquivo.fieldbyname('venda_bruta').asfloat)),14,'0',taDireita));
      //13 flag de Incidencia de desconto de ISSQN - S ou N
      writeln(txt,texto_justifica(sECF_Desconto_Iss,1,'N',taEsquerda));
      qrarquivo.next;
    end;
    // final do registro R02


    //Registro R03 - Detalhe da Reduçao Z
    //filtar o banco de dados de reducaoz_total_parcial
    qrarquivo.close;
    qrarquivo.sql.clear;
    qrarquivo.sql.add('select reducaoz_total_parcial.*, reducaoz.CRZ, reducaoz.data_movimento');
    qrarquivo.sql.add('from reducaoz_total_parcial, reducaoz');
    qrarquivo.sql.add('where reducaoz_total_parcial.cod_reducaoz = reducaoz.codigo');
    qrarquivo.sql.add('and reducaoz.data_movimento =  :datai');
    qrarquivo.sql.add('and reducaoz.ecf = '''+sECF_Serial+'''');
    qrarquivo.sql.add('order by reducaoz.data_movimento, reducaoz_total_parcial.codigo');
    qrarquivo.parambyname('datai').asdatetime := data;
    qrarquivo.open;
    qrarquivo.first;
    // gerar um arquivo R03 para cada totalizador de cada reducao z emitida
    while not qrarquivo.eof do
    begin
      //01 - Tipo
      write(txt,'R03');
      //02 - Numero de Fabricacao
      write(txt,texto_justifica(sECF_Serial,20,' ',taEsquerda));
      //03 MF Adicional
      write(txt,texto_justifica(sECF_MF_Adicional,1,' ',taEsquerda));
      //04 Modelo do ECF
      write(txt,texto_justifica(sECF_Modelo,20,' ',taEsquerda));
      //05 Numero do Usuario
      write(txt,texto_justifica(sECF_usuario,2,'0',taDireita));
      //06 CRZ - 6
      write(txt,texto_justifica(qrarquivo.fieldbyname('CRZ').asstring,6,'0',taDireita));
      //07 - Totalizador Parcial - 7
      write(txt,texto_justifica(qrarquivo.fieldbyname('totalizador').asstring,7,' ',taEsquerda));
      //08 - Valor acumulado - 13
      writeln(txt,texto_justifica(somenteNumero(formatfloat('##########0.00',qrarquivo.fieldbyname('valor').asfloat)),13,'0',taDireita));
      qrarquivo.next;
    end;
    // final do registro R03


    //Registro R04 - Cupom fiscal
    // filtrar o banco de dados de cupom
    qrarquivo.close;
    qrarquivo.sql.clear;
    qrarquivo.sql.add('select * from cupom');
    qrarquivo.sql.add('where data = :datai');
    qrarquivo.sql.add('and ecf = '''+sECF_Serial+'''');
    qrarquivo.sql.add('order by data, codigo');
    qrarquivo.parambyname('datai').asdatetime := data;
    qrarquivo.open;
    qrarquivo.first;
    // gerar um registro r04 para cada cupom
    while not qrarquivo.eof do
    begin
      //01 - Tipo
      write(txt,'R04');
      //02 - Numero de Fabricacao
      write(txt,texto_justifica(sECF_Serial,20,' ',taEsquerda));
      //03 MF Adicional
      write(txt,texto_justifica(sECF_MF_Adicional,1,' ',taEsquerda));
      //04 Modelo do ECF
      write(txt,texto_justifica(sECF_Modelo,20,' ',taEsquerda));
      //05 Numero do Usuario
      write(txt,texto_justifica(sECF_usuario,2,'0',taDireita));
      //06 CCF
      write(txt,texto_justifica(qrarquivo.fieldbyname('ccf').asstring,6,'0',taDireita));
      //07 COO
      write(txt,texto_justifica(qrarquivo.fieldbyname('numero').asstring,6,'0',taDireita));
      //8 Data de Emissao - 8 - AAAAMMDD
      write(txt,troca_data(qrarquivo.fieldbyname('data').asstring));
      //9 Subttotal do documento - 14
      write(txt,texto_justifica(somenteNumero(formatfloat('##########0.00',qrarquivo.fieldbyname('valor_produto').asfloat)),14,'0',taDireita));
      //10 Desconto sobre subtotal - 13
      write(txt,texto_justifica(somenteNumero(formatfloat('##########0.00',qrarquivo.fieldbyname('valor_desconto').asfloat)),13,'0',taDireita));
      //11 Indicador do tipo de desconto - V ou P
      write(txt,'V');
      //12 Acrescimo sobre subtotal - 13
      write(txt,texto_justifica(somenteNumero(formatfloat('##########0.00',qrarquivo.fieldbyname('valor_acrescimo').asfloat)),13,'0',taDireita));
      //13 Indicador do tipo de acrescimo - V ou P
      write(txt,'V');
      //14 Valor total liquido - 14
      write(txt,texto_justifica(somenteNumero(formatfloat('##########0.00',qrarquivo.fieldbyname('valor_TOTAL').asfloat)),14,'0',taDireita));
      //15 Indicador de cancelamento
      if qrarquivo.fieldbyname('cancelado').asinteger = 1 then
        write(txt,'S')
      else
        write(txt,'N');
      //16 Cancelamento de Acrescimo ou desconto no subtotal
      write(txt,'0000000000000');
      //17 Ordem de aplicacao do Desconto ou Acrescimo
      if qrarquivo.fieldbyname('valor_desconto').asfloat > 0 then
        write(txt,'D')
      else
         if qrarquivo.fieldbyname('valor_acrescimo').asfloat > 0 then
           write(txt,'A')
         else
           write(txt,' ');
      //18 Nome do cliente - 40
      Write(txt,texto_justifica(qrarquivo.fieldbyname('nome_consumidor').asstring,40,' ',taEsquerda));
      //18 CPF/CNPJ do cliente - 14
      Writeln(txt,texto_justifica(somenteNumero(qrarquivo.fieldbyname('cpf_consumidor').asstring),14,' ',taEsquerda));
      qrarquivo.next;
    end;
    // final do registro R04


    //Registro R05 - Detalhe do Cupom Fiscal (items)
    // filtrar a tabela de CUPOM_ITEM, CUPOM e ESTOQUE
    qrarquivo.close;
    qrarquivo.sql.clear;
    qrarquivo.sql.add('select cupom_item.*, cupom.numero, cupom.ccf, cupom.data, estoque.nome produto');
    qrarquivo.sql.add('from cupom_item, cupom, estoque');
    qrarquivo.sql.Add('where cupom_item.cod_cupom = cupom.codigo');
    qrarquivo.sql.add('and cupom_item.cod_produto = estoque.codigo');
    qrarquivo.sql.add('and cupom.data = :datai');
    qrarquivo.sql.add('and cupom.ecf = '''+sECF_Serial+'''');
    qrarquivo.sql.add('order by cupom.data, cupom.numero, cupom_item.item');
    qrarquivo.parambyname('datai').asdatetime := data;
    qrarquivo.open;
    qrarquivo.first;
    // gerar um arquivo r05 para cada item de cada cupom emitido
    while not qrarquivo.eof do
    begin
      //01 - Tipo
      write(txt,'R05');
      //02 - Numero de Fabricacao
      write(txt,texto_justifica(sECF_Serial,20,' ',taEsquerda));
      //03 MF Adicional
      write(txt,texto_justifica(sECF_MF_Adicional,1,' ',taEsquerda));
      //04 Modelo do ECF
      write(txt,texto_justifica(sECF_Modelo,20,' ',taEsquerda));
      //05 Numero do Usuario
      write(txt,texto_justifica(sECF_usuario,2,'0',taDireita));
      //06 COO
      write(txt,texto_justifica(qrarquivo.fieldbyname('numero').asstring,6,'0',taDireita));
      //07 CCF
      write(txt,texto_justifica(qrarquivo.fieldbyname('ccf').asstring,6,'0',taDireita));
      //08 Numero do Item
      write(txt,texto_justifica(qrarquivo.fieldbyname('item').asstring,3,'0',taDireita));
      //09 Codigo do Produto
      write(txt,texto_justifica(qrarquivo.fieldbyname('cod_produto').asstring,14,' ',taEsquerda));
      //10 Descricao do produto
      write(txt,texto_justifica(qrarquivo.fieldbyname('produto').asstring,100,' ',taEsquerda));
      //11 Quantidade - 7
      write(txt,texto_justifica(somenteNumero(formatfloat('##########0.000',qrarquivo.fieldbyname('qtde').asfloat)),7,'0',taDireita));
      //12 Descricao do produto
      write(txt,texto_justifica(qrarquivo.fieldbyname('unidade').asstring,3,' ',taEsquerda));
      //13 Valor Unitario - 8
      write(txt,texto_justifica(somenteNumero(formatfloat('##########0.000',qrarquivo.fieldbyname('valor_unitario').asfloat)),8,'0',taDireita));
      //14 Desconto - 8
      write(txt,texto_justifica(somenteNumero(formatfloat('##########0.00',qrarquivo.fieldbyname('valor_desconto').asfloat)),8,'0',taDireita));
      //15 Acrescimo - 8
      write(txt,texto_justifica(somenteNumero(formatfloat('##########0.00',qrarquivo.fieldbyname('valor_acrescimo').asfloat)),8,'0',taDireita));
      //16 Valor Total Liquido - 14
      write(txt,texto_justifica(somenteNumero(formatfloat('##########0.00',qrarquivo.fieldbyname('valor_total').asfloat)),14,'0',taDireita));
      //17 Totalizador Parcial (aliquota - conforme tabela);
      write(txt,texto_justifica(qrarquivo.fieldbyname('cod_totalizador').asstring,7,' ',taEsquerda));
      //18 Indicador de Cancelamento
      if qrarquivo.FieldByName('cancelado').asinteger = 1 then
        write(txt,'S')
      else
        write(txt,'N');
      //19 Quantidade cancelada (somente qdo houver cancelamento parcial do item) sempre zerado
      write(txt,'0000000');
      //20 Valor cancelado (somenete qdo houver cancelamento parcial do item) sempre zerado
      write(txt,'0000000000000');
      //21 Cancelamento do acrescimo no item
      write(txt,'0000000000000');
      //22 indicador de arredondamento ou truncamento - sempre truncamento
      write(txt,'T');
      //23 indicador de producao propria ou de terceiros
      write(txt,'T');
      //24 Quantidade de casas decimais na qtde
      write(txt,'3');
      //25 quantidade de casas decimais no valor unitario
      writeln(txt,'3');
      qrarquivo.next;
    end;
    // Finalizando o arquivo



    //R06 - Demais documentos emitidos pelo ECF
    // Filtrar a tabela NAO_FISCAL
    qrarquivo.close;
    qrarquivo.sql.clear;
    qrarquivo.sql.add('select * from nao_fiscal');
    qrarquivo.sql.add('where ecf = '''+sECF_Serial+'''');
    qrarquivo.sql.add('and data = :datai');
    qrarquivo.sql.add('order by data, codigo');
    qrarquivo.parambyname('datai').asdatetime := data;
    qrarquivo.open;
    qrarquivo.first;
    // gerar um registro r06 para cada comprovante emitido
    while not qrarquivo.eof do
    begin
      //01 - Tipo
      write(txt,'R06');
      //02 - Numero de Fabricacao
      write(txt,texto_justifica(sECF_Serial,20,' ',taEsquerda));
      //03 MF Adicional
      write(txt,texto_justifica(sECF_MF_Adicional,1,' ',taEsquerda));
      //04 Modelo do ECF
      write(txt,texto_justifica(sECF_Modelo,20,' ',taEsquerda));
      //05 Numero do Usuario
      write(txt,texto_justifica(sECF_usuario,2,'0',taDireita));
      //06 COO
      write(txt,texto_justifica(qrarquivo.fieldbyname('coo').asstring,6,'0',taDireita));
      //07 gnf
      write(txt,texto_justifica(qrarquivo.fieldbyname('gnf').asstring,6,'0',taDireita));
      //08 grg
      write(txt,texto_justifica(qrarquivo.fieldbyname('grg').asstring,6,'0',taDireita));
      //09 cdc - 4
      write(txt,texto_justifica(qrarquivo.fieldbyname('cdc').asstring,4,'0',taDireita));
      //10 denominacao - 2
      write(txt,texto_justifica(qrarquivo.fieldbyname('denominacao').asstring,2,' ',taEsquerda));
      //11 Data de Emissao - 8 - AAAAMMDD
      write(txt,troca_data(qrarquivo.fieldbyname('data').asstring));
      //12 Hora de Emissao - 6 - HHMMSS
      writeln(txt,texto_justifica(somenteNumero(qrarquivo.fieldbyname('hora').asstring),6,' ',tadireita));

      qrarquivo.next;
    end;

    // R07 - DETALHE DO CUPOM FISCAL E DO DOCUMENTO NAO FISCAL -> MEIOS DE PAGAMENTO
    // Filtrar a tabela CUPOM_FORMA e conjunto com CUPOM unido com NAO_FISCAL
    qrarquivo.close;
    qrarquivo.sql.clear;
    qrarquivo.sql.add('select');
    qrarquivo.sql.add('  COO,');
    qrarquivo.sql.add('  CCF,');
    qrarquivo.sql.add('  GNF,');
    qrarquivo.sql.add('  Forma,');
    qrarquivo.sql.add('  Valor');
    qrarquivo.sql.add('from');
    qrarquivo.sql.add('  (Select');
    qrarquivo.sql.add('     cupom.numero as COO,');
    qrarquivo.sql.add('     cupom.ccf as ccf,');
    qrarquivo.sql.add('     ''000000'' as gnf,');
    qrarquivo.sql.add('     cupom_forma.forma as Forma,');
    qrarquivo.sql.add('     cupom_forma.valor as Valor');
    qrarquivo.sql.add('   from');
    qrarquivo.sql.add('     cupom_forma, cupom');
    qrarquivo.sql.add('   where');
    qrarquivo.sql.add('     cupom_forma.cod_cupom = cupom.codigo and');
    qrarquivo.sql.add('     cupom.data = :datai and cupom.cancelado = 0 and');
    qrarquivo.sql.add('     cupom.ecf = '''+sECF_Serial+'''');
    qrarquivo.sql.add('   union');
    qrarquivo.sql.add('   Select');
    qrarquivo.sql.add('     nao_fiscal.coo as COO,');
    qrarquivo.sql.add('     ''000000'' as ccf,');
    qrarquivo.sql.add('     nao_fiscal.gnf as gnf,');
    qrarquivo.sql.add('     cupom_forma.forma as Forma,');
    qrarquivo.sql.add('     cupom_forma.valor as Valor');
    qrarquivo.sql.add('   from');
    qrarquivo.sql.add('     cupom_forma, nao_fiscal');
    qrarquivo.sql.add('   where');
    qrarquivo.sql.add('     cupom_forma.cod_cupom = nao_fiscal.codigo and');
    qrarquivo.sql.add('     nao_fiscal.data = :datai and');
    qrarquivo.sql.add('     nao_fiscal.ecf = '''+sECF_Serial+''') as TMP');
    qrarquivo.parambyname('datai').asdatetime := data;
    qrarquivo.open;
    qrarquivo.first;

    // gerar um registro r07 para cada meio de pagamento utilizado

    while not qrarquivo.eof do
    begin
      //01 - Tipo
      write(txt,'R07');
      //02 - Numero de Fabricacao
      write(txt,texto_justifica(sECF_Serial,20,' ',taEsquerda));
      //03 MF Adicional
      write(txt,texto_justifica(sECF_MF_Adicional,1,' ',taEsquerda));
      //04 Modelo do ECF
      write(txt,texto_justifica(sECF_Modelo,20,' ',taEsquerda));
      //05 Numero do Usuario
      write(txt,texto_justifica(sECF_usuario,2,'0',taDireita));
      //06 COO
      write(txt,texto_justifica(qrarquivo.fieldbyname('coo').asstring,6,'0',taDireita));
      //07 CCF
      write(txt,texto_justifica(qrarquivo.fieldbyname('CCF').asstring,6,'0',taDireita));
      //08 GNF
      write(txt,texto_justifica(qrarquivo.fieldbyname('GNF').asstring,6,'0',taDireita));
      //09 Meio de Pagamento - 15
      write(txt,texto_justifica(qrarquivo.fieldbyname('forma').asstring,15,' ',taEsquerda));
      //10 Valor Pago - 13
      write(txt,texto_justifica(somenteNumero(formatfloat('##########0.00',qrarquivo.fieldbyname('valor').asfloat)),13,'0',taDireita));
      //11 Indicador de estorno N ou S
      write(txt,'N');
      //12 Valor extornado
      writeln(txt,'0000000000000');
      qrarquivo.next;
    end;
    closefile(txt);

    // assinatura digital
    assinatura_digital(snome_arquivo);

    result := snome_arquivo;
  except
    result := 'ERRO';
  end;


end;

// -------------------------------------------------------------------------- //
procedure tfrmCaixa_Fechamento.Z_REsumo();
begin
  query.close;
  query.sql.clear;
  // venda bruta
  query.sql.add('select sum(cupom_item.valor_total) as venda_bruta,');
  // cancelamento icms
  query.sql.add('       (select sum(cupom_item.valor_total) from cupom_item, cupom where cupom_item.cod_cupom = cupom.codigo and cupom.data + cupom.hora >= :data and cupom_item.cancelado = 1) as cancelamento_icms,');
  // desconto icms
  query.sql.add('       ((select sum(cupom_item.valor_desconto) from cupom_item, cupom where cupom_item.cod_cupom = cupom.codigo and cupom.data + cupom.hora >= :data and cupom_item.cancelado = 0)');
  query.sql.add('       +(select sum(cupom.valor_desconto) from cupom where cupom.data + cupom.hora >= :data and cupom.cancelado = 0)) as desconto_icms,');
  // acrescimo icms
  query.sql.add('       ((select sum(cupom_item.valor_acrescimo) from cupom_item, cupom where cupom_item.cod_cupom = cupom.codigo and cupom.data + cupom.hora >= :data and cupom_item.cancelado = 0)');
  query.sql.add('       +(select sum(cupom.valor_acrescimo) from cupom where cupom.data + cupom.hora >= :data and cupom.cancelado = 0)) as acrescimo_icms');
  query.sql.add('from cupom_item, cupom where cupom_item.cod_cupom = cupom.codigo and cupom.data + cupom.hora >= :data and cupom.cod_vendedor = :codvendedor');
  query.parambyname('data').AsString := fechamento;
  query.parambyname('codvendedor').Value := icodigo_Usuario;
  query.open;


  // limpar o grid
 { grid_resumo.ClearRows;
  // Iniciar a alimentação
  // 1 - Venda Bruta Diária
    grid_resumo.AddRow(1);
    grid_resumo.Cell[0,grid_resumo.LastAddedRow].AsInteger := 1;
    grid_resumo.Cell[1,grid_resumo.LastAddedRow].AsString := 'Venda Bruta Diária';
    grid_resumo.Cell[2,grid_resumo.LastAddedRow].AsFloat := query.fieldbyname('venda_bruta').asfloat;
  // 2 - Cancelamento ICMS
    grid_resumo.AddRow(1);
    grid_resumo.Cell[0,grid_resumo.LastAddedRow].AsInteger := 2;
    grid_resumo.Cell[1,grid_resumo.LastAddedRow].AsString := 'Cancelamento ICMS';
    grid_resumo.Cell[2,grid_resumo.LastAddedRow].AsFloat := query.fieldbyname('cancelamento_icms').asfloat;
  // 3 - Desconto ICMS
    grid_resumo.AddRow(1);
    grid_resumo.Cell[0,grid_resumo.LastAddedRow].AsInteger := 3;
    grid_resumo.Cell[1,grid_resumo.LastAddedRow].AsString := 'Desconto ICMS';
    grid_resumo.Cell[2,grid_resumo.LastAddedRow].AsFloat := query.fieldbyname('desconto_icms').asfloat;
  // 4 - Total de ISSQN
    grid_resumo.AddRow(1);
    grid_resumo.Cell[0,grid_resumo.LastAddedRow].AsInteger := 4;
    grid_resumo.Cell[1,grid_resumo.LastAddedRow].AsString := 'Total de ISSQN';
    grid_resumo.Cell[2,grid_resumo.LastAddedRow].AsFloat := 0;
  // 5 - Cancelamento de ISSQN
    grid_resumo.AddRow(1);
    grid_resumo.Cell[0,grid_resumo.LastAddedRow].AsInteger := 5;
    grid_resumo.Cell[1,grid_resumo.LastAddedRow].AsString := 'Cancelamento ISSQN';
    grid_resumo.Cell[2,grid_resumo.LastAddedRow].AsFloat := 0;
  // 6 - Desconto de ISSQN
    grid_resumo.AddRow(1);
    grid_resumo.Cell[0,grid_resumo.LastAddedRow].AsInteger := 6;
    grid_resumo.Cell[1,grid_resumo.LastAddedRow].AsString := 'Desconto ISSQN';
    grid_resumo.Cell[2,grid_resumo.LastAddedRow].AsFloat := 0;
  // 7 - Venda Liquida
    grid_resumo.AddRow(1);
    grid_resumo.Cell[0,grid_resumo.LastAddedRow].AsInteger := 7;
    grid_resumo.Cell[1,grid_resumo.LastAddedRow].AsString := 'Venda Líquida';
    grid_resumo.Cell[2,grid_resumo.LastAddedRow].AsFloat :=
      query.fieldbyname('venda_bruta').asfloat -
      query.fieldbyname('cancelamento_icms').asfloat -
      query.fieldbyname('desconto_icms').asfloat;
  // 8 - Acréscimo ICMS
    grid_resumo.AddRow(1);
    grid_resumo.Cell[0,grid_resumo.LastAddedRow].AsInteger := 8;
    grid_resumo.Cell[1,grid_resumo.LastAddedRow].AsString := 'Acréscimo ICMS';
    grid_resumo.Cell[2,grid_resumo.LastAddedRow].AsFloat := query.fieldbyname('acrescimo_icms').asfloat;
  // 9 - Acréscimo ISSQN
    grid_resumo.AddRow(1);
    grid_resumo.Cell[0,grid_resumo.LastAddedRow].AsInteger := 9;
    grid_resumo.Cell[1,grid_resumo.LastAddedRow].AsString := 'Acréscimo ISSQN';
    grid_resumo.Cell[2,grid_resumo.LastAddedRow].AsFloat := 0;}
end;

// -------------------------------------------------------------------------- //
procedure tfrmCaixa_Fechamento.z_Forma();
begin
  // filtrar a tabela de formas de pagamento
{  query.close;
  query.sql.clear;
  query.sql.add('select cupom_forma.forma, sum(cupom_forma.valor) total');
  query.sql.add('from cupom_forma, cupom, nao_fiscal');
  query.sql.add('where (cupom_forma.cod_cupom = cupom.codigo');
  query.sql.add('   or cupom_forma.cod_cupom = nao_fiscal.codigo)');
  query.sql.add('and (cupom.data = :data or nao_fiscal.data = :data) and cupom.cancelado = 0');
  query.SQL.add('group by cupom_forma.forma');
  }
  //solivan 09/09/2012
{
  query.close;
  query.sql.clear;
  query.sql.add('select');
  query.sql.add('  Forma,');
  query.sql.add('  sum(Valor) as total');
  query.sql.add('from');
  query.sql.add('  (Select');
  query.sql.add('     cupom_forma.forma as Forma,');
  query.sql.add('     cupom_forma.valor as Valor');
  query.sql.add('   from');
  query.sql.add('     cupom_forma, cupom');
  query.sql.add('   where');
  query.sql.add('     cupom_forma.cod_cupom = cupom.codigo and');
  query.sql.add('     cupom.ecf = '''+sECF_Serial+''' and');
  query.sql.add('     cupom.data = :data and cupom.cancelado = 0');
  query.sql.add('     and cupom.cod_vendedor = :codvendedor');
  query.sql.add('   union');
  query.sql.add('   Select');
  query.sql.add('     cupom_forma.forma as Forma,');
  query.sql.add('     cupom_forma.valor as Valor');
  query.sql.add('   from');
  query.sql.add('     cupom_forma, nao_fiscal');
  query.sql.add('   where');
  query.sql.add('     cupom_forma.cod_cupom = nao_fiscal.codigo and');
  query.sql.add('     nao_fiscal.ecf = '''+sECF_Serial+''' and');
  query.sql.add('     nao_fiscal.codvendedor = :codvendedor and');
  query.sql.add('     nao_fiscal.data = :data) as TMP');
  query.sql.add('   group by Forma');
  query.ParamByName('data').asdatetime := ed_data.Date;
  query.ParamByName('codvendedor').Value := icodigo_Usuario;
  query.open;
}

  query.close;
  query.sql.clear;
  query.sql.add('  select');
  query.sql.add('      Forma,');
  query.sql.add('      sum(Valor) as total');
  query.sql.add('    from');
  query.sql.add('      (Select');
  query.sql.add('         cupom_forma.forma as Forma,');
  query.sql.add('         cupom_forma.valor as Valor');
  query.sql.add('       from');
  query.sql.add('         cupom_forma, cupom');
  query.sql.add('       where');
  query.sql.add('         cupom_forma.cod_cupom = cupom.codigo and');
  query.sql.add('         cupom.DATA + cupom.hora >= :data and');
  query.sql.add('         cupom.COD_VENDEDOR = :codvendedor');
  query.sql.add('         )');
  query.sql.add('       group by Forma');
  query.ParamByName('data').AsString := fechamento;
  query.ParamByName('codvendedor').Value := icodigo_Usuario;
  query.open;

  // limpar o grid
  {grid_forma.ClearRows;
  // rodar a tabela para alimentar o grid
  while not query.eof do
  begin
    grid_forma.AddRow(1);
    grid_forma.Cell[0,grid_forma.LastAddedRow].AsInteger := grid_forma.LastAddedRow + 1;
    grid_forma.Cell[1,grid_forma.LastAddedRow].AsString := query.fieldbyname('forma').asstring;
    grid_forma.Cell[2,grid_forma.LastAddedRow].AsFloat := query.fieldbyname('total').asfloat;
    query.Next;
  end;  }
end;

// -------------------------------------------------------------------------- //
procedure tfrmCaixa_Fechamento.z_aliquota();
begin
  // filtrar a tabela de itens do cupom agrupando por aliquota
  query.close;
  query.sql.clear;
  query.sql.add('select cupom_item.cst, cupom_item.aliquota, sum(cupom_item.valor_total) total');
  query.sql.add('from cupom_item, cupom');
  query.sql.add('where cupom_item.cod_cupom = cupom.codigo');
  query.sql.add('and cupom.data + cupom.hora >= :data and cupom.cancelado = 0');
  query.sql.add('and cupom.cod_vendedor = :codvendedor');
  query.sql.add('group by cupom_item.cst, cupom_item.aliquota');
  query.sql.add('order by cupom_item.cst, cupom_item.aliquota');
  query.ParamByName('data').AsString := fechamento;
  query.ParamByName('codvendedor').Value := icodigo_Usuario;
  query.open;
  query.first;
  // limpar o grid
 { grid_aliquota.ClearRows;
  // rodar a tabela para alimentar o grid
  while not query.eof do
  begin
    grid_aliquota.AddRow(1);
    grid_aliquota.Cell[0,grid_aliquota.LastAddedRow].AsInteger := grid_aliquota.LastAddedRow + 1;
    grid_aliquota.Cell[1,grid_aliquota.LastAddedRow].AsString := Retorna_aliquota(
                                                           query.fieldbyname('cst').asstring,
                                                           query.fieldbyname('aliquota').asfloat);
    grid_aliquota.Cell[2,grid_aliquota.LastAddedRow].AsFloat := query.fieldbyname('total').asfloat;
    query.Next;
  end;}
end;

// -------------------------------------------------------------------------- //
procedure tfrmCaixa_Fechamento.z_outros();
begin
  // filtrar a tabela de documentos naos fiscais agrupando por indice e descricao
  query.close;
  query.sql.clear;
  query.sql.add('select indice, descricao, sum(valor) total');
  query.sql.add('from nao_fiscal');
  query.sql.add('where data + hora >= :data');
  query.sql.add('and codvendedor = :codvendedor');
  query.sql.add('group by indice, descricao');
  query.sql.add('order by indice');
  query.parambyname('data').AsString := fechamento;
  query.parambyname('codvendedor').Value := icodigo_Usuario;
  query.open;
  // limpara o grid
  {grid_outros.ClearRows;
  // rodar a tabela para alimentar o grid
  while not query.eof do
  begin
    grid_outros.AddRow(1);
    grid_outros.Cell[0,grid_outros.LastAddedRow].Asstring :=
      zerar(query.fieldbyname('indice').asstring,2);
    grid_outros.Cell[1,grid_outros.LastAddedRow].AsString :=query.fieldbyname('descricao').asstring;
    grid_outros.Cell[2,grid_outros.LastAddedRow].AsFloat := query.fieldbyname('total').asfloat;
    query.Next;
  end; }
end;

// -------------------------------------------------------------------------- //
procedure TfrmCaixa_Fechamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.TipoImpressora := TipoImp;
  action := cafree;
end;

procedure TfrmCaixa_Fechamento.FormCreate(Sender: TObject);
begin
  Editar := False;
end;

// -------------------------------------------------------------------------- //
procedure TfrmCaixa_Fechamento.bt_cancelarClick(Sender: TObject);
begin
  close;
end;

// -------------------------------------------------------------------------- //
procedure TfrmCaixa_Fechamento.grid_resumoCellFormating(Sender: TObject;
  ACol, ARow: Integer; var TextColor: TColor; var FontStyle: TFontStyles;
  CellState: TCellState);
begin
 
end;

// -------------------------------------------------------------------------- //
procedure TfrmCaixa_Fechamento.FormShow(Sender: TObject);
var i : integer;
begin
  TipoImp := frmPrincipal.TipoImpressora;
  frmPrincipal.TipoImpressora := NaoFiscal;

  qrEncerrante.close;
  qrEncerrante.sql.clear;
  qrEncerrante.sql.add('select * from Config Where codigo=0');
  qrEncerrante.Open;
  qrEncerrante.First;
  fechamento := formatdatetime('yyyy-mm-dd hh:mm:ss', qrEncerrante.fieldbyname('fechamento').AsDateTime);

  ed_data.Date := dData_Movimento;

  If bServidor_Conexao then
  begin  //Pre Vendas Em Aberto
    qrPre_Venda.CLOSE;
    qrPre_Venda.SQL.CLEAR;
    qrPre_Venda.SQL.ADD('select');
    qrPre_Venda.SQL.ADD('  c000074.*,');
    qrPre_Venda.SQL.ADD('  c000007.Nome Cliente,');
    qrPre_Venda.SQL.ADD('  c000008.Nome Vendedor');
    qrPre_Venda.SQL.ADD('from');
    qrPre_Venda.SQL.ADD('  c000074, c000007, c000008');
    qrPre_Venda.SQL.ADD('where');
    qrPre_Venda.SQL.ADD('  c000074.codcliente = c000007.codigo and');
    qrPre_Venda.SQL.ADD('  c000074.codvendedor = c000008.codigo and');
    qrPre_Venda.SQL.ADD('  c000074.tipo <> 9 and');
    qrPre_Venda.sql.add('  c000074.situacao = 1');
    qrpre_venda.sql.add('  and c000074.data <= :datam'); //09/09
    qrPre_Venda.sql.add('ORDER BY c000074.CODIGO');
    qrpre_venda.ParamByName('datam').asdatetime := ed_data.date - 1;
    qrPre_Venda.OPEN;

                            //10/09
  
  end;

  // mesas
  qrMesa.close;
  qrMesa.sql.clear;
  qrMesa.sql.add('select sum(r000002.total) soma,');
  qrMesa.sql.add('r000001.codigo, r000001.data, r000001.hora');
  qrMesa.sql.add('from r000001, r000002');
  qrMesa.sql.add('where r000001.codigo = r000002.cod_mesa');
  qrMesa.sql.add('group by r000001.codigo, r000001.data, r000001.hora');
  qrMesa.sql.add('order by r000001.codigo');
  qrMesa.open;

 



  // Abastecimentos
  if sRamo_Tipo = '3' then
  begin
    qrabastecimento.close;
    qrabastecimento.sql.clear;
    qrabastecimento.sql.add('select posto_abastecimento.*, estoque.nome produto');
    qrabastecimento.sql.add('from posto_abastecimento, estoque');
    qrabastecimento.sql.add('where posto_abastecimento.cod_produto = estoque.codigo');
    qrabastecimento.sql.add('and posto_abastecimento.situacao = 0');
    qrabastecimento.sql.add('order by posto_abastecimento.codigo');
    qrabastecimento.Open;
    qrabastecimento.First;
    while not qrAbastecimento.Eof do
    begin
      
      qrAbastecimento.Next;
    end;
  end;


  ed_operador.Text := sNome_Operador;
  ed_ecf.Text := sECF_Serial;
  // resumo da reducao z
  Z_Resumo;
  // resumo por forma de pagamento
  z_Forma;
  // resumo por aliquota
  z_aliquota;
  // resumo de outros documentos
  z_outros;

  z_fechamento;

  // davs

        qrdav.close;
        qrdav.sql.clear;
        qrdav.sql.add('select * from DAV');
        qrdav.sql.add('where ECF = '''+sECF_Serial+'''');
        qrdav.sql.add('and data = :datai');
        qrdav.sql.add('order by numero, data');
        qrdav.parambyname('datai').asdatetime := ed_data.date;
        qrdav.open;

       

       { if qrconfig.fieldbyname('VIS_F_CAIXA').asstring = '1' then
        Begin
         AdvGlowButton2.Visible := true;
         AdvGlowButton4.Visible := true;
        End;}

   Begin
     frmmodulo.query.close;
     frmmodulo.query.sql.clear;
     frmmodulo.query.sql.add('select * from adm');
     frmmodulo.query.sql.add('where codigo < ' + QuotedStr('100'));
     frmmodulo.query.sql.add('order by codigo');
     frmmodulo.query.open;

     Combo_Usuario.Items.Clear;

   while not frmmodulo.query.Eof do
    begin
     IF frmmodulo.query.Fieldbyname('INFO1').AsString <> 'DELPHOS_1' THEN
     Combo_Usuario.Items.Add(frmmodulo.query.Fieldbyname('INFO1').AsString);
     frmmodulo.query.Next;
     Application.ProcessMessages;
    end;
   End;


end;

procedure TfrmCaixa_Fechamento.frxDesigner1GetTemplateList(List: TStrings);
begin

end;

// -------------------------------------------------------------------------- //
procedure TfrmCaixa_Fechamento.bt_okClick(Sender: TObject);
var
  scodRZ:string;
  i : integer;
  pTexto : PAnsiChar;
  iMes : integer;
  brefaz_dav, brefaz_pre_venda, brefaz_abastecimento, brefaz_encerrante : boolean;
  dData_movto : tdatetime;
  scod_cupom : string;

begin

    if application.messagebox(pwidechar('Atenção!'+#13+
    'Após o fechamento do caixa não será mais possível'+
    ' efetuar venda nesta data!'+#13+
    'Deseja prosseguir?'),
    'Atenção',mb_yesno+mb_iconwarning+MB_DEFBUTTON2) = idyes then
    begin

    Begin
      AdvGlowButton2.Click;
      AdvGlowButton3.Click;
      End;

    Begin
     Application.MessageBox('Procedimento concluído com sucesso!','Aviso',mb_ok+MB_ICONINFORMATION);
     CLOSE;
     FRMVENDA.CLOSE;
     FRMPRINCIPAL.CLOSE;
     End;
  end;
end;

//end;

// -------------------------------------------------------------------------- //
procedure TfrmCaixa_Fechamento.Cancelar1Click(Sender: TObject);
begin
  close;
end;


procedure TfrmCaixa_Fechamento.ed_dataChange(Sender: TObject);
begin

end;

// -------------------------------------------------------------------------- //
procedure TfrmCaixa_Fechamento.Button1Click(Sender: TObject);
var i : integer;
begin
    


end;

// -------------------------------------------------------------------------- //
procedure TfrmCaixa_Fechamento.bt_cupom_encerranteClick(Sender: TObject);
var sCod_Cupom : string;
i : integer;
begin
  // verificar se tem diferenca de qtde de litros nos encerrantes em relacao
  // as qtde vendidas nos cupons

  qrEncerrante.close;
  qrEncerrante.sql.clear;
  qrEncerrante.sql.add('select posto_bico_movimento.*, posto_bico.*');
  qrEncerrante.sql.add('from posto_bico_movimento, posto_bico');
  qrEncerrante.sql.add('where data = :data');
  qrEncerrante.SQL.ADD('and posto_bico_movimento.cod_bico = posto_bico.codigo');
  qrEncerrante.sql.add('order by posto_bico.bomba, posto_bico.bico');
  qrEncerrante.parambyname('data').asdatetime := dData_Sistema;
  qrEncerrante.open;

  if qrEncerrante.recordcount > 0 then
  begin


    if ( qrencerrante.fieldbyname('EF').asfloat -
         qrencerrante.fieldbyname('EI').asfloat -
         qrencerrante.fieldbyname('volume').asfloat) > 0 then
    begin
      // imprimir o cupom com a diferenca
        bLanca_Abastecimento := true;

        with frmVenda do
        begin
          if not Abre_Venda then
          begin
            // Caso o comando de abertura de venda retornou false, abortar o processo;
            // fazer o cancelamento apos emissao da reducao Z!

            application.MessageBox('Erro na abertura do cupom!',
                                   'Atenção',mb_ok+MB_ICONWARNING);
            exit;
          end
          else
          begin

              qrabastecimento.close;
              qrabastecimento.sql.clear;
              qrabastecimento.sql.add('select posto_bico.*, estoque.nome produto, estoque.preco_venda,');
              qrabastecimento.sql.add('estoque.unidade,estoque.cst,estoque.aliquota,estoque.cod_barra');
              qrabastecimento.sql.add('from posto_bico, estoque');
              qrabastecimento.sql.add('where posto_bico.cod_produto = estoque.codigo');
              qrabastecimento.sql.add('and posto_bico.codigo = '+qrencerrante.fieldbyname('cod_bico').asstring);
              qrabastecimento.Open;


              qrabastecimento.first;
              while not qrabastecimento.eof do
              begin
                sProd_nome := qrabastecimento.fieldbyname('produto').asstring;
                sProd_unidade := qrabastecimento.fieldbyname('unidade').asstring;
                sProd_CST := qrabastecimento.fieldbyname('cst').asstring;
                rProd_aliquota := qrabastecimento.fieldbyname('aliquota').asfloat;
                iProd_codigo := qrabastecimento.fieldbyname('cod_produto').asinteger;
                sProd_barra := qrabastecimento.fieldbyname('cod_barra').asstring;
                rProd_qtde    := ( qrencerrante.fieldbyname('EF').asfloat - qrencerrante.fieldbyname('EI').asfloat - qrencerrante.fieldbyname('volume').asfloat);
                rProd_preco   := qrabastecimento.fieldbyname('preco_venda').asfloat;
                rProd_total := ( qrencerrante.fieldbyname('EF').asfloat - qrencerrante.fieldbyname('EI').asfloat - qrencerrante.fieldbyname('volume').asfloat) *  qrabastecimento.fieldbyname('preco_venda').asfloat;
                rProd_desconto := 0;
                rProd_acrescimo := 0;
                // registrar o item
                Registra_Item;
                Application.ProcessMessages;
                qrabastecimento.next;
              end;
              sPosto_rodape := //'Tanque'+qrabastecimento.fieldbyname('tanque').asstring+
                               'Bomba'+qrabastecimento.fieldbyname('bomba').asstring+
                               'Bico'+qrabastecimento.fieldbyname('bico').asstring+
                               'EI000000'+
                               'EF000000';
             // venda foi feito por uma pre-venda
             //finalizar o cupom e depois cancelar

             if frmPrincipal.TipoImpressora = Fiscal then
               sMsg := cECF_Fecha_Cupom_Resumido(iECF_Modelo,'DINHEIRO',sPAF_MD5+sPosto_rodape, rTotal_Venda)
             else
               sMsg := Imp_Fecha_Cupom_Resumido(sPortaNaoFiscal,'DINHEIRO',sPosto_rodape, rTotal_Venda);

             if sMsg = 'OK' then
             begin
              sCod_Cupom := codifica_cupom;
              with frmmodulo do
              begin
                // lancamento do cupom no banco de dados

                spCupom.close;
                spCupom.ParamByName('codigo').asstring         := sCod_Cupom;
                spCupom.ParamByName('numero').asstring         := sNumero_Cupom;
                spCupom.ParamByName('ccf').asstring            := sNumero_contador_cupom;
                spCupom.ParamByName('ECF').AsString            := sECF_Serial;
                spCupom.ParamByName('data').asdate             := dData_Sistema;
                spCupom.ParamByName('hora').AsTime             := hHora_Cupom;
                spCupom.ParamByName('qtde_item').asinteger     := iTotal_Itens;
                spCupom.ParamByName('valor_produto').asfloat   := rTotal_Venda;
                spCupom.ParambyName('Valor_Desconto').asfloat  := rTotal_Desconto;
                spCupom.ParambyName('Valor_Acrescimo').asfloat := rTotal_Acrescimo;
                spCupom.ParamByName('valor_total').asfloat     := rTotal_Venda;
                spCupom.ParamByName('valor_pago').asfloat      := rTotal_Venda;
                spCupom.ParamByName('valor_troco').asfloat     := 0;
                spCupom.ParamByName('cod_cliente').Clear;
                spCupom.ParamByName('cancelado').asinteger     := 0;
                spcupom.parambyname('cpf_consumidor').asstring := sConsumidor_CPF;
                spcupom.ParamByName('nome_consumidor').asstring := copy(sConsumidor_Nome,1,40);
                spcupom.parambyname('cod_caixa').asinteger := iNumCaixa;
                spcupom.parambyname('codvendedor').asinteger := icodigo_Usuario;                
                spCupom.ParamByName('ecf_caixa').asstring := Copy(sECF_Caixa,1,3);                
                spCupom.Prepare;
                spCupom.Execute;


                query.close;
                query.sql.clear;
                query.sql.add('update posto_bico_movimento set volume = volume + :qtde');
                query.sql.add('where cod_bico = '+qrencerrante.fieldbyname('cod_bico').asstring);
                query.ParamByName('qtde').asfloat := ( qrencerrante.fieldbyname('EF').asfloat - qrencerrante.fieldbyname('EI').asfloat - qrencerrante.fieldbyname('volume').asfloat);
                query.ExecSQL;


                // lancamento dos items do cupom no banco de dados
                for i := 0 to grid.RowCount - 1 do
                begin
                  // situacoes
                  // 1 - Venda do Item
                  // 3 - Cancelamento do Item
                  // 4 - Desconto no Item
                  // 5 - Acrescimo no Item

                  if grid.Cell[1,i].asinteger = 1 then
                  begin
                    spCupom_Item.close;
                    spCupom_Item.ParamByName('codigo').AsString := codifica_item(grid.Cell[2,i].asinteger);
                    spCupom_Item.parambyname('cod_cupom').asstring := sCod_Cupom;
                    spCupom_Item.parambyname('item').asinteger := grid.cell[2,i].asinteger;
                    spCupom_Item.ParamByName('cod_produto').asinteger := grid.cell[3,i].asinteger;
                    spCupom_Item.parambyname('unidade').asstring := grid.cell[12,i].asstring;
                    spCupom_Item.parambyname('qtde').asfloat := grid.cell[5,i].asfloat;
                    spCupom_Item.parambyname('valor_unitario').asfloat := grid.cell[6,i].asfloat;
                    spCupom_Item.parambyname('valor_subtotal').asfloat := grid.cell[5,i].asfloat *
                                                                          grid.cell[6,i].asfloat;
                    spCupom_Item.parambyname('valor_desconto').asfloat := grid.cell[7,i].asfloat;
                    spCupom_Item.parambyname('valor_acrescimo').asfloat := grid.cell[8,i].asfloat;
                    spCupom_Item.parambyname('valor_total').asfloat := grid.cell[9,i].asfloat;
                    spCupom_Item.parambyname('cst').asstring := grid.cell[11,i].asstring;
                    spCupom_Item.parambyname('aliquota').asfloat := grid.cell[10,i].asfloat;
                    spCupom_Item.parambyname('cancelado').asinteger := grid.cell[13,i].asinteger;
                    spCupom_Item.parambyname('tamanho').AsString := grid.cell[14,i].AsString;
                    spCupom_Item.parambyname('cor').AsString := grid.cell[15,i].AsString;

                    if (grid.cell[11,i].asstring = '060') or
                       (grid.cell[11,i].asstring = '010') or
                       (grid.cell[11,i].asstring = '070') then
                         spCupom_item.ParamByName('cod_totalizador').asstring := 'F1'
                    else
                    if (grid.cell[11,i].asstring = '040') or
                       (grid.cell[11,i].asstring = '030') then
                         spCupom_item.ParamByName('cod_totalizador').asstring := 'I1'
                    else
                    if (grid.cell[11,i].asstring = '041') or
                       (grid.cell[11,i].asstring = '050') or
                       (grid.cell[11,i].asstring = '051') or
                       (grid.cell[11,i].asstring = '090') then
                         spCupom_item.ParamByName('cod_totalizador').asstring := 'N1'
                    else
                    if (grid.cell[11,i].asstring = 'ISS') then
                       spCupom_item.ParamByName('cod_totalizador').asstring := '01S'+
                         Retorna_aliquota(grid.cell[11,i].asstring,grid.cell[10,i].asfloat)
                    else
                      spCupom_item.ParamByName('cod_totalizador').asstring :=
                        retorna_codigo_aliquota(grid.cell[10,i].asfloat);


                    spCupom_Item.Prepare;
                    spCupom_Item.Execute;
                  end;
                end;
                // lancar a forma de pagamento - DINHEIRO
                spCupom_Forma.close;
                spCupom_Forma.ParamByName('codigo').asstring     := codifica_forma(1);
                spCupom_Forma.ParamByName('cod_cupom').asstring  := sCod_Cupom;
                spCupom_Forma.ParamByName('forma').asstring      := 'DINHEIRO';
                spCupom_Forma.ParamByName('valor').asfloat       := rTotal_Venda;
                spCupom_Forma.ParamByName('prestacao').asinteger := 1;
                spCupom_Forma.ParamByName('tipo').asstring       := 'CUPOM FISCAL';
                spCupom_Forma.Prepare;
                spCupom_Forma.Execute;




              end;
              // atualizar o totalizar
             if frmPrincipal.TipoImpressora = Fiscal then
                REPEAT
                   SMSG := cECF_Grande_Total(iECF_Modelo);
                   iF Smsg = 'ERRO' then
                   begin
                     if application.messagebox(pwidechar('Erro ao verificar totalizador do ECF!'+#13+
                                                         'Mensagem: '+sMsg+#13+
                                                         'Deseja tentar outra vez?'),'Erro',mb_yesno+
                                                         MB_ICONERROR) = idno then
                     break;

                   end
                   else
                     atualiza_totalizador(SMSG);
                UNTIL SmSG <> 'ERRO';


              // limpar o form de venda
             if bBusca_foto_produto then
             begin
//               img_shape.Visible := false;
               img_produto.Picture := nil;
//               img_fundo.Visible := false;                
             end;
             bVenda := false;
             Limpa_controles;
            end;
          end; // not abre venda
        end; // with frmvenda

    end;
  end;



end;

procedure TfrmCaixa_Fechamento.bt_fechamento01Click(Sender: TObject);
begin
  Pagecontrol1.ActivePageIndex := 8;
end;

procedure TfrmCaixa_Fechamento.bt_fechamento02Click(Sender: TObject);
begin
  Pagecontrol1.ActivePageIndex := 7;
end;

procedure TfrmCaixa_Fechamento.bt_fechamento03Click(Sender: TObject);
begin
  Pagecontrol1.ActivePageIndex := 5;
end;

procedure TfrmCaixa_Fechamento.bt_fechamento04Click(Sender: TObject);
begin
  Pagecontrol1.ActivePageIndex := 4;
end;

procedure TfrmCaixa_Fechamento.bt_fechamento05Click(Sender: TObject);
begin
  Pagecontrol1.ActivePageIndex := 3;
end;

procedure TfrmCaixa_Fechamento.bt_fechamento06Click(Sender: TObject);
begin
  Pagecontrol1.ActivePageIndex := 2;
end;

procedure TfrmCaixa_Fechamento.bt_fechamento07Click(Sender: TObject);
begin
  Pagecontrol1.ActivePageIndex := 1;
end;

procedure TfrmCaixa_Fechamento.bt_fechamento08Click(Sender: TObject);
begin
  Pagecontrol1.ActivePageIndex := 0;
end;

// -------------------------------------------------------------------------- //
procedure TfrmCaixa_Fechamento.VendaBruta1Click(Sender: TObject);
begin
end;

// -------------------------------------------------------------------------- //
procedure TfrmCaixa_Fechamento.z_fechamento;
var
  codOperador:string;
  dValor, dSangria, dSuprimento, dTotal, dTroco, dDinheiro:double;
begin
  dValor := 0;  dSangria := 0;  dSuprimento := 0;  dTotal := 0; dDinheiro:=0; dTroco := 0;


  qrFechamento.close;
  qrFechamento.sql.clear;
  qrFechamento.sql.add('select Sum(Valor_Troco) as Troco');
  qrFechamento.sql.add('from cupom');
  qrFechamento.sql.add('Where cupom.DATA + cupom.Hora >= :data');
  qrFechamento.Params.ParamByName('data').asstring := fechamento;
  qrFechamento.Open;
 
end;

end.





