unit splashpdv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, vcl.imaging.GIFImg, JvGIF, Vcl.ExtCtrls,
  Data.DB, MemDS, DBAccess, Uni, UniProvider, InterBaseUniProvider,inifiles,
  NxColumnClasses, NxColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, Vcl.XPMan, System.ImageList, Vcl.ImgList, AdvGlowButton,
  acPNG, JvExExtCtrls, JvImage, Vcl.StdCtrls, Vcl.ComCtrls, PageView,
  AdvMetroButton, AdvSmoothPanel, JPEG, AdvSmoothExpanderPanel;

  {Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ImgList, RzTray, NxColumnClasses,
  NxColumns, NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid, inifiles,
  DB, MemDS, DBAccess, Menus, pngimage, XPMan, sSkinManager, acPNG,
  PageView, AdvGlowButton, AdvMetroButton, AdvSmoothPanel,
  AdvSmoothExpanderPanel, UniProvider, InterBaseUniProvider, Uni,
  System.ImageList, JPEG, Consts, JvExExtCtrls, JvImage;}

type
  Tfrmsplashpdv = class(TForm)
    conexao_servidor: TUniConnection;
    conexao_pdv: TUniConnection;
    InterBaseUniProvider1: TInterBaseUniProvider;
    qrbanco: TUniQuery;
    qrIBPT: TUniQuery;
    qrIBPTCODIGO: TStringField;
    qrIBPTEX: TStringField;
    qrIBPTTABELA: TIntegerField;
    qrIBPTALIQNAC: TFloatField;
    qrIBPTALIQIMP: TFloatField;
    qrIBPTNCM: TStringField;
    qrConfServer: TUniQuery;
    qrConfServerACRESCIMO_PRODUTO: TFloatField;
    qrConfServerDESCONTO_PRODUTO: TFloatField;
    qrMovCartao: TUniQuery;
    qrPDV: TUniQuery;
    qrServidor: TUniQuery;
    qrServidor_Tabela: TUniQuery;
    qrcaixa_mov: TUniQuery;
    qrconfig: TUniQuery;
    qrpdv2: TUniQuery;
    qrCrediario: TUniQuery;
    qrMestre: TUniQuery;
    qrForma: TUniQuery;
    qrpdv3: TUniQuery;
    qrPDV_Tabela: TUniQuery;
    AdvSmoothExpanderPanel1: TAdvSmoothExpanderPanel;
    Label17: TLabel;
    AdvMetroButton2: TAdvMetroButton;
    pnTitulo: TPanel;
    PageView1: TPageView;
    PageSheet1: TPageSheet;
    Label1: TLabel;
    Image1: TImage;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    ed_server: TEdit;
    ed_server_database: TEdit;
    barra: TProgressBar;
    GroupBox1: TGroupBox;
    grid: TNextGrid;
    NxNumberColumn2: TNxNumberColumn;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    NxImageColumn1: TNxImageColumn;
    NxCheckBoxColumn1: TNxCheckBoxColumn;
    PageSheet2: TPageSheet;
    Memo1: TMemo;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    pnlAviso: TPanel;
    Panel1: TPanel;
    btgrfinanceiro: TAdvGlowButton;
    AdvGlowButton4: TAdvGlowButton;
    Timer1: TTimer;
    Timer3: TTimer;
    ImageList2: TImageList;
    ImageList1: TImageList;
    xpmnfst1: TXPManifest;
    procedure FormShow(Sender: TObject);
    procedure AdvMetroButton2Click(Sender: TObject);
    procedure btgrfinanceiroClick(Sender: TObject);
  private
    { Private declarations }
    function Cript(Action, Src: string): string;
    function codifica(tabela: string; qtde_digitos: integer): string;
    function Zerar(texto: string; qtde: integer): string; // Acrescentar Zeros a esquerda em uma String
    function verifica_conexao(tipo: string; server: string; base: string): boolean;
    function verifica_crediario(cod_cliente: string): Real;
    procedure AdicionarCaixas;
    procedure AdicionarUsuarios;
    procedure AdicionarVendedores;

  public
    { Public declarations }
    caixa: string;
    function Arredondar(Value: Extended; Decimals: integer): Extended;
  end;

var
  frmsplashpdv: Tfrmsplashpdv;
  sDir_sistema: string;
  H: THandle;
  fechar: boolean;

implementation

uses Math, md52;

function Tfrmsplashpdv.verifica_conexao(tipo: string; server: string; base: string): boolean;
begin
  if tipo = 'SERVIDOR' then
  begin
    try
      conexao_servidor.Connected := false;
      conexao_servidor.Server := server;
      conexao_servidor.Database := base;
      conexao_servidor.Connected := true;
      Result := true;
    except
      Result := false;
    end;
  end
  else
  begin
    try
      conexao_PDV.Connected := false;
      conexao_PDV.Server := server;
      conexao_PDV.Database := base;
      conexao_PDV.Connected := true;
      Result := true;
    except
      Result := false;
    end;

  end;
end;

procedure Tfrmsplashpdv.AdicionarVendedores;
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

procedure Tfrmsplashpdv.AdvMetroButton2Click(Sender: TObject);
begin
close;
FreeAndNil(frmsplashpdv);
end;

procedure Tfrmsplashpdv.btgrfinanceiroClick(Sender: TObject);
var
  I, x, y, iprest: INTEGER;
  scst: string;
  bflag: boolean;
  scod_cupom: string;
  scod_venda: string;
  bachou: boolean;

  //situacao caixa

  sit_caixa: string;

(* Lista de Formas de Pagamento que exigem tratamento especial no fechamento da venda*)
  lForma_pgto_Cheque_Avista, lForma_pgto_Cheque_Aprazo, lForma_pgto_Crediario,
    lForma_pgto_Cartao_Credito, lForma_pgto_Cartao_Debito, lForma_pgto_dinheiro,
    lForma_pgto_Convenio: String;

  rpercentual: Real;

  SCOD_REDUCAO: string;
  MemoryStream : TMemoryStream;
  Jpg : TJpegImage;
  Bitmap : TBitmap;
  iparcela, itotal_parcela: Integer;
  valorparcela, restante:Double;

begin
  try
    Timer1.Enabled := false;


    if conexao_servidor.Connected then
    begin
      try

        Screen.Cursor := crAppStart;
        pnlAviso.Left := 2;
        pnlAviso.Width := 450;
        pnlAviso.Visible := True;
        pnlAviso.Repaint;

        memo1.lines.add('Iniciando processo de atualiza��o em ' + DateToStr(date) + ' as ' + timetostr(time));

       // for I := 0 to grid.RowCount - 1 do
        begin
          if grid.Cell[4, i].AsBoolean then
          begin
            if verifica_conexao('PDV', grid.CELL[1, I].ASSTRING, GRID.CELL[2, I].ASSTRING) then
            begin
              grid.CELL[3, I].AsInteger := 0;
              //ShowMessage(grid.Cell[0,I].AsString);

               // E S T A C A O   PARA   S E R V I D O R

               // ------------- V E N D A S -------------------//

               //Inicio mizael
               //informar situacao caixa no retaguarda

              {qrServidor.Close;
              qrServidor.SQL.Clear;
              qrServidor.SQL.Add('update C000045 set situacao = :situacao, data = :data where codigo = :codigo'); //
              qrServidor.ParamByName('codigo').AsString := zerar(grid.Cell[0, I].AsString, 6);


              qrconfig.close;
              qrconfig.sql.clear;
              qrconfig.sql.add('select * from config');
              qrconfig.open;}

//              if qrconfig.FieldByName('CAIXA_SITUACAO').AsString = 'FECHADO' then
//                qrServidor.ParamByName('situacao').AsInteger := 2;

//              if qrconfig.FieldByName('CAIXA_SITUACAO').AsString = 'ABERTO' then
//                qrServidor.ParamByName('situacao').AsInteger := 1;

//              qrServidor.ParamByName('data').AsDate := qrconfig.FieldByName('CAIXA_DATA_MOVTO').AsDateTime;

//              qrServidor.ExecSQL;

              //final Mizael


              qrconfig.close;
              qrconfig.sql.clear;
              qrconfig.sql.add('select * from config');
              qrconfig.open;

              if qrconfig.RecordCount > 0 then
              begin

                lForma_pgto_Cheque_Avista := qrconfig.fieldbyname('forma_cheque').asstring;
                lForma_pgto_Cheque_Aprazo := qrconfig.fieldbyname('forma_cheque_aprazo').asstring;
                lForma_pgto_Cartao_Debito := qrconfig.fieldbyname('forma_cartao').asstring;
                lForma_pgto_Cartao_Credito := qrconfig.fieldbyname('forma_cartao_credito').asstring;
                lForma_pgto_Crediario := qrconfig.fieldbyname('forma_crediario').asstring;
                lForma_pgto_Convenio := qrconfig.fieldbyname('forma_convenio').asstring;
                lForma_pgto_Dinheiro := qrconfig.fieldbyname('forma_dinheiro').asstring;

                sit_caixa := qrconfig.fieldbyname('CAIXA_SITUACAO').asstring;

              end;



              qrpdv.close;
              qrpdv.sql.clear;
              qrpdv.sql.add('select * from nfce where ex = 0');
              qrpdv.open;
              qrpdv.first;
              while not qrpdv.eof do begin
                qrServidor.SQL.Add('insert into NFCE (NUMERO, DATA, TOTAL, CLIENTE, CHAVE, XML, SITUACAO, TROCO) values (:NUMERO, :DATA, :TOTAL, :CLIENTE, :CHAVE, :XML, :SITUACAO, :TROCO)');
                qrServidor.Params.ParamByName('NUMERO').AsInteger := qrpdv.FieldByName('NUMERO').AsInteger;
                qrServidor.Params.ParamByName('DATA').AsDateTime := qrpdv.FieldByName('DATA').AsDateTime;
                qrServidor.Params.ParamByName('TOTAL').AsFloat := qrpdv.FieldByName('TOTAL').AsFloat;
                qrServidor.Params.ParamByName('CLIENTE').AsString := qrpdv.FieldByName('CLIENTE').AsString;
                qrServidor.Params.ParamByName('CHAVE').AsString := qrpdv.FieldByName('CHAVE').AsString;
                qrServidor.Params.ParamByName('XML').AsString := qrpdv.FieldByName('XML').AsString;
                qrServidor.Params.ParamByName('SITUACAO').AsInteger := qrpdv.FieldByName('SITUACAO').AsInteger;
                qrServidor.Params.ParamByName('TROCO').AsFloat := qrpdv.FieldByName('TROCO').AsFloat;
                qrServidor.ExecSQL;

                qrPDV_Tabela.close;
                qrPDV_Tabela.SQL.clear;
                qrPDV_Tabela.sql.Add('update nfce set ex = 1 where NUMERO = ' + qrpdv.fieldbyname('NUMERO').asstring);
                qrPDV_Tabela.ExecSQL;
                qrpdv.Next;
              end;

              qrpdv.close;
              qrpdv.sql.clear;
              qrpdv.sql.add('select * from cupom where ex = 0');
              qrpdv.open;
              qrpdv.first;
              while not qrpdv.eof do
              begin
                Application.ProcessMessages;

                scod_cupom := qrpdv.fieldbyname('codigo').asstring;
                scod_venda := codifica('000048', 7);

                qrServidor.close;
                qrServidor.sql.clear;
                qrServidor.sql.add('insert into c000048');
                qrServidor.sql.add('(codigo,data,codcliente,codvendedor,');
                qrServidor.sql.add('codcaixa,total,subtotal,meio_dinheiro,');
                qrServidor.sql.add('meio_chequeav, meio_chequeap,meio_cartaocred,');
                qrServidor.SQL.add('meio_cartaodeb,meio_crediario,meio_convenio, desconto,acrescimo,');
                qrServidor.sql.add('cupom_fiscal,numero_cupom_fiscal, ECF_SERIAL, situacao, contingencia, gerado_nfce)');
                qrServidor.sql.add('values');
                qrServidor.sql.add('(:codigo,:datax,:codcliente,:codvendedor,');
                qrServidor.sql.add(':codcaixa,:TOTAL,:SUBTOTAL,:DINHEIRO,');
                qrServidor.sql.add(':CHEQUEAV,:CHEQUEAP,:CARTAOCRED,');
                qrServidor.SQL.add(':CARTAODEB,:CREDIARIO,:CONVENIO,:DESCONTO,:ACRESCIMO,');
                qrServidor.sql.add(':cupom_fiscal,:numero_cupom_fiscal, :ECF_SERIAL, :situacao, :contingencia, :gerado_nfce)');

                qrServidor.Params.ParamByName('codigo').asstring := scod_venda;
                qrServidor.Params.ParamByName('codcliente').asstring := Zerar(qrpdv.fieldbyname('cod_cliente').asstring, 6);
                qrServidor.Params.ParamByName('codCAIXA').asstring := zerar(qrpdv.fieldbyname('cod_caixa').asstring, 6);
                qrServidor.Params.ParamByName('numero_cupom_fiscal').asstring := qrpdv.fieldbyname('numero').asstring;
                qrServidor.Params.ParamByName('codvendedor').asstring := zerar(qrpdv.fieldbyname('cod_vendedor').asstring, 6);
                qrServidor.Params.ParamByName('cupom_fiscal').asINTEGER := 1;
                qrServidor.params.parambyname('ecf_serial').asstring := qrPDV.fieldbyname('ecf').asstring;

                qrServidor.Params.ParamByName('datax').asdatetime := qrpdv.fieldbyname('data').asdatetime;
                qrServidor.Params.ParamByName('TOTAL').asFLOAT := qrpdv.fieldbyname('valor_total').asfloat;
                qrServidor.Params.ParamByName('SUBTOTAL').asFLOAT := qrpdv.fieldbyname('valor_produto').asfloat;
                qrServidor.Params.ParamByName('DESCONTO').asFLOAT := qrpdv.fieldbyname('valor_desconto').asfloat;
                qrServidor.Params.ParamByName('ACRESCIMO').asFLOAT := qrpdv.fieldbyname('valor_acrescimo').asfloat;

                qrServidor.Params.ParamByName('DINHEIRO').asFLOAT := 0;
                qrServidor.Params.ParamByName('CHEQUEAV').asFLOAT := 0;
                qrServidor.Params.ParamByName('CHEQUEAP').asFLOAT := 0;
                qrServidor.Params.ParamByName('CARTAODEB').asFLOAT := 0;
                qrServidor.Params.ParamByName('CARTAOCRED').asFLOAT := 0;
                qrServidor.Params.ParamByName('CREDIARIO').asFLOAT := 0;
                qrServidor.Params.ParamByName('CONVENIO').asFLOAT := 0;
                qrServidor.params.parambyname('situacao').asinteger := qrpdv.fieldbyname('cancelado').asinteger + 1;

                qrServidor.params.parambyname('contingencia').asstring := qrPDV.fieldbyname('contingencia').asstring;
                qrServidor.params.parambyname('gerado_nfce').asstring := qrPDV.fieldbyname('gerado_nfce').asstring;

                qrForma.close;
                qrForma.sql.clear;
                qrForma.sql.add('select * from cupom_forma');
                qrforma.sql.add('where cod_cupom = ''' + scod_cupom + '''');
                qrforma.Open;


                qrforma.first;
                while not qrforma.eof do
                begin
                  Application.ProcessMessages;

                  bachou := false;
                  if not bachou then
                  begin
                    if AnsiUpperCase(qrforma.fieldbyname('forma').asstring) =
                      AnsiUpperCase(lForma_pgto_dinheiro) then
                    begin
                      qrServidor.Params.ParamByName('DINHEIRO').asFLOAT :=
                        qrServidor.Params.ParamByName('DINHEIRO').asFLOAT +
                        qrforma.fieldbyname('valor').asfloat;

                    // lancamento do caixa
                      qrcaixa_mov.close;
                      qrcaixa_mov.sql.clear;
                      qrcaixa_mov.sql.add('insert into c000044');
                      qrcaixa_mov.sql.add('(codigo,codcaixa,codoperador,data,entrada,valor,codconta,movimento,historico)');
                      qrcaixa_mov.sql.add('values');
                      qrcaixa_mov.sql.add('(''' + codifica('000044', 7) + ''',''' + zerar(qrpdv.fieldbyname('cod_caixa').asstring, 6) + ''',''' + zerar(qrpdv.fieldbyname('cod_vendedor').asstring, 6) + ''',:datax,');
                      qrcaixa_mov.sql.add(':VALOR,:VALOR,''100001'',3,''Venda DINHEIRO - ECF No. ' + qrpdv.fieldbyname('numero').asstring + ''')');
                      qrcaixa_mov.Params.ParamByName('datax').asdatetime := qrpdv.fieldbyname('data').asdatetime;

                    // Se a FORMA DINHEIRO for > que o valor total
                      if qrforma.fieldbyname('valor').asfloat > qrpdv.fieldbyname('valor_total').asfloat then
                        QRCAIXA_MOV.Params.ParamByName('VALOR').ASFLOAT := qrpdv.fieldbyname('valor_total').asfloat
                      else // Se a FORMA dinheiro for o mesmo valor total
                        if qrforma.fieldbyname('valor').asfloat = qrpdv.fieldbyname('valor_total').asfloat then
                          QRCAIXA_MOV.Params.ParamByName('VALOR').ASFLOAT := qrforma.fieldbyname('valor').asfloat
                        else
                          QRCAIXA_MOV.Params.ParamByName('VALOR').ASFLOAT := qrforma.fieldbyname('valor').asfloat - qrpdv.fieldbyname('valor_troco').asfloat;

                      qrcaixa_mov.ExecSQL;

                      bachou := true;
                    end;
                  end;
                  if not bachou then
                  begin
                    if (AnsiUpperCase(qrforma.fieldbyname('forma').asstring) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
                       (AnsiUpperCase(qrforma.fieldbyname('forma').asstring) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then
                    begin
                      qrServidor.Params.ParamByName('chequeav').asFLOAT :=
                        qrServidor.Params.ParamByName('chequeav').asFLOAT +
                        qrforma.fieldbyname('valor').asfloat;

                    // lancamento do caixa
                      qrcaixa_mov.close;
                      qrcaixa_mov.sql.clear;
                      qrcaixa_mov.sql.add('insert into c000044');
                      qrcaixa_mov.sql.add('(codigo,codcaixa,codoperador,data,entrada,valor,codconta,movimento,historico)');
                      qrcaixa_mov.sql.add('values');
                      qrcaixa_mov.sql.add('(''' + codifica('000044', 7) + ''',''' + zerar(qrpdv.fieldbyname('cod_caixa').asstring, 6) + ''',''' + zerar(qrpdv.fieldbyname('cod_vendedor').asstring, 6) + ''',:datax,');
                      if (AnsiUpperCase(qrforma.fieldbyname('forma').asstring) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) then
                        qrcaixa_mov.sql.add('0,:VALOR,''100002'',5,''Venda DEPOSITO/TRANSFERENCIA - ECF No. ' + qrpdv.fieldbyname('numero').asstring + ''')')
                      else
                        qrcaixa_mov.sql.add('0,:VALOR,''100002'',6,''Venda CHEQUE APRAZO - ECF No. ' + qrpdv.fieldbyname('numero').asstring + ''')');
                      qrcaixa_mov.Params.ParamByName('datax').asdatetime := qrpdv.fieldbyname('data').asdatetime;
                      // Se a FORMA cheque for > que o valor total
                      if qrforma.fieldbyname('valor').asfloat > qrpdv.fieldbyname('valor_total').asfloat then
                        QRCAIXA_MOV.Params.ParamByName('VALOR').ASFLOAT := qrpdv.fieldbyname('valor_total').asfloat
                      else // Se a FORMA dinheiro for o mesmo valor total
                        if qrforma.fieldbyname('valor').asfloat = qrpdv.fieldbyname('valor_total').asfloat then
                          QRCAIXA_MOV.Params.ParamByName('VALOR').ASFLOAT := qrforma.fieldbyname('valor').asfloat
                        else
                          QRCAIXA_MOV.Params.ParamByName('VALOR').ASFLOAT := qrforma.fieldbyname('valor').asfloat - qrpdv.fieldbyname('valor_troco').asfloat;
                      qrcaixa_mov.ExecSQL;
                        bachou := true;
                    end;
                  end;
                  if not bachou then
                  begin
                    if (AnsiUpperCase(qrforma.fieldbyname('forma').asstring) = AnsiUpperCase(lForma_pgto_Cartao_Credito)) or
                       (AnsiUpperCase(qrforma.fieldbyname('forma').asstring) = AnsiUpperCase(lForma_pgto_Cartao_Debito)) then
                    begin
                      qrServidor.Params.ParamByName('cartaocred').asFLOAT := qrServidor.Params.ParamByName('cartaocred').asFLOAT + qrforma.fieldbyname('valor').asfloat;

                    // lancamento do caixa
                      qrcaixa_mov.close;
                      qrcaixa_mov.sql.clear;
                      qrcaixa_mov.sql.add('insert into c000044');
                      qrcaixa_mov.sql.add('(codigo,codcaixa,codoperador,data,entrada,valor,codconta,movimento,historico)');
                      qrcaixa_mov.sql.add('values');
                      qrcaixa_mov.sql.add('(''' + codifica('000044', 7) + ''',''' + zerar(qrpdv.fieldbyname('cod_caixa').asstring, 6) + ''',''' + zerar(qrpdv.fieldbyname('cod_vendedor').asstring, 6) + ''',:datax,');
                      if (AnsiUpperCase(qrforma.fieldbyname('forma').asstring) = AnsiUpperCase(lForma_pgto_Cartao_Credito)) then
                        qrcaixa_mov.sql.add('0,:VALOR,''100003'',7,''Venda CARTAO CREDITO - ECF No. ' + qrpdv.fieldbyname('numero').asstring + ''')')
                      else
                        qrcaixa_mov.sql.add('0,:VALOR,''100003'',8,''Venda CARTAO DEBITO - ECF No. ' + qrpdv.fieldbyname('numero').asstring + ''')');
                      qrcaixa_mov.Params.ParamByName('datax').asdatetime := qrpdv.fieldbyname('data').asdatetime;
                      QRCAIXA_MOV.Params.ParamByName('VALOR').ASFLOAT := qrforma.fieldbyname('valor').asfloat;
                      qrcaixa_mov.ExecSQL;




                      if qrforma.fieldbyname('tipocartao').asstring = 'C' then begin
                        qrbanco.close;
                        qrbanco.sql.clear;
                        qrbanco.sql.add('select * from c000013');
                        qrbanco.sql.add('where numero = ' + QuotedStr(Zerar(qrforma.fieldbyname('banco').asstring,3)));
                        qrbanco.Open;
                        itotal_parcela := qrForma.FieldByName('prestacao').AsInteger;
                        for iparcela := 1 to itotal_parcela do begin
                          qrMovCartao.close;
                          qrMovCartao.sql.clear;
                          qrMovCartao.sql.add('insert into c000124');
                          qrMovCartao.sql.add('(codigo, cod_venda, banco, cod_cliente, data_venda, valor, comissao,');
                          qrMovCartao.sql.add('liquido, data_recebimento, situacao, tipo, parcela, valor_total)');
                          qrMovCartao.sql.add('values');
                          qrMovCartao.sql.add('(:codigo, :cod_venda, :banco, :cod_cliente, :data_venda, :valor, :comissao,');
                          qrMovCartao.sql.add(':liquido, :data_recebimento, :situacao, :tipo, :parcela, :valor_total)');
                          qrMovCartao.parambyname('codigo').asstring := codifica('000124',6);
                          qrMovCartao.parambyname('cod_venda').asstring := qrpdv.FieldByName('numero').AsString;
                          qrMovCartao.parambyname('banco').asstring := Zerar(qrForma.FieldByName('banco').AsString,3);
                          qrMovCartao.parambyname('cod_cliente').asstring := Zerar(qrpdv.FieldByName('cod_cliente').AsString,6);
                          qrMovCartao.parambyname('data_venda').asdatetime := qrpdv.FieldByName('data').AsDateTime;
                          // valor da parcela
                          valorparcela := RoundTo(qrForma.FieldByName('valor').AsFloat / itotal_parcela,-2);
                          restante :=  qrForma.FieldByName('valor').AsFloat - (valorparcela * itotal_parcela);
                          if iparcela = itotal_parcela then
                            if restante <> 0 then
                              qrMovCartao.parambyname('valor').AsFloat := valorparcela + restante
                            else
                              qrMovCartao.parambyname('valor').AsFloat := valorparcela
                          else
                            qrMovCartao.parambyname('valor').AsFloat := valorparcela;

                          if qrbanco.FieldByName('comissao_CREDITO').AsFloat > 0 then begin
                            qrMovCartao.parambyname('comissao').AsFloat := valorparcela * (qrbanco.FieldByName('comissao_CREDITO').AsFloat / 100);
                            qrMovCartao.parambyname('liquido').AsFloat := valorparcela - (valorparcela * (qrbanco.FieldByName('comissao_CREDITO').AsFloat / 100));
                          end else begin
                            qrMovCartao.parambyname('comissao').AsFloat := 0;
                            qrMovCartao.parambyname('liquido').AsFloat := valorparcela;
                          end;
                          qrMovCartao.parambyname('data_recebimento').asdatetime := qrpdv.FieldByName('data').AsDateTime + (qrbanco.FieldByName('rec_CREDITO').AsInteger*iparcela);
                          // cair todas no mesmo dia quem fica devendo � o cliente
                          qrMovCartao.parambyname('situacao').asstring := 'ABERTO';
                          qrMovCartao.parambyname('tipo').asstring := 'CREDITO';
                          qrMovCartao.parambyname('parcela').AsInteger := iparcela;
                          qrMovCartao.parambyname('valor_total').AsFloat := qrForma.FieldByName('valor').AsFloat;
                          qrMovCartao.ExecSQL;
                        end;
                      end;

                      if qrforma.fieldbyname('tipocartao').asstring = 'D' then begin
                        qrbanco.close;
                        qrbanco.sql.clear;
                        qrbanco.sql.add('select * from c000013');
                        qrbanco.sql.add('where numero = ' + QuotedStr(Zerar(qrforma.fieldbyname('banco').asstring,3)));
                        qrbanco.Open;
                        itotal_parcela := qrForma.FieldByName('prestacao').AsInteger;
                        for iparcela := 1 to itotal_parcela do begin
                          qrMovCartao.close;
                          qrMovCartao.sql.clear;
                          qrMovCartao.sql.add('insert into c000124');
                          qrMovCartao.sql.add('(codigo, cod_venda, banco, cod_cliente, data_venda, valor, comissao,');
                          qrMovCartao.sql.add('liquido, data_recebimento, situacao, tipo, parcela, valor_total)');
                          qrMovCartao.sql.add('values');
                          qrMovCartao.sql.add('(:codigo, :cod_venda, :banco, :cod_cliente, :data_venda, :valor, :comissao,');
                          qrMovCartao.sql.add(':liquido, :data_recebimento, :situacao, :tipo, :parcela, :valor_total)');
                          qrMovCartao.parambyname('codigo').asstring := codifica('000124',6);
                          qrMovCartao.parambyname('cod_venda').asstring := qrpdv.FieldByName('numero').AsString;
                          qrMovCartao.parambyname('banco').asstring := Zerar(qrForma.FieldByName('banco').AsString,3);
                          qrMovCartao.parambyname('cod_cliente').asstring := Zerar(qrpdv.FieldByName('cod_cliente').AsString,6);
                          qrMovCartao.parambyname('data_venda').asdatetime := qrpdv.FieldByName('data').AsDateTime;
                          // valor da parcela

                          valorparcela := RoundTo(qrForma.FieldByName('valor').AsFloat / itotal_parcela,-2);
                          restante :=  qrForma.FieldByName('valor').AsFloat - (valorparcela * itotal_parcela);
                          if iparcela = itotal_parcela then
                            if restante <> 0 then
                              qrMovCartao.parambyname('valor').AsFloat := valorparcela + restante
                            else
                              qrMovCartao.parambyname('valor').AsFloat := valorparcela
                          else
                            qrMovCartao.parambyname('valor').AsFloat := valorparcela;

                          if qrbanco.FieldByName('comissao_DEBITO').AsFloat > 0 then begin
                            qrMovCartao.parambyname('comissao').AsFloat := valorparcela * (qrbanco.FieldByName('comissao_DEBITO').AsFloat / 100);
                            qrMovCartao.parambyname('liquido').AsFloat := valorparcela - (valorparcela * (qrbanco.FieldByName('comissao_DEBITO').AsFloat / 100));
                          end else begin
                            qrMovCartao.parambyname('comissao').AsFloat := 0;
                            qrMovCartao.parambyname('liquido').AsFloat := valorparcela;
                          end;
                          //
                          qrMovCartao.parambyname('data_recebimento').asdatetime := qrpdv.FieldByName('data').AsDateTime + (qrbanco.FieldByName('rec_DEBITO').AsInteger);
                          qrMovCartao.parambyname('situacao').asstring := 'ABERTO';
                          qrMovCartao.parambyname('tipo').asstring := 'DEBITO';
                          qrMovCartao.parambyname('parcela').AsInteger := iparcela;
                          qrMovCartao.parambyname('valor_total').AsFloat := qrForma.FieldByName('valor').AsFloat;
                          qrMovCartao.ExecSQL;
                        end;
                      end;


                      bachou := true;
                    end;
                  end;
                  if not bachou then
                  begin
                    if AnsiUpperCase(qrforma.fieldbyname('forma').asstring) =
                      AnsiUpperCase(lForma_pgto_Crediario) then
                    begin
                      qrServidor.Params.ParamByName('crediario').asFLOAT :=
                        qrServidor.Params.ParamByName('crediario').asFLOAT +
                        qrforma.fieldbyname('valor').asfloat;

                    // lancamento do caixa
                      qrcaixa_mov.close;
                      qrcaixa_mov.sql.clear;
                      qrcaixa_mov.sql.add('insert into c000044');
                      qrcaixa_mov.sql.add('(codigo,codcaixa,codoperador,data,entrada,valor,codconta,movimento,historico)');
                      qrcaixa_mov.sql.add('values');
                      qrcaixa_mov.sql.add('(''' + codifica('000044', 7) + ''',''' + zerar(qrpdv.fieldbyname('cod_caixa').asstring, 6) + ''',''' + zerar(qrpdv.fieldbyname('cod_vendedor').asstring, 6) + ''',:datax,');
                      qrcaixa_mov.sql.add('0,:VALOR,''100004'',4,''Venda APRAZO - ECF No. ' + qrpdv.fieldbyname('numero').asstring + ''')');
                      qrcaixa_mov.Params.ParamByName('datax').asdatetime := qrpdv.fieldbyname('data').asdatetime;
                      QRCAIXA_MOV.Params.ParamByName('VALOR').ASFLOAT := qrforma.fieldbyname('valor').asfloat;
//                      QRCAIXA_MOV.Params.ParamByName('VALOR').ASFLOAT := qrpdv.fieldbyname('valor_total').asfloat;
                      qrcaixa_mov.ExecSQL;


                      bachou := true;
                    end;
                  end;
                  if not bachou then
                  begin
                    if AnsiUpperCase(qrforma.fieldbyname('forma').asstring) =
                      AnsiUpperCase(lForma_pgto_Convenio) then
                    begin
                      qrServidor.Params.ParamByName('convenio').asFLOAT :=
                        qrServidor.Params.ParamByName('convenio').asFLOAT +
                        qrforma.fieldbyname('valor').asfloat;

                    // lancamento do caixa
                      qrcaixa_mov.close;
                      qrcaixa_mov.sql.clear;
                      qrcaixa_mov.sql.add('insert into c000044');
                      qrcaixa_mov.sql.add('(codigo,codcaixa,codoperador,data,entrada,valor,codconta,movimento,historico)');
                      qrcaixa_mov.sql.add('values');
                      qrcaixa_mov.sql.add('(''' + codifica('000044', 7) + ''',''' + zerar(qrpdv.fieldbyname('cod_caixa').asstring, 6) + ''',''' + zerar(qrpdv.fieldbyname('cod_vendedor').asstring, 6) + ''',:datax,');
                      qrcaixa_mov.sql.add('0,:VALOR,''100005'',40,''Venda DEPOSITO/TRANSFERENCIA - ECF No. ' + qrpdv.fieldbyname('numero').asstring + ''')');
                      qrcaixa_mov.Params.ParamByName('datax').asdatetime := qrpdv.fieldbyname('data').asdatetime;
                      QRCAIXA_MOV.Params.ParamByName('VALOR').ASFLOAT := qrforma.fieldbyname('valor').asfloat;
                      //QRCAIXA_MOV.Params.ParamByName('VALOR').ASFLOAT := qrpdv.fieldbyname('valor_total').asfloat;
                      qrcaixa_mov.ExecSQL;


                      bachou := true;
                    end;
                  end;
                  qrforma.next;
                end;
                qrServidor.ExecSQL;


                if qrpdv.fieldbyname('cancelado').asinteger = 0 then
                begin
              // contas a receber
                  qrPDV2.close;
                  qrPDV2.sql.clear;
                  qrPDV2.sql.add('select * from cupom_crediario');
                  qrPDV2.sql.add('where cod_cupom = ''' + scod_cupom + '''');
                  qrPDV2.open;
                  qrPDV2.first;
                  iprest := 1;

                  while not qrPDV2.eof do
                  begin
                    Application.ProcessMessages;

                    qrServidor.Close;
                    qrServidor.SQL.clear;
                    qrServidor.SQL.add('insert into c000049');
                    qrServidor.SQL.add('(codigo,codvenda,codcliente,codvendedor,codcaixa,data_emissao,data_vencimento,valor_original,');
                    qrServidor.SQL.add('valor_atual,documento,tipo,situacao,filtro)');
                    qrServidor.SQL.add('values');
                    qrServidor.SQL.add('(:codigo,:codvenda,:codcliente,:codvendedor,:codcaixa,:data_emissao,:data_vencimento,:valor_original,');
                    qrServidor.SQL.add(':valor_atual,:documento,:tipo,:situacao,:filtro)');

                    qrServidor.Params.ParamByName('codigo').asstring := Scod_venda + '/' + zerar(inttostr(iprest), 2);
                    qrServidor.Params.ParamByName('codvenda').asstring := scod_venda;
                    qrServidor.Params.ParamByName('codcliente').asstring := zerar(qrPDV2.fieldbyname('cod_cliente').asstring, 6);
                    qrServidor.Params.ParamByName('codvendedor').asstring := zerar(qrpdv.FIELDBYNAME('cod_vendedor').ASstring, 6);
                    qrServidor.Params.ParamByName('codcaixa').asstring := zerar(qrpdv.fieldbyname('cod_caixa').asstring, 6);
                    qrServidor.Params.ParamByName('documento').asstring := scod_venda + '/' + zerar(inttostr(iprest), 2);
                    qrServidor.Params.ParamByName('tipo').asstring := COPY(qrPDV2.fieldbyname('descricao').asstring, 1, 20);
                    qrServidor.Params.ParamByName('filtro').asinteger := 0;
                    qrServidor.Params.ParamByName('situacao').asinteger := 1;
                    qrServidor.Params.ParamByName('data_vencimento').asdatetime := qrPDV2.FIELDBYNAME('vencimento').ASDATETIME;
                    qrServidor.Params.ParamByName('data_emissao').asdatetime := qrpdv.fieldbyname('data').asfloat;
                    qrServidor.PARAMS.ParamByName('valor_atual').ASFLOAT := qrPDV2.fieldbyname('valor').asfloat;
                    qrServidor.PARAMS.ParamByName('valor_original').ASFLOAT := qrPDV2.fieldbyname('valor').asfloat;
                    qrServidor.ExecSQL;
                    inc(iprest);
                    qrPDV2.next;
                  end;
                end;
            // produtos
                qrPDV3.close;
                qrPDV3.sql.clear;
                qrPDV3.sql.add('select * from CUPOM_ITEM');
                qrPDV3.sql.add('where cod_cupom = ''' + scod_cupom + '''');
                qrPDV3.sql.add('and cancelado = 0');
                qrPDV3.open;
                qrPDV3.first;

                while not qrPDV3.eof do
                begin
                  Application.ProcessMessages;

                  qrServidor.CLOSE;
                  qrServidor.SQL.CLEAR;
                  qrServidor.SQL.Add('insert into c000032');
                  qrServidor.SQL.add('(codigo,codnota,serial,numeronota,');
                  qrServidor.SQL.add('codproduto,qtde,movimento_estoque,unitario,desconto,acrescimo,');
                  qrServidor.SQL.add('total,unidade,aliquota,');
                  qrServidor.SQL.add('cupom_item,cupom_numero,cupom_modelo,');
                  qrServidor.SQL.add('ecf_serie,ecf_caixa,codcliente,codvendedor,movimento,data,cst,');
                  qrServidor.sql.add('base_calculo, valor_icms)');
                  qrServidor.SQL.add('values');

                  qrServidor.SQL.add('(:codigo,:codnota,:serial,:numeronota,');
                  qrServidor.SQL.add(':codproduto,:qtde,:movimento_estoque,:unitario,:desconto,:acrescimo,');
                  qrServidor.SQL.add(':total,:unidade,:aliquota,');
                  qrServidor.SQL.add(':cupom_item,:cupom_numero,:cupom_modelo,');
                  qrServidor.SQL.add(':ecf_serie,:ecf_caixa,:codcliente,:codvendedor,:movimento,:data,:cst,');
                  qrServidor.sql.add(':base_calculo, :valor_icms)');

                  qrServidor.Params.ParamByName('CODIGO').ASSTRING := codifica('000032', 10);
                  qrServidor.Params.ParamByName('CODNOTA').ASSTRING := scod_venda;
                  qrServidor.Params.ParamByName('SERIAL').ASSTRING := '';
                  qrServidor.Params.ParamByName('NUMERONOTA').ASSTRING := qrpdv.fieldbyname('numero').asstring;
                  qrServidor.Params.ParamByName('CODPRODUTO').ASSTRING := zerar(qrPDV3.fieldbyname('cod_produto').asstring, 6);
                  qrServidor.Params.ParamByName('CODCLIENTE').ASSTRING := zerar(qrpdv.FIELDBYNAME('COD_CLIENTE').ASSTRING, 6);
                  qrServidor.Params.ParamByName('CODVENDEDOR').ASSTRING := zerar(qrpdv.FIELDBYNAME('COD_VENDEDOR').ASSTRING, 6);

                  qrServidor.Params.ParamByName('QTDE').ASFLOAT := qrPDV3.FIELDBYNAME('QTDE').ASFLOAT;
                  qrServidor.Params.ParamByName('MOVIMENTO_ESTOQUE').ASFLOAT := -qrPDV3.FIELDBYNAME('QTDE').ASFLOAT;
                  qrServidor.Params.ParamByName('ALIQUOTA').ASFLOAT := qrPDV3.FIELDBYNAME('ALIQUOTA').ASFLOAT;

                  qrServidor.Params.ParamByName('UNIDADE').ASSTRING := qrPDV3.FIELDBYNAME('UNIDADE').ASSTRING;
                  qrServidor.Params.ParamByName('CST').ASSTRING := qrPDV3.FIELDBYNAME('CST').ASSTRING;
                  qrServidor.Params.ParamByName('MOVIMENTO').ASINTEGER := 2;
                  qrServidor.Params.ParamByName('DATA').ASDATETIME := qrpdv.FIELDBYNAME('DATA').ASDATETIME;
                  qrServidor.Params.ParamByName('ECF_CAIXA').ASSTRING := qrPDV.fieldbyname('ECF_CAIXA').ASSTRING;
                  qrServidor.Params.ParamByName('ECF_SERIE').ASSTRING := qrpdv.FIELDBYNAME('ECF').ASSTRING;
                  qrServidor.Params.ParamByName('CUPOM_NUMERO').ASSTRING := qrpdv.FIELDBYNAME('NUMERO').ASSTRING;
                  qrServidor.Params.ParamByName('CUPOM_ITEM').ASSTRING := zerar(qrPDV3.FIELDBYNAME('ITEM').ASSTRING, 3);
                  qrServidor.Params.ParamByName('CUPOM_MODELO').ASSTRING := '2D';

                  if qrpdv.fieldbyname('valor_desconto').asfloat > 0 then
                  begin
                    qrServidor.params.parambyname('acrescimo').asfloat := qrPDV3.fieldbyname('valor_acrescimo').asfloat;
                    rPercentual := qrpdv.fieldbyname('valor_desconto').asfloat / qrpdv.fieldbyname('valor_produto').asfloat;

                    qrServidor.params.parambyname('desconto').asfloat := qrPDV3.fieldbyname('valor_desconto').asfloat +
                      (qrPDV3.FIELDBYNAME('VALOR_TOTAL').ASFLOAT * rPercentual);
                    qrServidor.Params.ParamByName('UNITARIO').ASFLOAT := qrPDV3.FIELDBYNAME('VALOR_UNITARIO').ASFLOAT;

                    qrServidor.Params.ParamByName('TOTAL').ASFLOAT := qrPDV3.FIELDBYNAME('VALOR_TOTAL').ASFLOAT -
                      (qrPDV3.FIELDBYNAME('VALOR_TOTAL').ASFLOAT * rPercentual);

                    if (qrPDV3.fieldbyname('aliquota').asfloat > 0) and
                      (qrPDV3.fieldbyname('cst').asstring = '000') then
                    begin
                      qrServidor.Params.ParamByName('base_calculo').ASFLOAT := qrServidor.Params.ParamByName('TOTAL').ASFLOAT;
                      qrServidor.Params.ParamByName('valor_icms').ASFLOAT := qrServidor.Params.ParamByName('TOTAL').ASFLOAT * qrPDV3.FIELDBYNAME('aliquota').ASFLOAT / 100;
                    end
                    else
                    begin
                      qrServidor.Params.ParamByName('base_calculo').ASFLOAT := 0;
                      qrServidor.Params.ParamByName('valor_icms').ASFLOAT := 0;
                    end;
                  end
                  else
                  begin
                    if qrpdv.fieldbyname('Valor_acrescimo').asfloat > 0 then
                    begin
                      qrServidor.params.parambyname('desconto').asfloat := qrPDV3.fieldbyname('valor_desconto').asfloat;

                      rPercentual := qrpdv.fieldbyname('valor_acrescimo').asfloat / qrpdv.fieldbyname('valor_produto').asfloat;

                      qrServidor.params.parambyname('acrescimo').asfloat := qrPDV3.fieldbyname('valor_acrescimo').asfloat +
                        (qrPDV3.FIELDBYNAME('VALOR_TOTAL').ASFLOAT * rPercentual);
                      qrServidor.Params.ParamByName('UNITARIO').ASFLOAT := qrPDV3.FIELDBYNAME('VALOR_UNITARIO').ASFLOAT;

                      qrServidor.Params.ParamByName('TOTAL').ASFLOAT := qrPDV3.FIELDBYNAME('VALOR_TOTAL').ASFLOAT +
                        (qrPDV3.FIELDBYNAME('VALOR_TOTAL').ASFLOAT * rPercentual);

                      if (qrPDV3.fieldbyname('aliquota').asfloat > 0) and
                        (qrPDV3.fieldbyname('cst').asstring = '000') then
                      begin
                        qrServidor.Params.ParamByName('base_calculo').ASFLOAT := qrServidor.Params.ParamByName('TOTAL').ASFLOAT;
                        qrServidor.Params.ParamByName('valor_icms').ASFLOAT := qrServidor.Params.ParamByName('TOTAL').ASFLOAT * qrPDV3.FIELDBYNAME('aliquota').ASFLOAT / 100;
                      end
                      else
                      begin
                        qrServidor.Params.ParamByName('base_calculo').ASFLOAT := 0;
                        qrServidor.Params.ParamByName('valor_icms').ASFLOAT := 0;
                      end;
                    end
                    else
                    begin
                      qrServidor.params.parambyname('desconto').asfloat := qrPDV3.fieldbyname('valor_desconto').asfloat;
                      qrServidor.params.parambyname('acrescimo').asfloat := qrPDV3.fieldbyname('valor_acrescimo').asfloat;
                      qrServidor.Params.ParamByName('UNITARIO').ASFLOAT := qrPDV3.FIELDBYNAME('VALOR_UNITARIO').ASFLOAT;
                      qrServidor.Params.ParamByName('TOTAL').ASFLOAT := qrPDV3.FIELDBYNAME('VALOR_TOTAL').ASFLOAT;
                      if (qrPDV3.fieldbyname('aliquota').asfloat > 0) and
                        (qrPDV3.fieldbyname('cst').asstring = '000') then
                      begin
                        qrServidor.Params.ParamByName('base_calculo').ASFLOAT := qrPDV3.FIELDBYNAME('VALOR_TOTAL').ASFLOAT;
                        qrServidor.Params.ParamByName('valor_icms').ASFLOAT := qrPDV3.FIELDBYNAME('VALOR_TOTAL').ASFLOAT * qrPDV3.FIELDBYNAME('aliquota').ASFLOAT / 100;
                      end
                      else
                      begin
                        qrServidor.Params.ParamByName('base_calculo').ASFLOAT := 0;
                        qrServidor.Params.ParamByName('valor_icms').ASFLOAT := 0;
                      end;
                    end;
                  end;
                  qrServidor.ExecSQL;
                  qrPDV3.next;
                end;

                try
                  qrPDV_Tabela.close;
                  qrPDV_Tabela.SQL.clear;
                  qrPDV_Tabela.sql.Add('update cupom set ex = 1 where codigo = ''' + qrpdv.fieldbyname('codigo').asstring + '''');
                  qrPDV_Tabela.ExecSQL;
                except
                  on E: Exception do
                  begin
                    Memo1.Lines.Add('Erro na gravacao do Cupom - Mensagem: ' + E.Message);
                  end;
                end;
                qrpdv.Next;
              end;



              try
               // Atualizacao das reducoes z


                qrPDV.close;
                qrPDV.sql.clear;
                qrPDV.sql.add('select * from reducaoz where ex = 0');
                qrPDV.open;

                qrPDV.first;
                while not qrPDV.eof do
                begin
                  Application.ProcessMessages;

                  qrPDV3.close;
                  qrPDV3.sql.clear;
                  qrPDV3.sql.add('select * from reducaoz_total_parcial');
                  qrPDV3.sql.add('where cod_reducaoz = ''' + qrPDV.fieldbyname('codigo').asstring + '''');
                  qrPDV3.open;

                  qrServidor.CLOSE;
                  qrServidor.SQL.CLEAR;
                  qrServidor.sql.add('insert into SINTEGRA_REG60');
                  qrServidor.SQL.Add('(id, MOVIMENTO,');
                  qrServidor.SQL.Add('CODIGO_EMPRESA,');
                  qrServidor.SQL.Add('CNPJ,');
                  qrServidor.SQL.Add('IE,');
                  qrServidor.SQL.Add('UF,');
                  qrServidor.SQL.Add('DATA_EMISSAO,');
                  qrServidor.SQL.Add('NRO_SERIE_EQP,');
                  qrServidor.SQL.Add('NRO_ORDEM_EQP,');
                  qrServidor.SQL.Add('MODELO_DOC,');
                  qrServidor.SQL.Add('NRO_CONTADOR_INICIO,');
                  qrServidor.SQL.Add('NRO_CONTADOR_FIM,');
                  qrServidor.SQL.Add('NRO_CONTADOR_Z,');
                  qrServidor.SQL.Add('CONTADOR_REINICIO,');
                  qrServidor.SQL.Add('VALOR_VENDA_BRUTA,');
                  qrServidor.SQL.Add('VALOR_TOTAL_GERAL,');
                  qrServidor.SQL.Add('CANCELAMENTO,');
                  qrServidor.SQL.Add('DESCONTO,');
                  qrServidor.SQL.Add('ISSQN,');
                  qrServidor.SQL.Add('SUBSTITUICAO_TRIBUTARIA,');
                  qrServidor.SQL.Add('ISENTO,');
                  qrServidor.SQL.Add('NAO_INCIDENCIA,');

                  qrServidor.SQL.Add('ALIQUOTA01,');
                  qrServidor.SQL.Add('ALIQUOTA02,');
                  qrServidor.SQL.Add('ALIQUOTA03,');
                  qrServidor.SQL.Add('ALIQUOTA04,');
                  qrServidor.SQL.Add('ALIQUOTA05,');
                  qrServidor.SQL.Add('BASE01,');
                  qrServidor.SQL.Add('BASE02,');
                  qrServidor.SQL.Add('BASE03,');
                  qrServidor.SQL.Add('BASE04,');
                  qrServidor.SQL.Add('BASE05,');
                  qrServidor.SQL.Add('VALOR_VENDA_LIQUIDA,');
                  qrServidor.SQL.Add('NRO_CONTADOR_CANCELAMENTO)');

                  qrServidor.sql.add('values');

                  qrServidor.SQL.Add('(:id, :MOVIMENTO,');
                  qrServidor.SQL.Add(':CODIGO_EMPRESA,');
                  qrServidor.SQL.Add(':CNPJ,');
                  qrServidor.SQL.Add(':IE,');
                  qrServidor.SQL.Add(':UF,');
                  qrServidor.SQL.Add(':DATA_EMISSAO,');
                  qrServidor.SQL.Add(':NRO_SERIE_EQP,');
                  qrServidor.SQL.Add(':NRO_ORDEM_EQP,');
                  qrServidor.SQL.Add(':MODELO_DOC,');
                  qrServidor.SQL.Add(':NRO_CONTADOR_INICIO,');
                  qrServidor.SQL.Add(':NRO_CONTADOR_FIM,');
                  qrServidor.SQL.Add(':NRO_CONTADOR_Z,');
                  qrServidor.SQL.Add(':CONTADOR_REINICIO,');
                  qrServidor.SQL.Add(':VALOR_VENDA_BRUTA,');
                  qrServidor.SQL.Add(':VALOR_TOTAL_GERAL,');
                  qrServidor.SQL.Add(':CANCELAMENTO,');
                  qrServidor.SQL.Add(':DESCONTO,');
                  qrServidor.SQL.Add(':ISSQN,');
                  qrServidor.SQL.Add(':SUBSTITUICAO_TRIBUTARIA,');
                  qrServidor.SQL.Add(':ISENTO,');
                  qrServidor.SQL.Add(':NAO_INCIDENCIA,');

                  qrServidor.SQL.Add(':ALIQUOTA01,');
                  qrServidor.SQL.Add(':ALIQUOTA02,');
                  qrServidor.SQL.Add(':ALIQUOTA03,');
                  qrServidor.SQL.Add(':ALIQUOTA04,');
                  qrServidor.SQL.Add(':ALIQUOTA05,');
                  qrServidor.SQL.Add(':BASE01,');
                  qrServidor.SQL.Add(':BASE02,');
                  qrServidor.SQL.Add(':BASE03,');
                  qrServidor.SQL.Add(':BASE04,');
                  qrServidor.SQL.Add(':BASE05,');
                  qrServidor.SQL.Add(':VALOR_VENDA_LIQUIDA,');
                  qrServidor.SQL.Add(':NRO_CONTADOR_CANCELAMENTO)');



                  qrServidor.Params.ParamByName('id').ASSTRING := codifica('000032', 6);
                  qrServidor.Params.ParamByName('MOVIMENTO').asinteger := 1;
                  qrServidor.Params.ParamByName('CODIGO_EMPRESA').asinteger := 1;
                  qrServidor.Params.ParamByName('CNPJ').asstring := '';
                  qrServidor.Params.ParamByName('IE').asstring := '';
                  qrServidor.Params.ParamByName('UF').asstring := '';
                  qrServidor.Params.ParamByName('DATA_EMISSAO').asdatetime := qrPDV.fieldbyname('data_movimento').asdatetime;
                  qrServidor.Params.ParamByName('NRO_SERIE_EQP').asstring := qrPDV.fieldbyname('ecf').asstring;
                  qrServidor.Params.ParamByName('NRO_ORDEM_EQP').asinteger := qrPDV.fieldbyname('ecf_caixa').asinteger;
                  qrServidor.Params.ParamByName('MODELO_DOC').asstring := '2D';

                  qrServidor.Params.ParamByName('NRO_CONTADOR_INICIO').asinteger := strtoint(qrconfig.fieldbyname('CAIXA_COO_INICIAL').asstring);
                  qrServidor.Params.ParamByName('NRO_CONTADOR_FIM').asInteger := strtoint(qrPDV.fieldbyname('coo').asstring);
                  qrServidor.Params.ParamByName('NRO_CONTADOR_Z').asinteger := strtoint(qrPDV.fieldbyname('crz').asstring);
                  qrServidor.Params.ParamByName('CONTADOR_REINICIO').asinteger := strtoint(qrPDV.fieldbyname('cro').asstring);

                  qrServidor.Params.ParamByName('VALOR_VENDA_BRUTA').asfloat := qrPDV.fieldbyname('venda_bruta').asfloat;
                  qrServidor.Params.ParamByName('VALOR_TOTAL_GERAL').asfloat := qrPDV.fieldbyname('totalizador_geral').asfloat;
                  qrServidor.Params.ParamByName('CANCELAMENTO').asfloat := qrPDV.fieldbyname('cancelamento_icms').asfloat;
                  qrServidor.Params.ParamByName('DESCONTO').asfloat := qrPDV.fieldbyname('desconto_icms').asfloat;
                  qrServidor.Params.ParamByName('ISSQN').asfloat := qrPDV.fieldbyname('total_iss').asfloat;

                  x := 1;
                  qrPDV3.first;
                  while not qrPDV3.eof do
                  begin
                  // substituicao tributaria
                    if qrPDV3.FieldByName('totalizador').asstring = 'F1' then
                      qrServidor.Params.ParamByName('SUBSTITUICAO_TRIBUTARIA').asfloat :=
                        qrPDV3.fieldbyname('valor').asfloat;

                  // isento
                    if qrPDV3.FieldByName('totalizador').asstring = 'I1' then
                      qrServidor.Params.ParamByName('ISENTO').asfloat :=
                        qrPDV3.fieldbyname('valor').asfloat;

                  // NAO TRIBUTADO
                    if qrPDV3.FieldByName('totalizador').asstring = 'N1' then
                      qrServidor.Params.ParamByName('NAO_INCIDENCIA').asfloat :=
                        qrPDV3.fieldbyname('valor').asfloat;

                  // TRIBUTADOS
                    if (COPY(qrPDV3.FieldByName('TOTALIZADOR').ASSTRING, 6, 2) = '00') and
                      (qrPDV3.fieldbyname('valor').asfloat > 0) then
                    begin
                      case x of
                        1: begin
                            qrServidor.Params.ParamByName('ALIQUOTA01').asfloat :=
                              strtofloat(COPY(qrPDV3.FieldByName('TOTALIZADOR').ASSTRING, 4, 4)) / 100;
                            qrServidor.Params.ParamByName('BASE01').asfloat :=
                              qrPDV3.fieldbyname('valor').asfloat;
                            inc(x);
                          end;
                        2: begin
                            qrServidor.Params.ParamByName('ALIQUOTA02').asfloat :=
                              strtofloat(COPY(qrPDV3.FieldByName('TOTALIZADOR').ASSTRING, 4, 4)) / 100;
                            qrServidor.Params.ParamByName('BASE02').asfloat :=
                              qrPDV3.fieldbyname('valor').asfloat;
                            inc(x);
                          end;
                        3: begin
                            qrServidor.Params.ParamByName('ALIQUOTA03').asfloat :=
                              strtofloat(COPY(qrPDV3.FieldByName('TOTALIZADOR').ASSTRING, 4, 4)) / 100;
                            qrServidor.Params.ParamByName('BASE03').asfloat :=
                              qrPDV3.fieldbyname('valor').asfloat;
                            inc(x);
                          end;
                        4: begin
                            qrServidor.Params.ParamByName('ALIQUOTA04').asfloat :=
                              strtofloat(COPY(qrPDV3.FieldByName('TOTALIZADOR').ASSTRING, 4, 4)) / 100;
                            qrServidor.Params.ParamByName('BASE04').asfloat :=
                              qrPDV3.fieldbyname('valor').asfloat;
                            inc(x);
                          end;
                        5: begin
                            qrServidor.Params.ParamByName('ALIQUOTA05').asfloat :=
                              strtofloat(COPY(qrPDV3.FieldByName('TOTALIZADOR').ASSTRING, 4, 4)) / 100;
                            qrServidor.Params.ParamByName('BASE05').asfloat :=
                              qrPDV3.fieldbyname('valor').asfloat;
                            inc(x);
                          end;
                      end;
                    end;
                    qrPDV3.next;
                  end;
                  qrServidor.Params.ParamByName('VALOR_VENDA_LIQUIDA').asfloat := qrPDV.fieldbyname('venda_liquida').asfloat;
                  qrServidor.Params.ParamByName('NRO_CONTADOR_CANCELAMENTO').asfloat := 0;
                  qrServidor.execsql;

                  qrPDV.next;
                end;
                try
                  {qrPDV.close;
                  qrPDV.sql.clear;
                  qrPDV.sql.add('update reducaoz set ex = 1');
                  qrPDV.ExecSQL; }
                except
                  on e: exception do
                  begin
                    Memo1.Lines.Add('Erro na gravacao da reducao z - Mensagem: ' + e.Message);
                  end;
                end;

              except

              end;

              qrservidor.close;

              try
                qrpdv.close;
                qrpdv.sql.clear;
                qrpdv.sql.add('update config set carga_data = ''' + datetostr(date) + ''',');
                qrpdv.sql.Add('carga_hora = ''' + timetostr(time) + '''');
                qrpdv.ExecSQL;
              except

              end;
            end
            else
            begin
              grid.CELL[3, I].AsInteger := 1;
            end;

            AdicionarCaixas;
            AdicionarUsuarios;
            AdicionarVendedores;
          end;

        end;

      finally
        Screen.Cursor := crArrow;
        pnlAviso.Visible := False;
      end;
    end
    else
    begin
      verifica_conexao('SERVIDOR', ed_server.TEXT, ed_server_database.TEXT);
    end;

  finally
   Close; // Timer1.Enabled := true;
  end;
end;

procedure Tfrmsplashpdv.AdicionarUsuarios;
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

procedure Tfrmsplashpdv.AdicionarCaixas;
begin
  qrservidor.close;
  qrservidor.sql.clear;
  qrservidor.sql.add('select c000045.*, c000008.nome from c000045, c000008 where c000045.codfuncionario = c000008.codigo order by c000045.codigo');
  qrservidor.open;
  qrservidor.first;

  Memo1.Lines.Add('Encontrado ' + inttostr(qrservidor.RecordCount) + ' caixa(s)');

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
end;

function Tfrmsplashpdv.verifica_crediario(cod_cliente: string): Real;
begin
  try
    qrCrediario.close;
    qrCrediario.SQL.clear;
    qrcrediario.sql.Add('select sum(valor_atual) as debito');
    qrCrediario.sql.Add('from c000049 where codcliente = ''' + cod_cliente + '''');
    qrcrediario.sql.Add('and situacao = 1');
    qrcrediario.open;

    Result := qrCrediario.fieldbyname('debito').asfloat;
  except
    on E: Exception do
    begin
      Result := 0;
      memo1.lines.add('ERRO CREDIARIO - Mensagem: ' + E.message);
    end;
  end;
end;

function Tfrmsplashpdv.Zerar(texto: string; qtde: integer): string;
begin
  while length(texto) < qtde do texto := '0' + texto;
  result := texto;
end;

function Tfrmsplashpdv.codifica(tabela: string; qtde_digitos: integer): string;
begin
  qrmestre.close;
  qrmestre.sql.Clear;
  qrmestre.sql.add('select * from c000000 where codigo = ''' + tabela + '''');
  qrMestre.Open;
  if qrmestre.RecNo = 1 then
  begin
    if qrmestre.FieldByName('sequencia').asinteger < 1 then
    begin
      result := '0000000001';
      qrMestre.Edit;
      qrMestre.fieldbyname('sequencia').asinteger := 2;
      qrMestre.Post;

    end
    else
    begin
      result := zerar(inttostr(qrMestre.fieldbyname('sequencia').asinteger), qtde_digitos);
      qrMestre.Edit;
      qrMestre.fieldbyname('sequencia').asinteger := qrMestre.fieldbyname('sequencia').asinteger + 1;
      qrMestre.Post;
    end;
  end
  else
  begin
    Memo1.Lines.Add('Erro - Tabela Mestre - Mensagem: N�o foi encontrado a entrada ' + tabela + ' na tabela de sequencia!');
  end;
end;

function Tfrmsplashpdv.Cript(Action, Src: string): string;
label
  Fim;

var
  KeyLen: Integer;
  KeyPos: Integer;
  OffSet: Integer;
  Dest, Key: string;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;

begin
  if (Src = '') then
  begin
    Result := '';
    goto Fim;
  end;

  Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
//  Key := 'YUQL%%$#%3DF#0WI5E$JA$46#NM@XXL6JAOAUW%$#@0AOMM4$4VZYW&&HJUI23@7E%#@!DF34#4SKL K3LA@DJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;

  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x', [OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) mod 255;
      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x', [SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  else
    if (Action = UpperCase('D')) then
    begin
      OffSet := StrToInt('$' + copy(Src, 1, 2));
      SrcPos := 3;
      repeat
        SrcAsc := StrToInt('$' + copy(Src, SrcPos, 2));
        if (KeyPos < KeyLen) then KeyPos := KeyPos + 1 else KeyPos := 1;
        TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
        if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
        else TmpSrcAsc := TmpSrcAsc - OffSet;
        Dest := Dest + Chr(TmpSrcAsc);
        OffSet := SrcAsc;
        SrcPos := SrcPos + 2;
      until (SrcPos >= Length(Src));
    end;
  Result := Dest;
  Fim:
end;

procedure Tfrmsplashpdv.FormShow(Sender: TObject);
var
  arquivo_ini: TIniFile;
  i, x: integer;
  spdv: string;

begin
  if not pnlAviso.Visible then
  begin
    timer3.enabled := true;
    sDir_Sistema := ExtractFileDir(Application.ExeName);
    Arquivo_ini := TIniFile.Create(sDir_Sistema + '\cfg\servidor.ini');
    ed_server.Text := Arquivo_ini.ReadString('SERVIDOR', 'SERVER', '');
    ed_server_database.text := arquivo_ini.ReadString('SERVIDOR', 'DATABASE', '');

    Timer1.Interval := StrToInt(arquivo_ini.ReadString('TEMPO', 'MINUTOS', '3')) * 60000;

    grid.ClearRows;

    for i := 1 to 20 do
    begin
      spdv := 'PDV' + IntToStr(i);
      if (arquivo_ini.ReadString('PDV', spdv, '') = 'TRUE') then
      begin
        x := grid.AddRow(1);
        grid.cell[0, x].asinteger := i;
        grid.cell[1, x].asstring := arquivo_ini.ReadString('PDV', spDv + '_COMPUTADOR', '');
        grid.cell[2, x].asstring := arquivo_ini.ReadString('PDV', spDv + '_DATABASE', '');
        if verifica_conexao('PDV', grid.cell[1, x].asstring, grid.cell[2, x].asstring) then
          grid.cell[3, x].asinteger := 0
        else
          grid.cell[3, x].asinteger := 1;
        grid.Cell[4, x].AsBoolean := true;
      end;
    end;
    Arquivo_ini.Free;

    Arquivo_ini := TIniFile.Create(sDir_Sistema + '\cfg\cfg.ini');
    caixa := arquivo_ini.ReadString('CAIXA', 'NUMERO', '');
    Arquivo_ini.Free;


    if verifica_conexao('SERVIDOR', ed_server.TEXT, ed_server_database.Text) then
    begin
      ed_server.Color := $00F2DD9D;
      ed_server_database.Color := $00F2DD9D;

    end
    else
    begin
      ed_server.Color := clRED;
      ed_server_database.Color := CLRED;
    end;

    btgrfinanceiro.Click; //Timer1.Enabled := TRUE;
  end;
end;

function Tfrmsplashpdv.Arredondar(Value: Extended;
  Decimals: integer): Extended;
var
  Factor, Fraction: Extended;
begin
  Factor := IntPower(10, Decimals);
  { A convers�o para string e depois para float evita
    erros de arredondamentos indesej�veis. }
  Value := StrToFloat(FloatToStr(Value * Factor));
  Result := Int(Value);
  Fraction := Frac(Value);
  if Fraction >= 0.5 then
    Result := Result + 1
  else if Fraction <= -0.5 then
    Result := Result - 1;
  Result := Result / Factor;
end;

end.
