unit produto_consulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, RzLabel, AdvOfficeImage, Mask, RzEdit,
  NxColumnClasses, NxColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, Menus, AdvMenus, DB, DBAccess, pngimage, frxClass, dxGDIPlusClasses, Uni,
  MemDS, JvExMask, JvToolEdit, JvBaseEdits, JvDBControls;

type
  TfrmProduto_consulta = class(TForm)
    pop_principal: TAdvPopupMenu;
    Estoque1: TMenuItem;
    query: TUniQuery;
    Panel11: TPanel;
    Panel12: TPanel;
    pnFundo: TPanel;
    img_cliente: TAdvOfficeImage;
    lb_status: TRzLabel;
    lb_cliente: TRzLabel;
    RzLabel1: TRzLabel;
    ed_barra: TRzEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    grid: TNextGrid;
    NxTextColumn6: TNxTextColumn;
    NxTextColumn7: TNxTextColumn;
    NxNumberColumn3: TNxTextColumn;
    NxTextColumn1: TNxTextColumn;
    NxNumberColumn1: TNxNumberColumn;
    NxNumberColumn2: TNxNumberColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn3: TNxTextColumn;
    NxTextColumn4: TNxTextColumn;
    NxTextColumn5: TNxTextColumn;
    procedure ed_barraEnter(Sender: TObject);
    procedure ed_barraKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridKeyPress(Sender: TObject; var Key: Char);
    procedure Estoque1Click(Sender: TObject);
    procedure MenuFiscal2Click(Sender: TObject);
    procedure LocalizarProduto(referencia: string);
    procedure PreencherGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProduto_consulta: TfrmProduto_consulta;

implementation

uses venda, funcoes, modulo, Math, principal, consulta_estoque,
  menu_fiscal;

{$R *.dfm}

// -------------------------------------------------------------------------- //
procedure TfrmProduto_consulta.ed_barraEnter(Sender: TObject);
begin
  lb_status.Caption := 'Informe o Produto...';
  if iTeclado_modelo = 1 then
  begin
    Imprime_display_teclado('Informe o Produto','');
  end;
end;

// -------------------------------------------------------------------------- //
procedure TfrmProduto_consulta.ed_barraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;

    if ed_barra.Text <> '' then
    begin
//      if bVenda then
      iPesquisa_produto := 1;
 //     else
//        iPesquisa_produto := 0;

      LocalizarProduto(ANSIUPPERCASE(ed_barra.text));
    end;
  end
  else
  begin
    if key = #27 then close
    else
    begin
      if iTeclado_Modelo = 1 then
      begin
        strpcopy(@men,key);
        DispStr(@men);
      end;
    end;
  end;
end;

// -------------------------------------------------------------------------- //
procedure TfrmProduto_consulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  iPesquisa_produto := 0;
  action := cafree;
end;

// -------------------------------------------------------------------------- //
procedure TfrmProduto_consulta.FormCreate(Sender: TObject);
begin
end;

// -------------------------------------------------------------------------- //
procedure TfrmProduto_consulta.FormShow(Sender: TObject);
begin
  if ed_barra.Text <> '' then begin
    LocalizarProduto(ed_barra.Text);
  end else
    ed_barra.SetFocus;
end;

// -------------------------------------------------------------------------- //
procedure TfrmProduto_consulta.gridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
     Key := #0;

     if grid.RowCount > 0 then
     begin
       If grid.Cell[0,grid.SelectedRow].AsInteger > 0 then
       begin
         If iPesquisa_produto > 0 then
         begin
           iProd_codigo := grid.cell[0,grid.SelectedRow].asinteger;
           close;
         end;
       end;
     end;
  end
  else
  begin
    if key = #27 then
    begin
      ed_barra.setfocus;
    end
    else
    begin

    end;
  end;
end;

// -------------------------------------------------------------------------- //
procedure TfrmProduto_consulta.Estoque1Click(Sender: TObject);
begin
  if grid.SelectedRow < 0 then exit;

  // filtrar as vendas deste produto que nao foram exportados
  query.close;
  query.sql.clear;
  query.sql.add('select');
  query.sql.add('(select sum(qtde) from cupom_item, cupom');
  query.sql.add('  where cupom_item.cod_cupom = cupom.codigo');
  query.sql.add('  and cupom.ex = 0');
  query.sql.add('  and cupom_item.cancelado = 1');
  query.sql.add('  and cupom_item.cod_produto = '+IntToStr(grid.cell[0,grid.selectedrow].asinteger)+') as total_cancelado,');
  query.sql.add('sum(qtde) as total_vendido from cupom_item, cupom');
  query.sql.add('  where cupom_item.cod_cupom = cupom.codigo');
  query.sql.add('  and cupom.ex = 0');
  query.sql.add('  and cupom_item.cancelado = 0');
  query.sql.add('  and cupom_item.cod_produto = '+IntToStr(grid.cell[0,grid.selectedrow].asinteger));
  query.open;

  frmConsulta_Estoque := tfrmConsulta_Estoque.create(self);
  frmConsulta_Estoque.lb_estoque.Caption :=
    FormatFloat('###,###,##0.00',grid.Cell[5,grid.selectedrow].asfloat-
                                 query.fieldbyname('total_vendido').asfloat+
                                 query.fieldbyname('total_cancelado').asfloat)+' '+
                                 grid.cell[3,grid.selectedrow].asstring;
  frmConsulta_Estoque.StatusBar1.Panels[0].Text := 'Atualizado em: '+sCarga_data+' �s '+scarga_hora;
  frmConsulta_Estoque.showmodal;
end;

// -------------------------------------------------------------------------- //
procedure TfrmProduto_consulta.MenuFiscal2Click(Sender: TObject);
begin
   if bVenda then
   begin
     Application.MessageBox('Existe uma venda aberta! Favor finalizar para acessar o menu fiscal!',
                            'Aten��o',mb_ok+MB_ICONWARNING);
     exit;
   end;
   frmMenu_fiscal := tfrmMenu_fiscal.create(self);
   frmMenu_fiscal.showmodal;
end;

// -------------------------------------------------------------------------- //
// CGT: 04/03/2010 - Procedure para corrigir um problema que
// estava ocorrendo quando a consulta era in�ciada pela digita��o de um
// produto na tela de venda
procedure TfrmProduto_consulta.LocalizarProduto(referencia: string);
var
  bBusca_codigo: boolean; // variavel de para ativar ou nao a busca pelo campo codigo

begin
  bBusca_codigo := False;

  // verificar ha possibilidade do texto ser um numero inteiro ou
  // nao ser um produto pesado em balanca --> iniciado por 2
  if length(referencia) < 8 then
  begin
    // verificar se o campo referencia eh um numero inteiro valido
    try
      strtoint(referencia);
      bBusca_codigo := true;
    except
      on EConvertError do
        bBusca_codigo := false;
    end;

    if bBusca_codigo then
    begin
      // comando SQL para filtrar o produto pelo codigo de barras
      frmVenda.qrprodutosSV.close;
      frmVenda.qrprodutosSV.sql.clear;
      frmVenda.qrprodutosSV.sql.add('select * from C000025 pro, c000100 est');
      frmVenda.qrprodutosSV.sql.add('where pro.codigo = est.codproduto and pro.codbarra = '''+referencia+'''');
      frmVenda.qrprodutosSV.sql.add('and pro.SITUACAO = 0');
      frmVenda.qrprodutosSV.Open;

      if frmVenda.qrprodutosSV.IsEmpty then
      begin
        // nao achou pelo codigo de barras, procurar pelo codigo
        frmVenda.qrprodutosSV.close;
        frmVenda.qrprodutosSV.sql.clear;
        frmVenda.qrprodutosSV.sql.add('select * from C000025 pro, c000100 est');
        frmVenda.qrprodutosSV.sql.add('where pro.codigo = est.codproduto and pro.codigo = '+referencia);
        frmVenda.qrprodutosSV.sql.add('and pro.SITUACAO = 0');
        frmVenda.qrprodutosSV.open;
      end;
    end
    else
    begin
      // GUIO: Tenta localizar a referencia do produto
      frmVenda.qrprodutosSV.close;
      frmVenda.qrprodutosSV.sql.clear;
      frmVenda.qrprodutosSV.sql.add('select * from C000025 pro, c000100 est');
      frmVenda.qrprodutosSV.sql.add('where pro.codigo = est.codproduto and upper(pro.REFERENCIA) LIKE ''%'+ANSIUPPERCASE(referencia)+'%''');
      frmVenda.qrprodutosSV.sql.add('and pro.SITUACAO = 0');
      frmVenda.qrprodutosSV.sql.add('order by pro.REFERENCIA, pro.COR, pro.TAMANHO');
      frmVenda.qrprodutosSV.open;

      if frmVenda.qrprodutosSV.IsEmpty then
      begin
        // nao achou pelo codigo de barras, procurar pelo nome
        frmVenda.qrprodutosSV.close;
        frmVenda.qrprodutosSV.sql.clear;
        frmVenda.qrprodutosSV.sql.add('select * from C000025 pro, c000100 est');
        frmVenda.qrprodutosSV.sql.add('where pro.codigo = est.codproduto and upper(pro.produto) like ''%'+ANSIUPPERCASE(referencia)+'%''');
        frmVenda.qrprodutosSV.sql.add('and pro.SITUACAO = 0');
        frmVenda.qrprodutosSV.sql.add('order by pro.produto');
        frmVenda.qrprodutosSV.open;
      end;
    end;

    PreencherGrid;

    if frmVenda.qrprodutosSV.IsEmpty then
    begin
      if iTeclado_Modelo = 1 then
        Imprime_display_teclado('A T E N C A O !','Nenhum produto encontrado!');

      Application.ProcessMessages;
      Sleep(1500);
      ed_barra.setfocus;

      ED_barra.TEXT := '';

      if iTeclado_Modelo = 1 then
        Imprime_display_teclado('Pesquisa de produtos','');

      ed_barra.SelectAll;
    end;
  end
end;

// -------------------------------------------------------------------------- //
procedure TfrmProduto_consulta.PreencherGrid;
begin
  grid.ClearRows;
  frmVenda.qrprodutosSV.First;
  while not frmvenda.qrprodutosSV.eof do
  begin
    if iTeclado_Modelo = 1 then
    begin
        Imprime_display_teclado(INTTOSTR(FRMvenda.qrprodutosSV.RECORDCOUNT)
          + ' PRODUTOS ENCONTRADOS!', '');
    end;

    grid.AddRow(1);
    grid.Cell[0,grid.LastAddedRow].asstring :=
      zerar(frmvenda.qrprodutosSV.fieldbyname('codigo').asstring,14);

    case iColunaCOnsultaProdutos of
      0: begin
      //  grid.Columns[1].Header.Caption := 'C�d.Barras';

        grid.cell[1,grid.LastAddedRow].asstring :=
          frmvenda.qrprodutosSV.fieldbyname('codbarra').asstring;
      end;
      1: begin
        grid.Columns[1].Header.Caption := 'Ref�r�ncia';

        grid.cell[1,grid.LastAddedRow].asstring :=
          frmvenda.qrprodutosSV.fieldbyname('referencia').asstring;
      end;
      2: begin
        grid.Columns[1].Header.Caption := 'Ref/Tam/Cor';
        grid.cell[1,grid.LastAddedRow].asstring :=
          frmvenda.qrprodutosSV.fieldbyname('referencia').asstring
          + '/' + frmvenda.qrprodutosSV.fieldbyname('tamanho').asstring
          + '/' + frmvenda.qrprodutosSV.fieldbyname('cor').asstring;
      end;
    end;

    grid.cell[2,grid.LastAddedRow].asstring :=
      frmvenda.qrprodutosSV.fieldbyname('produto').asstring;
    grid.cell[3,grid.LastAddedRow].asstring :=
      frmvenda.qrprodutosSV.fieldbyname('unidade').asstring;
    grid.cell[4,grid.LastAddedRow].asfloat :=
      frmvenda.qrprodutosSV.fieldbyname('precovenda').asfloat;

    // verificar se o produto estah em promocao
    if frmvenda.qrprodutosSV.fieldbyname('preco_promocao').asfloat > 0 then
    begin
      IF (dData_Sistema >= frmvenda.qrprodutosSV.fieldbyname('data_promocao').AsDateTime) AND
         (dData_Sistema <= frmvenda.qrprodutosSV.fieldbyname('fim_promocao').ASDATETIME) then
      begin
        grid.cell[4,grid.LastAddedRow].asfloat :=
          frmvenda.qrprodutosSV.fieldbyname('preco_promocao').asfloat;
      end;
    end;

    grid.cell[5,grid.LastAddedRow].asfloat :=
      frmvenda.qrprodutosSV.fieldbyname('precoatacado1').asfloat;

    //grid.cell[6,grid.LastAddedRow].asstring := frmVenda.qrprodutosSV.fieldbyname('cst').asstring;
    //grid.cell[7,grid.lastaddedrow].asstring := frmvenda.qrprodutosSV.fieldbyname('estoque_atual').asstring;
    //grid.cell[8,grid.lastaddedrow].asstring := frmvenda.qrprodutosSV.fieldbyname('aliquota').asstring;
    grid.cell[9,grid.lastaddedrow].asstring := frmvenda.qrprodutosSV.fieldbyname('estoque_atual').asstring;


    frmvenda.qrprodutosSV.next;
  end;

  grid.SelectFirstRow;
  grid.setfocus;
end;


end.
