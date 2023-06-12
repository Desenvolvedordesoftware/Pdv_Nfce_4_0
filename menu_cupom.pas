unit menu_cupom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons, NxColumnClasses,
  NxColumns, NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid,
  DB, DBAccess, Menus, AdvMenus, ComCtrls, AdvMetroButton, AdvSmoothPanel, AdvSmoothExpanderPanel, AdvGlowButton, Uni,
  JvExMask, JvToolEdit, MemDS, principal, frxClass, frxDBSet, acPNG,
  cyBaseSpeedButton, cySpeedButton, NxDBGrid, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls;

type
  TfrmCupom_Menu = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ed_data: TJvDateEdit;
    Label2: TLabel;
    ed_ecf: TEdit;
    Panel2: TPanel;
    Bevel2: TBevel;
    BitBtn11: TBitBtn;
    bt_fechar1: TBitBtn;
  //  query: TIBCQuery;
    pop_fechamento: TAdvPopupMenu;
    Cancelar1: TMenuItem;
    Visualizar1: TMenuItem;
    BitBtn1: TAdvGlowButton;
    bt_fechar: TAdvGlowButton;
    AdvSmoothExpanderPanel1: TAdvSmoothExpanderPanel;
    Label53: TLabel;
    AdvMetroButton1: TAdvMetroButton;
    Panel3: TPanel;
    Panel4: TPanel;
    qrcupom: TUniQuery;
    query: TUniQuery;
    AdvGlowButton1: TAdvGlowButton;
    Reimpressao_venda: TAdvGlowButton;
    frxCupom_itens: TfrxDBDataset;
    UniQuery1: TUniQuery;
    frxDB: TfrxDBDataset;
    Frx_ImpressaoVenda1: TfrxReport;
    frxEmitente: TfrxDBDataset;
    bt_cancelar_venda: TAdvGlowButton;
    can_venda: TUniQuery;
    Qremitente: TUniQuery;
    QremitenteCODIGO: TStringField;
    QremitenteNOME: TStringField;
    QremitenteFANTASIA: TStringField;
    QremitenteENDERECO: TStringField;
    QremitenteBAIRRO: TStringField;
    QremitenteCIDADE: TStringField;
    QremitenteUF: TStringField;
    QremitenteCEP: TStringField;
    QremitenteTELEFONE: TStringField;
    QremitenteCNPJ: TStringField;
    QremitenteIE: TStringField;
    QremitenteEMAIL: TStringField;
    QremitenteHOMEPAGE: TStringField;
    QremitenteRESPONSAVEL: TStringField;
    QremitenteCELULAR: TStringField;
    QremitenteLOGO: TBlobField;
    QremitenteFAX: TStringField;
    QremitenteNUMERO: TStringField;
    QremitenteCOMPLEMENTO: TStringField;
    QremitenteCONTRIBUINTE_IPI: TStringField;
    QremitenteSUBSTITUTO_TRIBUTARIO: TStringField;
    QremitenteCOMENTARIOS: TStringField;
    QremitenteDATAHORA_INICIAL: TDateTimeField;
    QremitenteDATAHORA_FINAL: TDateTimeField;
    QremitenteDATA_INVENTARIO: TDateTimeField;
    QremitenteESTOQUE: TFloatField;
    QremitenteVALOR: TFloatField;
    QremitenteCONHECIMENTO: TIntegerField;
    QremitenteCPF: TStringField;
    QremitenteRG: TStringField;
    QremitenteDIA_VENCIMENTO_CHAVE: TStringField;
    QremitenteINSC_MUNICIPAL: TStringField;
    QremitenteDATA_ABERTURA: TDateTimeField;
    QremitenteCOD_MUNICIPIO_IBGE: TStringField;
    QremitenteIBGE: TStringField;
    QremitenteEMAIL_FINANCEIRO: TStringField;
    qrobs: TUniQuery;
    frxDBDobs: TfrxDBDataset;
    Query3: TUniQuery;
    frxDBDclient: TfrxDBDataset;
    Frx_ImpressaoVenda: TfrxReport;
    frxDBDCLIENT1: TfrxDBDataset;
    Queryclie2: TUniQuery;
    Frx_ImpressaoVendaA4: TfrxReport;
    frxDBVendedor: TfrxDBDataset;
    qr_vendedores: TUniQuery;
    Frx_ImpressaoVendaCancelada: TfrxReport;
    Label5: TLabel;
    qrSup_sag: TUniQuery;
    qrimp_sang_sup: TUniQuery;
    DB_imp_sang_sup: TfrxDBDataset;
    frximpressao_sup_sang: TfrxReport;
    grid_cupom: TNextGrid;
    NxTextColumn4: TNxTextColumn;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    NxNumberColumn1: TNxNumberColumn;
    NxTextColumn3: TNxTextColumn;
    NxNumberColumn2: TNxNumberColumn;
    btrempressao_NFCe: TcySpeedButton;
    Label9: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    QRITEM: TUniQuery;
    DSSup_sag: TDataSource;
    grid_sang_sup: TDBGrid;
    edcodcoo: TDBEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    btImprimir_sup_sang: TAdvGlowButton;
    Frx_ImpressaoCompPix: TfrxReport;
    procedure bt_fechar1Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure grid_cupomCellFormating(Sender: TObject; ACol, ARow: Integer;
      var TextColor: TColor; var FontStyle: TFontStyles;
      CellState: TCellState);
    procedure MenuFiscal1Click(Sender: TObject);
    procedure AdvMetroButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure Reimpressao_vendaClick(Sender: TObject);
    procedure bt_cancelar_vendaClick(Sender: TObject);
    procedure btImprimir_sup_sangClick(Sender: TObject);
    procedure grid_Sang_SupCellFormating(Sender: TObject; ACol, ARow: Integer;
      var TextColor: TColor; var FontStyle: TFontStyles; CellState: TCellState);
    procedure btrempressao_NFCeClick(Sender: TObject);
  private
    { Private declarations }
    oldTipoImpressora: TImpressora;
    procedure AbreDados;
  public
    { Public declarations }
  end;

var
  frmCupom_Menu: TfrmCupom_Menu;

implementation

uses funcoes, modulo, cupom_impressao, menu_fiscal, senha_supervisor,
Justifica_Canc_cupom, venda, frmNFCEs;

{$R *.dfm}

procedure TfrmCupom_Menu.bt_cancelar_vendaClick(Sender: TObject);
var
  //grid_cupom.Cell: string;
  i: integer;

begin
 if not bVenda then
  begin
  frmsenha_supervisor := tfrmsenha_supervisor.create(self);
  frmsenha_supervisor.showmodal;
  if not bSupervisor_autenticado then
     Exit;
//////////////////////////////////////////////////////////////////
    if grid_cupom.RowCount = 0 then exit;
     if grid_cupom.SelectedRow < 0 then
  begin
    application.messagebox('Favor selecionar uma venda!','Erro',mb_ok+mb_iconerror);
    exit;
  end;
          begin
          BlockInput(false);
          if application.messagebox
            (pwidechar('Tem certeza que deseja cancelar esta venda? Esta execu��o n�o tera como desfazela!!!' + #13 ), 'Aviso', mb_yesno + MB_ICONWARNING) = idno then
            exit;
          end;

          {Begin
          frmJustifica_Canc_cupom := tfrmJustifica_Canc_cupom.create(self);
          frmJustifica_Canc_cupom.showmodal;
         End;}

    begin
      UniQuery1.close;
      UniQuery1.sql.clear;
      UniQuery1.sql.add('select CUPOM.*, CUPOM_FORMA.*');
      UniQuery1.sql.add('FROM CUPOM, CUPOM_FORMA');
      UniQuery1.sql.add('where ');
      UniQuery1.sql.add('cupom.codigo = CUPOM_FORMA.cod_cupom');
      UniQuery1.sql.add('and CUPOM_FORMA.cod_cupom = ''' +grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
      UniQuery1.ExecSQL;
      //UniQuery1.open;

      query.close;
      query.sql.clear;
      query.sql.add('select item.*, item.produto');
      query.sql.add('from cupom_item item');
      query.sql.add('where ');
      query.sql.add('item.cod_cupom = ''' +grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
      query.ExecSQL;
      //query.open;

      Query3.close;
      Query3.sql.clear;
      Query3.sql.add('select CLI.NOME, CLI.cpf, CLI.CODIGO, CLI.ENDERECO, CLI.BAIRRO ');
      Query3.sql.add('from cupom CUP, CLIENTE CLI');
      Query3.sql.add('where cup.COD_CLIENTE = CLI.CODIGO AND');
      Query3.sql.add('cup.codigo = ''' +grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
      Query3.ExecSQL;
      //Query3.open;

      qr_vendedores.close;
      qr_vendedores.sql.clear;
      qr_vendedores.sql.add('select CUPOM.*, CUPOM_FORMA.*, VENDEDORES.*');
      qr_vendedores.sql.add('FROM CUPOM, CUPOM_FORMA, VENDEDORES');
      qr_vendedores.sql.add('where ');
      qr_vendedores.sql.add('cupom.codigo = CUPOM_FORMA.cod_cupom and');
      qr_vendedores.sql.add('cupom.COD_VENDEDOR = VENDEDORES.CODIGO');
      qr_vendedores.sql.add('and CUPOM_FORMA.cod_cupom = ''' +grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
      qr_vendedores.ExecSQL;
      //qr_vendedores.open;

      Queryclie2.close;
      Queryclie2.sql.clear;
      Queryclie2.sql.add('select nome_consumidor, cpf_consumidor');
      Queryclie2.sql.add('from cupom');
      Queryclie2.sql.add('where');
      Queryclie2.sql.add('codigo = ''' +grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
      Queryclie2.ExecSQL;
      //Queryclie2.open;

      qrobs.close;
      qrobs.sql.clear;
      qrobs.sql.add('select pego_porquem');
      qrobs.sql.add('from cupom');
      qrobs.sql.add('where');
      qrobs.sql.add('codigo = ''' +grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
      qrobs.ExecSQL;
      //qrobs.open;
         Frx_ImpressaoVendaCancelada.PrepareReport;
         Frx_ImpressaoVendaCancelada.Print;
     //Frx_ImpressaoVendaCancelada.ShowReport();
   end;

      //cancelando venda no DB PDV
    begin

    query.close;
    query.sql.clear;
    query.sql.add(' update CUPOM set cancelado = 1 ');
    query.sql.add(' where CODIGO LIKE ''' +
    grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
    query.execsql;

    query.Close;
    query.sql.clear;
    query.sql.add(' update cupom_item set cancelado = 1');
    query.sql.add(' where cod_cupom LIKE ''' +
    grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
    query.ExecSQL;

    query.close;
    query.sql.clear;
    query.sql.add(' UPDATE cupom_forma set cancelado = 1 ');
    query.sql.add(' where cod_cupom LIKE ''' +
    grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
    query.execsql;

    query.close;
    query.sql.clear;
    query.sql.add(' UPDATE cupom_crediario set cancelado = 1 ');
    query.sql.add(' where cod_cupom LIKE ''' +
    grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
    query.execsql;


  Application.MessageBox('Venda cancelada com sucesso, leve o cupom ou N� da venda cancelada para financeiro!', 'aviso', mb_ok + MB_ICONWARNING);
   AdvGlowButton1.Click;
      exit;
  end;
 end;
end;

procedure TfrmCupom_Menu.bt_fechar1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmCupom_Menu.Reimpressao_vendaClick(Sender: TObject);
var
  rValor_Temp: real;
  i, icont: integer;
  rvalor_total_convenio: real;
  NomeArquivo, sCod_Cupom: string;
  bLanca_comprovante_crediario,
    bLanca_Comprovante_Prestacao: boolean;
  sCOO_crediario, sGNF_Crediario: string;
  sCOO_Prestacao, sGNF_Prestacao, sGRG_Prestacao: string;
  sIdentificarVendedor: string;

  str: string;
  SR: TSearchRec;
  Origem, Destino: string;
begin

     if grid_cupom.RowCount = 0 then exit;
     if grid_cupom.SelectedRow < 0 then
  begin
    application.messagebox('Favor selecionar uma venda!','Erro',mb_ok+mb_iconerror);
    exit;
  end;
          begin
          BlockInput(false);
          if application.messagebox
            (pwidechar('Reimpressao da venda?' + #13 ), 'Aviso', mb_yesno) = idno then
            exit;


          end;
   begin
      UniQuery1.close;
      UniQuery1.sql.clear;
      UniQuery1.sql.add('select CUPOM.*, CUPOM_FORMA.*');
      UniQuery1.sql.add('FROM CUPOM, CUPOM_FORMA');
      UniQuery1.sql.add('where ');
      UniQuery1.sql.add('cupom.codigo = CUPOM_FORMA.cod_cupom');
      UniQuery1.sql.add('and CUPOM_FORMA.cod_cupom = ''' +grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
      UniQuery1.ExecSQL;
      //UniQuery1.open;

      query.close;
      query.sql.clear;
      query.sql.add('select item.*, item.produto');
      query.sql.add('from cupom_item item');
      query.sql.add('where ');
      query.sql.add('item.cod_cupom = ''' +grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
      query.ExecSQL;
      //query.open;

      Query3.close;
      Query3.sql.clear;
      Query3.sql.add('select CLI.NOME, CLI.cpf, CLI.CODIGO, CLI.ENDERECO, CLI.BAIRRO ');
      Query3.sql.add('from cupom CUP, CLIENTE CLI');
      Query3.sql.add('where cup.COD_CLIENTE = CLI.CODIGO AND');
      Query3.sql.add('cup.codigo = ''' +grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
      Query3.ExecSQL;
      //Query3.open;

      qr_vendedores.close;
      qr_vendedores.sql.clear;
      qr_vendedores.sql.add('select CUPOM.*, CUPOM_FORMA.*, VENDEDORES.*');
      qr_vendedores.sql.add('FROM CUPOM, CUPOM_FORMA, VENDEDORES');
      qr_vendedores.sql.add('where ');
      qr_vendedores.sql.add('cupom.codigo = CUPOM_FORMA.cod_cupom and');
      qr_vendedores.sql.add('cupom.COD_VENDEDOR = VENDEDORES.CODIGO');
      qr_vendedores.sql.add('and CUPOM_FORMA.cod_cupom = ''' +grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
      qr_vendedores.ExecSQL;
      //qr_vendedores.open;

      Queryclie2.close;
      Queryclie2.sql.clear;
      Queryclie2.sql.add('select nome_consumidor, cpf_consumidor');
      Queryclie2.sql.add('from cupom');
      Queryclie2.sql.add('where');
      Queryclie2.sql.add('codigo = ''' +grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
      Queryclie2.ExecSQL;
      //Queryclie2.open;

      qrobs.close;
      qrobs.sql.clear;
      qrobs.sql.add('select pego_porquem');
      qrobs.sql.add('from cupom');
      qrobs.sql.add('where');
      qrobs.sql.add('codigo = ''' +grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
      qrobs.ExecSQL;
      //qrobs.open;
       if frmVenda.qrconfig.fieldbyname('A4_CUPOM').asstring = '1' then
        Begin
         TfrxPictureView(Frx_ImpressaoVenda.FindObject('Picture1')).Picture.LoadFromFile('C:\ACTHAUROS\PDV\Img\QRCOD_empresa.jpg');

         //Frx_ImpressaoVenda.PrepareReport;
         //Frx_ImpressaoVenda.Print;
         Frx_ImpressaoVenda.ShowReport();
        End;

        if frmVenda.qrconfig.fieldbyname('A4_CUPOM').asstring = '2' then
        Begin
         TfrxPictureView(Frx_ImpressaoVendaA4.FindObject('Picture1')).Picture.LoadFromFile('C:\ACTHAUROS\PDV\Img\QRCOD_empresa.jpg');
         //Frx_ImpressaoVendaA4.PrepareReport;
         //Frx_ImpressaoVendaA4.Print;
         Frx_ImpressaoVendaA4.ShowReport();
        End;

        frmVenda.UniQuery1.close;
        frmVenda.UniQuery1.sql.clear;
        frmVenda.UniQuery1.sql.add('select CUPOM.*, CUPOM_FORMA.*');
        frmVenda.UniQuery1.sql.add('FROM CUPOM, CUPOM_FORMA');
        frmVenda.UniQuery1.sql.add('where ');
        frmVenda.UniQuery1.sql.add('cupom.codigo = CUPOM_FORMA.cod_cupom and CUPOM_FORMA.FORMA = ''PIX'' ');
        frmVenda.UniQuery1.sql.add('and CUPOM_FORMA.cod_cupom = ''' +grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
        frmVenda.UniQuery1.ExecSQL;

        if frmVenda.UniQuery1.RecordCount > 0 then
        Begin
          UniQuery1.close;
          UniQuery1.sql.clear;
          UniQuery1.sql.add('select CUPOM.*, CUPOM_FORMA.*');
          UniQuery1.sql.add('FROM CUPOM, CUPOM_FORMA');
          UniQuery1.sql.add('where ');
          UniQuery1.sql.add('cupom.codigo = CUPOM_FORMA.cod_cupom and CUPOM_FORMA.FORMA = ''PIX'' ');
          UniQuery1.sql.add('and CUPOM_FORMA.cod_cupom = ''' +grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ '''');
          UniQuery1.ExecSQL;

          //frmVenda.Frx_ImpressaoCompPix.PrepareReport;
          Frx_ImpressaoCompPix.ShowReport();
        End;
   end;
end;

procedure TfrmCupom_Menu.AbreDados;
begin
  qrcupom.Close;
  qrcupom.sql.clear;
  qrcupom.sql.add('select cupom.*,');
  qrcupom.sql.add('       cupom_consumidor.nome Consumidor');
  qrcupom.sql.add('from cupom, cupom_consumidor');
  qrcupom.sql.add('where');
  qrcupom.sql.add('  cupom.codigo = cupom_consumidor.codigo');
  qrcupom.sql.add('  and cupom.data = :data');
  qrcupom.sql.add('  and cupom.ecf = '''+sECF_Serial+'''');
  qrcupom.sql.add('order by cupom.numero');
  qrcupom.parambyname('data').asdatetime := ed_data.Date;
  qrcupom.open;

  grid_cupom.ClearRows;

  qrcupom.first;
  while not qrcupom.eof do
  begin
    grid_cupom.AddRow(1);
    grid_cupom.Cell[0,grid_cupom.LastAddedRow].AsString := qrcupom.fieldbyname('numero').asstring;
    grid_cupom.Cell[1,grid_cupom.LastAddedRow].AsString := qrcupom.fieldbyname('hora').asstring;
    grid_cupom.Cell[2,grid_cupom.LastAddedRow].AsString := qrcupom.fieldbyname('consumidor').asstring;
    grid_cupom.Cell[3,grid_cupom.LastAddedRow].Asfloat := qrcupom.fieldbyname('valor_total').asfloat;
    grid_cupom.Cell[4,grid_cupom.LastAddedRow].AsString := qrcupom.fieldbyname('codigo').asstring;
    grid_cupom.Cell[5,grid_cupom.LastAddedRow].Asinteger:= qrcupom.fieldbyname('cancelado').asinteger;
    qrcupom.Next;
  end;

  grid_cupom.SelectedRow := grid_cupom.LastAddedRow;
  //grid_cupom.SetFocus;

  Begin
   // grid_Sang_Sup.ClearRows;

    qrSup_sag.Close;
    qrSup_sag.sql.clear;
    qrSup_sag.sql.add('select nao_fiscal.*');
    qrSup_sag.sql.add('from nao_fiscal');
    qrSup_sag.sql.add('where nao_fiscal.codvendedor =:codvend and');
    qrSup_sag.sql.add('nao_fiscal.data = :data and nao_fiscal.denominacao = ''CN''');
    qrSup_sag.sql.add('order by nao_fiscal.COO');
    qrSup_sag.parambyname('data').asdatetime := ed_data.Date;
    qrSup_sag.parambyname('codvend').asstring := frmvenda.lbcod_operador.Caption;//IntToStr(icodigo_Usuario);
    qrSup_sag.open;

    qrSup_sag.first;
   { while not qrSup_sag.eof do
    begin
      grid_Sang_Sup.AddRow(1);
      grid_Sang_Sup.Cell[0,grid_Sang_Sup.LastAddedRow].AsString := qrSup_sag.fieldbyname('COO').asstring;
      grid_Sang_Sup.Cell[1,grid_Sang_Sup.LastAddedRow].AsString := qrSup_sag.fieldbyname('HORA').asstring;
      grid_Sang_Sup.Cell[2,grid_Sang_Sup.LastAddedRow].AsString := qrSup_sag.fieldbyname('DESCRICAO').asstring;
      grid_Sang_Sup.Cell[3,grid_Sang_Sup.LastAddedRow].Asfloat  := qrSup_sag.fieldbyname('VALOR').asfloat;
      grid_Sang_Sup.Cell[4,grid_Sang_Sup.LastAddedRow].AsString := qrSup_sag.fieldbyname('DATA').asstring;
      qrSup_sag.Next;
    end; }

   // grid_Sang_Sup.SelectedRow := grid_Sang_Sup.LastAddedRow;
    grid_cupom.SetFocus;
  End;

end;

procedure TfrmCupom_Menu.AdvGlowButton1Click(Sender: TObject);
begin
  if ed_data.Date > 0 then
    AbreDados
  else
    Application.MessageBox('Informe uma data valida!','Aten��o!',MB_ICONINFORMATION);
end;

procedure TfrmCupom_Menu.btImprimir_sup_sangClick(Sender: TObject);
begin

   //  if grid_Sang_Sup.RowCount = 0 then exit;
   //  if grid_Sang_Sup.SelectedRow < 0 then
 { begin
    application.messagebox('Favor selecionar uma venda!','Erro',mb_ok+mb_iconerror);
    exit;
  end;}
          begin
          BlockInput(false);
          if application.messagebox
            (pwidechar('Reimpressao?' + #13 ), 'Aviso', mb_yesno) = idno then
            exit;


          end;
   begin
      qrimp_sang_sup.close;
      qrimp_sang_sup.sql.clear;
      qrimp_sang_sup.sql.add('select NAO_FISCAL.*');
      qrimp_sang_sup.sql.add('FROM NAO_FISCAL');
      qrimp_sang_sup.sql.add('where ');
      qrimp_sang_sup.sql.add('NAO_FISCAL.COO = ''' +edcodcoo.Text+ '''');
      qrimp_sang_sup.ExecSQL;
      //qrobs.open;
       if frmVenda.qrconfig.fieldbyname('A4_CUPOM').asstring = '1' then
        Begin
         //Frx_ImpressaoVenda.PrepareReport;
         //Frx_ImpressaoVenda.Print;
         frximpressao_sup_sang.ShowReport();
        End;

        if frmVenda.qrconfig.fieldbyname('A4_CUPOM').asstring = '2' then
        Begin
         //Frx_ImpressaoVendaA4.PrepareReport;
         //Frx_ImpressaoVendaA4.Print;
         frximpressao_sup_sang.ShowReport();
        End;

     //Frx_ImpressaoVendaA4.ShowReport();
   end;
end;

procedure TfrmCupom_Menu.btrempressao_NFCeClick(Sender: TObject);
begin
     frmNotasconsumidor := tfrmNotasconsumidor.create(self);
     frmNotasconsumidor.showmodal;
     FreeAndNil(frmNotasconsumidor);
end;

procedure TfrmCupom_Menu.AdvMetroButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmCupom_Menu.BitBtn11Click(Sender: TObject);
var i : integer;
begin
  if application.messagebox
  (pwidechar('Gerar NFCe (Cupom Fiscal) desta venda?' + #13 ), 'Aviso', mb_yesno + MB_ICONWARNING) = idYes then

    begin


    if grid_cupom.RowCount = 0 then exit;
    if grid_cupom.SelectedRow < 0 then
    begin
      application.MessageBox('Favor selecionar uma venda','Aten��o',MB_OK+MB_ICONWARNING);
      exit;
    end;



    i := grid_cupom.SelectedRow;

    // filtrar os produtos
     frmmodulo.query_servidor.close;
     frmmodulo.query_servidor.sql.clear;
     frmmodulo.query_servidor.SQL.add('select r000002.*, C000025.produto, C000025.unidade,');
     frmmodulo.query_servidor.sql.add('c000025.cst, c000025.aliquota, c000025.codbarra');
     frmmodulo.query_servidor.sql.add('from r000002, c000025');
     frmmodulo.query_servidor.sql.add('where r000002.cod_produto = c000025.codigo');
     frmmodulo.query_servidor.sql.add('and r000002.cod_mesa = '+grid_cupom.Cell[0,grid_cupom.selectedrow].asstring);
     frmmodulo.query_servidor.sql.add('order by r000002.codigo');
     frmmodulo.query_servidor.open;


     qritem.close;
     qritem.sql.clear;
     qritem.sql.add('select * from r000001');
     qritem.sql.add('where codigo = '+grid_cupom.Cell[0,grid_cupom.selectedrow].asstring);
     qritem.open;



    if (frmmodulo.query_servidor.RecordCount = 0) and
       (qritem.RecordCount = 0) then
    begin
      Application.messagebox('N�o tem itens lan�ados para esta Mesa!','Aten��o!',mb_ok+mb_ICONerror);
    end
    else
    begin
      if application.messagebox('Confirma a impress�o do cupom para esta mesa?','Aten��o',mb_yesno+
                                MB_ICONQUESTION) = idYes then
      begin
        bLanca_mesa := true;
        close;
      end;
    end;

  End
  else
  Begin
  exit;
  End;

end;

procedure TfrmCupom_Menu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.TipoImpressora := oldTipoImpressora;
  action := cafree;
end;

procedure TfrmCupom_Menu.FormCreate(Sender: TObject);
begin
  oldTipoImpressora := frmPrincipal.TipoImpressora;
  frmPrincipal.TipoImpressora := NaoFiscal;
end;

procedure TfrmCupom_Menu.FormShow(Sender: TObject);
begin
  ed_data.Date := dData_Sistema;
  ed_ecf.Text := sECF_Serial;
  AbreDados;
end;

procedure TfrmCupom_Menu.grid_cupomCellFormating(Sender: TObject; ACol,
  ARow: Integer; var TextColor: TColor; var FontStyle: TFontStyles;
  CellState: TCellState);
begin
  if grid_cupom.Cell[5,arow].AsInteger = 1 then TextColor := clred;
end;

procedure TfrmCupom_Menu.grid_Sang_SupCellFormating(Sender: TObject; ACol,
  ARow: Integer; var TextColor: TColor; var FontStyle: TFontStyles;
  CellState: TCellState);
begin
 // if grid_Sang_Sup.Cell[5,arow].AsInteger = 1 then TextColor := clred;
end;

procedure TfrmCupom_Menu.MenuFiscal1Click(Sender: TObject);
begin
  frmMenu_fiscal := tfrmMenu_fiscal.create(self);
  frmMenu_fiscal.showmodal;
end;

end.
