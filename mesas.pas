unit mesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, AdvOfficeImage, StdCtrls,
  RzLabel, jpeg, ExtCtrls, Menus, AdvMenus, DB, DBAccess, pngimage, AdvMetroButton, AdvSmoothPanel, AdvSmoothExpanderPanel, Uni,
  MemDS;

type
  TfrmMesas = class(TForm)
    Image1: TImage;
    lb_cliente: TRzLabel;
    grid_venda: TNextGrid;
    pop_principal: TAdvPopupMenu;
    Retornar1: TMenuItem;
    Finalizar1: TMenuItem;
    Cancelar1: TMenuItem;
    MenuFiscal1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
  //  qrMesa: TIBCQuery;
    tm_Atualiza: TTimer;
    Imprimir1: TMenuItem;
  //  QRITEM: TIBCQuery;
    NxNumberColumn1: TNxNumberColumn;
    NxDateColumn1: TNxDateColumn;
    NxTextColumn1: TNxTextColumn;
    NxNumberColumn2: TNxNumberColumn;
    imgFundo: TImage;
    AdvSmoothExpanderPanel1: TAdvSmoothExpanderPanel;
    Label17: TLabel;
    img_cliente: TAdvOfficeImage;
    Panel3: TPanel;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    LB_MENU_FISCAL: TRzLabel;
    qrMesa: TUniQuery;
    QRITEM: TUniQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Retornar1Click(Sender: TObject);
    procedure tm_AtualizaTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Finalizar1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure MenuFiscal1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMesas: TfrmMesas;

implementation

uses modulo, funcoes, principal, msg_Operador, venda, senha_supervisor,
  menu_fiscal,  unECF, UFuncoes;

{$R *.dfm}

procedure TfrmMesas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmMesas.FormCreate(Sender: TObject);
begin
  Self.DoubleBuffered := True;
  left := 0;
  top := 0;
end;

procedure TfrmMesas.Retornar1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMesas.tm_AtualizaTimer(Sender: TObject);
var i : integer;
x : integer;
sNumero_dav : string;
begin
//  frmMsg_Operador.lb_msg.caption := 'Aguarde! Atualizando rela��o de pr�-vendas...';
//  frmMsg_Operador.show;
//  frmMsg_Operador.Refresh;

  if grid_venda.RowCount > 0 then
    if grid_venda.SelectedRow >= 0 then
      x := grid_venda.SelectedRow;


  tm_Atualiza.Enabled := false;

  qrMesa.close;
  qrMesa.sql.clear;
  qrMesa.sql.add('select sum(r000002.total) soma,');
  qrMesa.sql.add('r000001.codigo, r000001.data, r000001.hora, r000001.CLIENTE, c000008.nome');
  qrMesa.sql.add('from r000001, r000002, c000008');
  qrMesa.sql.add('where r000001.codigo = r000002.cod_mesa and r000001.cod_funcionario = c000008.codigo');
  qrMesa.sql.add('group by r000001.codigo, r000001.data, r000001.hora, r000001.CLIENTE, c000008.nome');
  qrMesa.sql.add('order by r000001.codigo');
  qrMesa.open;

  grid_venda.ClearRows;

  qrMesa.First;
  while not qrMesa.Eof do
  begin
    i := grid_venda.AddRow(1);


    grid_venda.Cell[1,i].Asdatetime := qrMesa.fieldbyname('DATA').asdatetime;
    grid_venda.Cell[0,i].Asstring   := qrMesa.fieldbyname('CODIGO').asstring;
    grid_venda.Cell[3,i].Asstring   := qrMesa.fieldbyname('CLIENTE').asstring;
    grid_venda.Cell[5,i].Asfloat    := qrMesa.fieldbyname('SOMA').asfloat;
    grid_venda.Cell[2,i].Asstring   := qrMesa.fieldbyname('HORA').asstring;
    grid_venda.Cell[4,i].Asstring   := qrMesa.fieldbyname('NOME').asstring;

    qrMesa.Next;
  end;
  grid_venda.SelectedRow := x;
  grid_venda.SetFocus;
  tm_Atualiza.Enabled := true;
//  hide;
//  frmmsg_Operador.Refresh;
end;

procedure TfrmMesas.FormShow(Sender: TObject);
var
sImgFundo:string;
begin
  sImgFundo := ExtractFilePath(Application.ExeName) + 'img\fundo_pdv.jpg';

  if FileExists(sImgFundo) then
    imgFundo.Picture.LoadFromFile(sImgFundo);

  tm_AtualizaTimer(frmMesas);
end;

procedure TfrmMesas.Finalizar1Click(Sender: TObject);
var i : integer;
begin


  if grid_venda.RowCount = 0 then exit;
  if grid_venda.SelectedRow < 0 then
  begin
    application.MessageBox('Favor selecionar uma mesa','Aten��o',MB_OK+MB_ICONWARNING);
    exit;
  end;



  i := grid_venda.SelectedRow;

  // filtrar os produtos
   frmmodulo.query_servidor.close;
   frmmodulo.query_servidor.sql.clear;
   frmmodulo.query_servidor.SQL.add('select r000002.*, C000025.produto, C000025.unidade,');
   frmmodulo.query_servidor.sql.add('c000025.cst, c000025.aliquota, c000025.codbarra');
   frmmodulo.query_servidor.sql.add('from r000002, c000025');
   frmmodulo.query_servidor.sql.add('where r000002.cod_produto = c000025.codigo');
   frmmodulo.query_servidor.sql.add('and r000002.cod_mesa = '+grid_venda.Cell[0,grid_venda.selectedrow].asstring);
   frmmodulo.query_servidor.sql.add('order by r000002.codigo');
   frmmodulo.query_servidor.open;


   qritem.close;
   qritem.sql.clear;
   qritem.sql.add('select * from r000001');
   qritem.sql.add('where codigo = '+grid_venda.Cell[0,grid_venda.selectedrow].asstring);
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
      imesa_codigo := grid_venda.Cell[0,i].asinteger;
      smesa_Numero := 'ECF: '+zerar(qritem.fieldbyname('ecf').asstring,3)+' - Confer�ncia de Mesa - '+
                      'CER No. '+zerar(qritem.fieldbyname('Cer').asstring,4)+' - '+
                      'COO No. '+zerar(qritem.fieldbyname('coo').asstring,6) + ' - Mesa: ' + Zerar( grid_venda.Cells[0,i],6);

      close;
    end;
  end;
end;

procedure TfrmMesas.Cancelar1Click(Sender: TObject);
var i : integer;
begin
  if grid_venda.RowCount = 0 then exit;

  if grid_venda.SelectedRow < 0 then
  begin
    application.MessageBox('Favor selecionar uma MESA!','Aten��o',MB_OK+MB_ICONWARNING);
    exit;
  end;

  frmsenha_supervisor := tfrmsenha_supervisor.create(self);
  frmsenha_supervisor.showmodal;
  frmvenda.Imprime_display_anterior;
  // verisificar se o supervisor foi logado
  if not bSupervisor_autenticado then exit;




  i := grid_venda.SelectedRow;

    if application.messagebox('Confirma o cancelamento deste pedido?','Aten��o',mb_yesno+
                              MB_ICONWARNING) = idYes then
    begin

          {frmMsg_Operador.lb_msg.caption := 'Aguarde cancelando a MESA n� '+grid_venda.cell[0,i].asstring+'...';
          frmMsg_Operador.Show;
          frmMsg_Operador.Refresh;}

          Begin
            QRITEM.CLOSE;
            QRITEM.SQL.CLEAR;
            QRITEM.SQL.ADD('update r000002 set cancelado = 1');
            qritem.sql.add('where cod_mesa = '''+grid_venda.cell[0,i].asstring+'''');
            QRITEM.ExecSQL;
          End;

          Application.MessageBox('Itens da Mesa cancelados com sucesso!','Aten��o',MB_OK+MB_ICONWARNING);
         { Begin
            frmmodulo.query_servidor.close;
            frmmodulo.query_servidor.SQL.clear;
            frmmodulo.query_servidor.sql.add('delete from r000001');
            frmmodulo.query_servidor.sql.add('where codigo = '''+grid_venda.cell[0,i].asstring+'''');
            frmmodulo.query_servidor.ExecSQL;
          End; }

         { Application.processmessages;
          frmMsg_Operador.Hide;
          frmMsg_Operador.Refresh;}
    end;


    begin
          // excluir a mesa e os itens
          frMmodulo.query_servidor.close;
          frmmodulo.query_servidor.sql.clear;
          frmmodulo.query_servidor.sql.add('delete from r000002 where cod_mesa = '''+grid_venda.cell[0,i].asstring+'''');
          frmmodulo.query_servidor.ExecSQL;

          frMmodulo.query_servidor.close;
          frmmodulo.query_servidor.sql.clear;
          frmmodulo.query_servidor.sql.add('delete from r000001 where codigo = '''+grid_venda.cell[0,i].asstring+'''');
          frmmodulo.query_servidor.ExecSQL;
          // inserir a liberacao da mesa para nao aparecer no sistema de frente
          try
            frMmodulo.query_servidor.close;
            frmmodulo.query_servidor.sql.clear;
            frmmodulo.query_servidor.sql.add('insert into r000003 (mesa) values (' + grid_venda.cell[0,i].asstring + ')');
            frmmodulo.query_servidor.ExecSQL;
          except
          end;

    end;

end;

procedure TfrmMesas.MenuFiscal1Click(Sender: TObject);
begin
  frmMenu_fiscal := tfrmMenu_fiscal.create(self);
  frmMenu_fiscal.showmodal;
end;

procedure TfrmMesas.Imprimir1Click(Sender: TObject);
var i : integer;
sNumero_Dav : string;
Rsoma : real;
begin

   if grid_venda.RowCount = 0 then
    exit;

   if grid_venda.SelectedRow < 0 then
   begin
     Application.MessageBox('Favor selecionar uma Mesa!','Aten��o',MB_OK+MB_ICONWARNING);
     exit;
   end;
  
    repeat

      if frmPrincipal.TipoImpressora = Fiscal then
        sMsg := cECF_Abre_Gerencial(iECF_Modelo,'CONFER�NCIA DE MESA')
      else
        sMsg := Imp_Abre_Gerencial(sPortaNaoFiscal,'CONFER�NCIA DE MESA');

        if frmPrincipal.TipoImpressora = Fiscal then
          sNumero_Cupom := cECF_Numero_Cupom(iECF_Modelo)
        else
          begin

            try // Pega Menor numero cupom
              sNumero_Cupom := FloatToStr( max(''));

            except
              sNumero_Cupom := '1';
            end;

          end;

      if sMsg <> 'OK' then
      begin
        if application.messagebox(pwidechar('Erro no ECF!'+#13+
                                            'Mensagem: '+sMsg+#13+
                                            'Deseja tentar outra vez?'),'Erro',mb_yesno+
                                            mb_iconerror) = idNo then
        begin
          break;
        end;
      end
      else
      begin
        // extrair do ecf o numero dos contadores

         if frmPrincipal.TipoImpressora = Fiscal then
         begin
          sGNF := cECF_Numero_Contador_Operacao_NF(iECF_Modelo);
          sGRG := cECF_Numero_Contador_Relatorio_Gerencial(iECF_Modelo);
         end
         else
         begin
          sGNF := FloatToStr( max(''));
          sGRG := sGNF;
         end;

      end;

  until sMsg = 'OK';

      if sMsg = 'OK' then
      begin
              // Cabecalho
        repeat
            if frmPrincipal.TipoImpressora = Fiscal then
            begin
              SMsg := cECF_Usa_Gerencial(iECF_Modelo,'*****   AGUARDE A EMISSAO DO CUPOM FISCAL  *****');
              SMsg := cECF_Usa_Gerencial(iECF_Modelo,'------------------------------------------------');
              SMsg := cECF_Usa_Gerencial(iECF_Modelo,'Numero da Mesa: '+grid_venda.cell[0,grid_venda.selectedrow].asstring);
              SMsg := cECF_Usa_Gerencial(iECF_Modelo,'Abertura......: '+grid_venda.cell[1,grid_venda.selectedrow].asstring+' '+
                                                                            grid_venda.cell[2,grid_venda.selectedrow].asstring);
            end
              else
              begin
                SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,'********    AGUARDE A EMISSAO DO CUPOM *********');
                SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,'------------------------------------------------');
                SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,'Numero da Mesa: '+grid_venda.cell[0,grid_venda.selectedrow].asstring);
                SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,'Abertura......: '+grid_venda.cell[1,grid_venda.selectedrow].asstring+' '+
                                                                              grid_venda.cell[2,grid_venda.selectedrow].asstring);
              end;


            if sMsg <> 'OK' then
            begin
              if application.messagebox(pwidechar('Erro na impress�o do relat�rio gerencial!'+#13+
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


       rSoma := 0;
       qritem.close;
       qritem.sql.clear;
       qritem.SQL.add('select r000002.*, C000025.produto, C000025.unidade');
       qritem.sql.add('from r000002, c000025');
       qritem.sql.add('where r000002.cod_produto = c000025.codigo');
       qritem.sql.add('and r000002.cod_mesa = '+grid_venda.Cell[0,grid_venda.selectedrow].asstring);
       qritem.sql.add('order by r000002.codigo');
       qritem.open;

      if (sMsg = 'OK') and (qritem.RecordCount > 0) then
      begin
         qritem.first;
         if frmPrincipal.TipoImpressora = Fiscal then
         begin
           SMsg := cECF_Usa_Gerencial(iECF_Modelo,
             '------------------------------------------------');
           SMsg := cECF_Usa_Gerencial(iECF_Modelo,
             'Item Codigo        Descricao');
           SMsg := cECF_Usa_Gerencial(iECF_Modelo,
             '                    Qtde Un.  Vl.Unit    Vl.Item');
           SMsg := cECF_Usa_Gerencial(iECF_Modelo,
             '------------------------------------------------');
         end
         else
         begin
           SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
             '------------------------------------------------');
           SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
             'Item Codigo        Descricao');
           SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
             '                    Qtde Un.  Vl.Unit    Vl.Item');
           SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
             '------------------------------------------------');
         end;


          i := 1;
          while not qritem.eof do
          begin
            repeat
              if qritem.fieldbyname('cancelado').asfloat = 0 then
              begin

                if frmPrincipal.TipoImpressora = Fiscal then
                begin
                  SMsg := cECF_Usa_Gerencial(iECF_Modelo,
                    texto_justifica(IntToStr(i),3,'0',taDireita)+' '+
                    texto_justifica(qritem.fieldbyname('cod_produto').asstring,13,'0',taDireita)+' '+
                    texto_justifica(qritem.fieldbyname('produto').asstring,30,' ',taEsquerda));

                  SMsg := cECF_Usa_Gerencial(iECF_Modelo,'              '+
                    texto_justifica(formatfloat('###,###,##0.000',qritem.fieldbyname('qtde').asfloat),10,' ',taDireita)+
                    texto_justifica(qritem.fieldbyname('unidade').asstring,2,' ',taEsquerda)+' '+
                    texto_justifica(formatfloat('###,###,##0.000',qritem.fieldbyname('unitario').asfloat),10,' ',taDireita)+
                    texto_justifica(formatfloat('###,###,##0.00',qritem.fieldbyname('total').asfloat),11,' ',taDireita));
                end
                else
                begin
                  SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                    texto_justifica(IntToStr(i),3,'0',taDireita)+' '+
                    texto_justifica(qritem.fieldbyname('cod_produto').asstring,13,'0',taDireita)+' '+
                    texto_justifica(qritem.fieldbyname('produto').asstring,30,' ',taEsquerda));

                  SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,'              '+
                    texto_justifica(formatfloat('###,###,##0.000',qritem.fieldbyname('qtde').asfloat),10,' ',taDireita)+
                    texto_justifica(qritem.fieldbyname('unidade').asstring,2,' ',taEsquerda)+' '+
                    texto_justifica(formatfloat('###,###,##0.000',qritem.fieldbyname('unitario').asfloat),10,' ',taDireita)+
                    texto_justifica(formatfloat('###,###,##0.00',qritem.fieldbyname('total').asfloat),11,' ',taDireita));                
                end;

                  rsoma := rsoma + qritem.fieldbyname('total').asfloat;

              end
                else
                begin // Nao Fiscal

                    if frmPrincipal.TipoImpressora = Fiscal then
                    begin
                    SMsg := cECF_Usa_Gerencial(iECF_Modelo,
                      texto_justifica(IntToStr(i),3,'0',taDireita)+' '+
                      texto_justifica(qritem.fieldbyname('cod_produto').asstring,13,'0',taDireita)+' '+
                      texto_justifica('** CANCELADO ** '+qritem.fieldbyname('produto').asstring,30,' ',taEsquerda));

                    SMsg := cECF_Usa_Gerencial(iECF_Modelo,'              '+
                      texto_justifica(formatfloat('###,###,##0.000',qritem.fieldbyname('qtde').asfloat),10,' ',taDireita)+
                      texto_justifica(qritem.fieldbyname('unidade').asstring,2,' ',taEsquerda)+' '+
                      texto_justifica(formatfloat('###,###,##0.000',qritem.fieldbyname('unitario').asfloat),10,' ',taDireita)+
                      texto_justifica(formatfloat('###,###,##0.00',qritem.fieldbyname('total').asfloat),11,' ',taDireita));
                    end
                    else
                    begin
                      SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                        texto_justifica(IntToStr(i),3,'0',taDireita)+' '+
                        texto_justifica(qritem.fieldbyname('cod_produto').asstring,13,'0',taDireita)+' '+
                        texto_justifica('** CANCELADO ** '+qritem.fieldbyname('produto').asstring,30,' ',taEsquerda));

                      SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,'              '+
                        texto_justifica(formatfloat('###,###,##0.000',qritem.fieldbyname('qtde').asfloat),10,' ',taDireita)+
                        texto_justifica(qritem.fieldbyname('unidade').asstring,2,' ',taEsquerda)+' '+
                        texto_justifica(formatfloat('###,###,##0.000',qritem.fieldbyname('unitario').asfloat),10,' ',taDireita)+
                        texto_justifica(formatfloat('###,###,##0.00',qritem.fieldbyname('total').asfloat),11,' ',taDireita));
                    end;

                  end;

              if sMsg <> 'OK' then
              begin
                if application.messagebox(pwidechar('Erro no ECF!'+#13+
                                                    'Mensagem: '+sMsg+#13+
                                                    'Deseja tentar outra vez?'),'Erro',mb_yesno+
                                                    mb_iconerror) = idNo then
                begin
                  break;
                end;
              end
            until sMsg = 'OK';
            inc(i);
            qritem.Next;
          end;

          if sMsg = 'OK' then
          begin

            // Rodape dos Produtos
            repeat

              if frmPrincipal.TipoImpressora = Fiscal then
              begin
                SMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '------------------------------------------------');
                SMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '                               Total:'+texto_justifica(formatfloat('###,###,##0.00',rsoma),11,' ',taDireita))
              end
              else
              begin
                SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '------------------------------------------------');
                SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '                               Total:'+texto_justifica(formatfloat('###,###,##0.00',rsoma),11,' ',taDireita))              
              end;

              if sMsg <> 'OK' then
              begin
                if application.messagebox(pwidechar('Erro na impress�o do relat�rio gerencial!'+#13+
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
      end; // produtos


        if frmPrincipal.TipoImpressora = Fiscal then
          SMsg := cECF_Usa_Gerencial(iECF_Modelo,'*****   AGUARDE A EMISSAO DO CUPOM FISCAL  *****')
        else
          SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,'*******   AGUARDE A EMISSAO DO CUPOM ********');


          (* FECHAMENTO *)
          IF SMSG = 'OK' THEN
          BEGIN

            repeat

              if frmPrincipal.TipoImpressora = Fiscal then
                sMsg := cECF_Fecha_Gerencial(iECF_Modelo)
              else
                sMsg := Imp_Fecha_Gerencial(sPortaNaoFiscal);

              if sMsg <> 'OK' then
              begin
                if application.messagebox(pwidechar('Erro no ECF!'+#13+
                                                    'Mensagem: '+sMsg+#13+
                                                    'Deseja tentar outra vez?'),'Erro',mb_yesno+
                                                    mb_iconerror) = idNo then
                begin
                  break;
                end;
              end
              else
              begin

                if frmPrincipal.TipoImpressora = Fiscal then
                  sCER := cECF_Numero_Contador_Gerencial(iECF_Modelo)
                else
                  sCER := '-1';

                // registrar Gerencial no banco de dados
                with frmmodulo do
                begin
                  spNao_Fiscal.Close;
                  spNao_Fiscal.parambyname('codigo').asstring := codifica_cupom;
                  spNao_fiscal.parambyname('ecf').asstring := sECF_Serial;
                  spNao_fiscal.ParamByName('data').asdatetime := dData_Sistema;

                  if frmPrincipal.TipoImpressora = Fiscal then
                    spNao_fiscal.ParamByName('hora').Astime := strtotime(copy(cECF_Data_Hora(iECF_Modelo),12,8))
                  else
                    spNao_fiscal.ParamByName('hora').Astime := strtotime( FormatDateTime('hh:mm:ss', now) );

                  spNao_fiscal.ParamByName('indice').asstring := 'RG';
                  spNao_fiscal.ParamByName('Descricao').asstring := 'RELAT�RIO GERENCIAL';
                  spNao_fiscal.ParamByName('valor').asfloat := 0;
                  spNao_fiscal.ParamByName('COO').asstring := sNumero_Cupom;
                  spNao_fiscal.ParamByName('GNF').asstring := sGNF;
                  spNao_fiscal.ParamByName('GRG').asstring := sGRG;
                  spNao_fiscal.ParamByName('CDC').Clear;
                  spNao_fiscal.ParamByName('DENOMINACAO').asstring := 'RG';
                  spNao_Fiscal.Prepare;
                  spNao_Fiscal.Execute;
                end;

                frmmodulo.query_servidor.close;
                frmmodulo.query_servidor.sql.clear;
                frmmodulo.query_servidor.sql.add('update r000001 set COO = '''+sNumero_Cupom+''',');
                frmmodulo.query_servidor.sql.add('CER = '''+sCER+''',');
                frmmodulo.query_servidor.sql.add('ecf = '''+sECF_Caixa+'''');
                frmmodulo.query_servidor.sql.add('where codigo = '+grid_venda.Cell[0,grid_venda.selectedrow].asstring);
                frmmodulo.query_servidor.ExecSQL;

              end;
            until sMsg = 'OK';
          end;

          tm_AtualizaTimer(frmMesas);

end;



end.
