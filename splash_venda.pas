unit splash_venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, dxGDIPlusClasses, Data.DB, MemDS, DBAccess, Uni,
  NxColumnClasses, NxColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, JvExControls, JvAnimatedImage,
  JvGIFCtrl, System.ImageList, Vcl.ImgList, JPEG, PageView, inifiles,
  UniProvider, InterBaseUniProvider, AdvGlowButton, Vcl.Menus, AdvMenus;
const
  OffsetMemoryStream : Int64 = 0;
type
  Tfrmsplash_venda = class(TForm)
    Label1: TLabel;
    Label7: TLabel;
    ProgressBar2: TProgressBar;
    Timer1: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    JvGIFAnimator1: TJvGIFAnimator;
    Label4: TLabel;
    ImageList2: TImageList;
    ImageList1: TImageList;
    conexao_servidor: TUniConnection;
    conexao_pdv: TUniConnection;
    InterBaseUniProvider1: TInterBaseUniProvider;
    qrbanco: TUniQuery;
    qrMovCartao: TUniQuery;
    qrConfServer: TUniQuery;
    qrConfServerACRESCIMO_PRODUTO: TFloatField;
    qrConfServerDESCONTO_PRODUTO: TFloatField;
    qrIBPT: TUniQuery;
    qrIBPTCODIGO: TStringField;
    qrIBPTEX: TStringField;
    qrIBPTTABELA: TIntegerField;
    qrIBPTALIQNAC: TFloatField;
    qrIBPTALIQIMP: TFloatField;
    qrIBPTNCM: TStringField;
    qrPDV: TUniQuery;
    qrServidor: TUniQuery;
    qrconfig: TUniQuery;
    qrcaixa_mov: TUniQuery;
    qrpdv2: TUniQuery;
    qrCrediario: TUniQuery;
    qrpdv3: TUniQuery;
    qrServidor_Tabela: TUniQuery;
    qrForma: TUniQuery;
    qrMestre: TUniQuery;
    qrPDV_Tabela: TUniQuery;
    pnlAviso: TPanel;
    pop_fechamento: TAdvPopupMenu;
    Cancelar1: TMenuItem;
    Image1: TImage;
    PageView1: TPageView;
    PageSheet1: TPageSheet;
    Label5: TLabel;
    Panel3: TPanel;
    Label6: TLabel;
    Label8: TLabel;
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
    procedure Timer1Timer(Sender: TObject);
    procedure AtualizacaoFinanceiro;
    procedure FormShow(Sender: TObject);
    function verifica_crediario(cod_cliente: string): Real;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);

  private
   function verifica_conexao(tipo: string; server: string; base: string): boolean;
   function Zerar(texto: string; qtde: integer): string; // Acrescentar Zeros a esquerda em uma String
   procedure AdicionarCaixas;
   procedure AdicionarUsuarios;
   procedure AdicionarVendedores;
   procedure AdicionarClientes;
   function Cript(Action, Src: string): string;
    { Private declarations }

  public
  caixa: string;
  function Arredondar(Value: Extended; Decimals: integer): Extended;
    { Public declarations }
  end;

var
  frmsplash_venda: Tfrmsplash_venda;
  I: INTEGER;
  sDir_sistema: string;
  H: THandle;
  fechar: boolean;

implementation

uses Math, md52, Venda, principal, modulo;
{$R *.dfm}

function Tfrmsplash_venda.Zerar(texto: string; qtde: integer): string;
begin
  while length(texto) < qtde do texto := '0' + texto;
  result := texto;
end;

procedure Tfrmsplash_venda.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   action := cafree;

end;

procedure Tfrmsplash_venda.FormShow(Sender: TObject);
var
  arquivo_ini: TIniFile;
  i, x: integer;
  spdv: string;
begin
  Begin
   Image1.Picture.LoadFromFile('C:\ACTHAUROS\Server\IMG\imagem_fundo.jpeg');
   End;

  PageView1.ActivePageIndex := 1;
  if pnlAviso.Visible then
  begin
    sDir_Sistema := ExtractFileDir(Application.ExeName);
    Arquivo_ini := TIniFile.Create(sDir_Sistema + '\cfg\servidor.ini');
    ed_server.Text := Arquivo_ini.ReadString('SERVIDOR', 'SERVER', '');
    ed_server_database.text := arquivo_ini.ReadString('SERVIDOR', 'DATABASE', '');

    //Timer1.Interval := StrToInt(arquivo_ini.ReadString('TEMPO', 'MINUTOS', '3')) * 60000;

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

    Timer1.Enabled := TRUE;
  end;
  Image1.Picture.LoadFromFile('C:\ACTHAUROS\Server\IMG\imagem_fundo.jpeg');
end;

function Tfrmsplash_venda.verifica_crediario(cod_cliente: string): Real;
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
      //memo1.lines.add('ERRO CREDIARIO - Mensagem: ' + E.message);
      LABEL3.CAPTION := ('ERRO CREDIARIO - Mensagem: ' + E.message);
    end;
  end;
end;

function Tfrmsplash_venda.verifica_conexao(tipo: string; server: string; base: string): boolean;
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

procedure Tfrmsplash_venda.AtualizacaoFinanceiro;
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
      Frmprincipal.FDconn_servidor.Connected := true;
  try
   // Timer1.Enabled := false;

    //Label6.Caption := '';
   // Label4.Caption := '';

    //verificarconexaoPDV;

    if conexao_servidor.Connected then
    begin
      try

        Screen.Cursor := crAppStart;
        pnlAviso.Left := 2;
        pnlAviso.Width := 450;
        pnlAviso.Visible := True;
        pnlAviso.Repaint;

        memo1.lines.add('Iniciando processo do lan�amento financeiro em ' + DateToStr(date) + ' as ' + timetostr(time));

        for I := 0 to grid.RowCount - 1 do
        begin
          if grid.Cell[4, i].AsBoolean then
          begin
            if verifica_conexao('PDV', grid.CELL[1, I].ASSTRING, GRID.CELL[2, I].ASSTRING) then
            begin
              grid.CELL[3, I].AsInteger := 0;
              //ShowMessage(grid.Cell[0,I].AsString);

               // E S T A C A O   PARA   S E R V I D O R

               // ------------- V E N D A S -------------------//

              qrconfig.close;
              qrconfig.sql.clear;
              qrconfig.sql.add('select * from config');
              qrconfig.open;

              qrServidor.Close;
              qrServidor.SQL.Clear;
              qrServidor.SQL.Add('update C000045 set situacao = :situacao, data = :data where codigo = :codigo'); //
              qrServidor.ParamByName('codigo').AsString := zerar(grid.Cell[0, I].AsString, 6);

              if qrconfig.FieldByName('CAIXA_SITUACAO').AsString = 'FECHADO' then
                qrServidor.ParamByName('situacao').AsInteger := 2;

              if qrconfig.FieldByName('CAIXA_SITUACAO').AsString = 'ABERTO' then
                qrServidor.ParamByName('situacao').AsInteger := 1;

              qrServidor.ParamByName('data').AsDate := date;//qrconfig.FieldByName('CAIXA_DATA_MOVTO').AsDateTime;

              qrServidor.ExecSQL;

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
                conexao_PDV.Commit;
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
                scod_venda := qrpdv.fieldbyname('ccf').asstring;//codifica('000048', 7);

                qrServidor.close;
                qrServidor.sql.clear;
                qrServidor.sql.add('insert into c000048');
                qrServidor.sql.add('(codigo,data,codcliente,codvendedor,');
                qrServidor.sql.add('codcaixa,total,subtotal,meio_dinheiro,');
                qrServidor.sql.add('meio_chequeav, meio_chequeap,meio_cartaocred,');
                qrServidor.SQL.add('meio_cartaodeb,meio_crediario,meio_convenio, desconto,acrescimo,');
                qrServidor.sql.add('cupom_fiscal,numero_cupom_fiscal,nrvenda, ECF_SERIAL, situacao, contingencia, gerado_nfce)');
                qrServidor.sql.add('values');
                qrServidor.sql.add('(:codigo,:datax,:codcliente,:codvendedor,');
                qrServidor.sql.add(':codcaixa,:TOTAL,:SUBTOTAL,:DINHEIRO,');
                qrServidor.sql.add(':CHEQUEAV,:CHEQUEAP,:CARTAOCRED,');
                qrServidor.SQL.add(':CARTAODEB,:CREDIARIO,:CONVENIO,:DESCONTO,:ACRESCIMO,');
                qrServidor.sql.add(':cupom_fiscal,:numero_cupom_fiscal,:nrvenda, :ECF_SERIAL, :situacao, :contingencia, :gerado_nfce)');

                qrServidor.Params.ParamByName('codigo').asstring := scod_venda;
                qrServidor.Params.ParamByName('codcliente').asstring := Zerar(qrpdv.fieldbyname('cod_cliente').asstring, 6);
                qrServidor.Params.ParamByName('codCAIXA').asstring := zerar(qrpdv.fieldbyname('cod_caixa').asstring, 6);
                qrServidor.Params.ParamByName('numero_cupom_fiscal').asstring := scod_venda;
                qrServidor.Params.ParamByName('nrvenda').asstring := scod_venda;
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
                      qrcaixa_mov.sql.add('(codigo,codcaixa,codoperador,data,entrada,valor,codconta,movimento,historico,codvenda)');
                      qrcaixa_mov.sql.add('values');
                      qrcaixa_mov.sql.add('(''' +frmPrincipal.adic_codifica('000044') + ''',''' + zerar(qrpdv.fieldbyname('cod_caixa').asstring, 6) + ''',''' + zerar(qrpdv.fieldbyname('cod_vendedor').asstring, 6) + ''',:datax,');
                      qrcaixa_mov.sql.add(':VALOR,:VALOR,''100001'',3,''Venda DINHEIRO - ECF No. ' + scod_venda +
                      ''','''+qrpdv.fieldbyname('cod_vendedor').asstring + qrpdv.fieldbyname('ccf').asstring + ''')');
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
                      qrcaixa_mov.sql.add('(codigo,codcaixa,codoperador,data,entrada,valor,codconta,movimento,historico,codvenda)');
                      qrcaixa_mov.sql.add('values');
                      qrcaixa_mov.sql.add('(''' + frmPrincipal.adic_codifica('000044') + ''',''' + zerar(qrpdv.fieldbyname('cod_caixa').asstring, 6) + ''',''' + zerar(qrpdv.fieldbyname('cod_vendedor').asstring, 6) + ''',:datax,');
                      if (AnsiUpperCase(qrforma.fieldbyname('forma').asstring) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) then
                        qrcaixa_mov.sql.add('0,:VALOR,''100002'',5,''Venda PIX - ECF No. ' + scod_venda +
                      ''','''+qrpdv.fieldbyname('cod_vendedor').asstring + qrpdv.fieldbyname('ccf').asstring + ''')')
                      else
                        qrcaixa_mov.sql.add('0,:VALOR,''100002'',6,''Venda DEPOSITO/TRANF - ECF No. ' + scod_venda +
                      ''','''+qrpdv.fieldbyname('cod_vendedor').asstring + qrpdv.fieldbyname('ccf').asstring + ''')');
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
                      qrcaixa_mov.sql.add('(codigo,codcaixa,codoperador,data,entrada,valor,codconta,movimento,historico,codvenda)');
                      qrcaixa_mov.sql.add('values');
                      qrcaixa_mov.sql.add('(''' +frmPrincipal.adic_codifica('000044') + ''',''' + zerar(qrpdv.fieldbyname('cod_caixa').asstring, 6) + ''',''' + zerar(qrpdv.fieldbyname('cod_vendedor').asstring, 6) + ''',:datax,');
                      if (AnsiUpperCase(qrforma.fieldbyname('forma').asstring) = AnsiUpperCase(lForma_pgto_Cartao_Credito)) then
                        qrcaixa_mov.sql.add('0,:VALOR,''100003'',7,''Venda CARTAO CREDITO - ECF No. ' + scod_venda +
                      ''','''+qrpdv.fieldbyname('cod_vendedor').asstring + qrpdv.fieldbyname('ccf').asstring + ''')')
                      else
                        qrcaixa_mov.sql.add('0,:VALOR,''100003'',8,''Venda CARTAO DEBITO - ECF No. ' + scod_venda +
                      ''','''+qrpdv.fieldbyname('cod_vendedor').asstring + qrpdv.fieldbyname('ccf').asstring + ''')');
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
                          qrMovCartao.parambyname('codigo').asstring := frmPrincipal.adic_codifica('000124');
                          qrMovCartao.parambyname('cod_venda').asstring := scod_venda;
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
                          qrMovCartao.parambyname('codigo').asstring := frmPrincipal.adic_codifica('000124');
                          qrMovCartao.parambyname('cod_venda').asstring := scod_venda;
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
                      qrcaixa_mov.sql.add('(''' + frmPrincipal.adic_codifica('000044') + ''',''' + zerar(qrpdv.fieldbyname('cod_caixa').asstring, 6) + ''',''' + zerar(qrpdv.fieldbyname('cod_vendedor').asstring, 6) + ''',:datax,');
                      qrcaixa_mov.sql.add('0,:VALOR,''100004'',4,''Venda CREDIARIO - ECF No. ' + scod_venda + ''')');
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
                      qrcaixa_mov.sql.add('(''' + frmPrincipal.adic_codifica('000044') + ''',''' + zerar(qrpdv.fieldbyname('cod_caixa').asstring, 6) + ''',''' + zerar(qrpdv.fieldbyname('cod_vendedor').asstring, 6) + ''',:datax,');
                      qrcaixa_mov.sql.add('0,:VALOR,''100005'',40,''Venda CONVENIO - ECF No. ' + scod_venda + ''')');
                      qrcaixa_mov.Params.ParamByName('datax').asdatetime := qrpdv.fieldbyname('data').asdatetime;
                      QRCAIXA_MOV.Params.ParamByName('VALOR').ASFLOAT := qrforma.fieldbyname('valor').asfloat;
//                      QRCAIXA_MOV.Params.ParamByName('VALOR').ASFLOAT := qrpdv.fieldbyname('valor_total').asfloat;
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

                    qrServidor.Params.ParamByName('codigo').asstring := frmPrincipal.adic_codifica('000049') + '/' + zerar(inttostr(iprest), 2);
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
                    //inc(iprest);
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

                  qrServidor_Tabela.close;
                  qrServidor_Tabela.sql.clear;
                  qrServidor_Tabela.sql.add('select CODIGO, PRECOCUSTO from C000025');
                  qrServidor_Tabela.sql.add('where CODIGO = ''' + zerar(qrPDV3.fieldbyname('cod_produto').asstring, 6) + '''');
                  qrServidor_Tabela.open;
                  qrServidor_Tabela.first;

                  qrServidor.CLOSE;
                  qrServidor.SQL.CLEAR;
                  qrServidor.SQL.Add('insert into c000032');
                  qrServidor.SQL.add('(codigo,codnota,serial,numeronota,');
                  qrServidor.SQL.add('codproduto,qtde,movimento_estoque,unitario,desconto,acrescimo,');
                  qrServidor.SQL.add('total,unidade,aliquota,');
                  qrServidor.SQL.add('cupom_item,cupom_numero,cupom_modelo,');
                  qrServidor.SQL.add('ecf_serie,ecf_caixa,codcliente,codvendedor,movimento,data,cst,');
                  qrServidor.sql.add('base_calculo, valor_icms,precocusto)');
                  qrServidor.SQL.add('values');

                  qrServidor.SQL.add('(:codigo,:codnota,:serial,:numeronota,');
                  qrServidor.SQL.add(':codproduto,:qtde,:movimento_estoque,:unitario,:desconto,:acrescimo,');
                  qrServidor.SQL.add(':total,:unidade,:aliquota,');
                  qrServidor.SQL.add(':cupom_item,:cupom_numero,:cupom_modelo,');
                  qrServidor.SQL.add(':ecf_serie,:ecf_caixa,:codcliente,:codvendedor,:movimento,:data,:cst,');
                  qrServidor.sql.add(':base_calculo, :valor_icms,:precocusto)');

                  qrServidor.Params.ParamByName('CODIGO').ASSTRING := zerar(frmPrincipal.adic_codifica('000032'), 10);
                  qrServidor.Params.ParamByName('CODNOTA').ASSTRING := scod_venda;
                  qrServidor.Params.ParamByName('SERIAL').ASSTRING := '';
                  qrServidor.Params.ParamByName('NUMERONOTA').ASSTRING := scod_venda;
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
                  qrServidor.Params.ParamByName('CUPOM_NUMERO').ASSTRING := scod_venda;
                  qrServidor.Params.ParamByName('CUPOM_ITEM').ASSTRING := zerar(qrPDV3.FIELDBYNAME('ITEM').ASSTRING, 3);
                  qrServidor.Params.ParamByName('CUPOM_MODELO').ASSTRING := '2D';
                  qrServidor.params.parambyname('precocusto').asfloat := qrServidor_Tabela.fieldbyname('PRECOCUSTO').asfloat;

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
                 // conexao_PDV.Commit;
                except
                  on E: Exception do
                  begin
                    Memo1.Lines.Add('Erro na gravacao do Cupom - Mensagem: ' + E.Message);
                  end;
                end;
                qrpdv.Next;
              end;

          // S E R V I D O R   PARA  E S T A C A O

              qrservidor.close;

              try
                qrpdv.close;
                qrpdv.sql.clear;
                qrpdv.sql.add('update config set carga_data = ''' + datetostr(date) + ''',');
                qrpdv.sql.Add('carga_hora = ''' + timetostr(time) + '''');
                qrpdv.ExecSQL;
                //conexao_PDV.Commit;
              except

              end;
            end
            else
            begin
              grid.CELL[3, I].AsInteger := 1;
            end;

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
    //Timer1.Enabled := true;
   // verificarvendasnoSERVIDOR;
   // conexao_PDV.Commit;
  end;
  Frmprincipal.FDconn_servidor.Connected := false;
  frmvenda.ED_BARRA.SETFOCUS;
end;



procedure Tfrmsplash_venda.Timer1Timer(Sender: TObject);
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

    sAliquota: string;


  nNumeroVersaoLocal, nNumeroVersaoFTP: smallint;
begin

  I := I + 5;

  ProgressBar2.Position := ProgressBar2.Position + 5;
  {if (ProgressBar1.Position mod 5) = 0 then
  begin

  end;}
     //JvGIFAnimator1.Animate := true;


  {if TfrmVenda.ed_troco.value > 0 then
        Imprime_display('Pago: R$ ' + formatfloat('###,###,##0.00', ed_totalizador.value) + '            ' + 'Troco: R$ ' + formatfloat('###,###,##0.00', ed_troco.value), clwhite, tiPgto)
      else
        Imprime_display('             C A I X A    L I V R E', clWhite, tiLivre);
     TfrmVenda.TimerTroco.Enabled := true;} // Apos 5 segundos
     if ProgressBar2.Position = 5 then
    begin
      LABEL4.CAPTION := ('Pago: R$ ' + formatfloat('###,###,##0.00', frmVenda.ed_totalizador.value) + '            ' + 'Troco: R$ ' + formatfloat('###,###,##0.00', frmVenda.ed_troco.value));
    end;


     if ProgressBar2.Position = 10 then
    begin
      LABEL3.CAPTION := 'ATUALIZANDO CADASTRO DE CLIENTES!';
      AdicionarClientes;
    end;


    if ProgressBar2.Position = 35 then
   begin
      LABEL3.CAPTION := 'ATUALIZA��O DE CLIENTES REALIZADO COM SUCESSO!';
    // JvGIFAnimator1.Animate := false;
     //LABEL3.CAPTION := 'ATUALIZANDO CADASTRO DE CLIENTES!';
     AtualizacaoFinanceiro;
     //LABEL3.CAPTION := 'ATUALIZA��O DE CLIENTES REALIZADO COM SUCESSO!';
   end;

    if ProgressBar2.Position = 65 then
   Begin
     LABEL7.CAPTION := 'LAN�AMENTO AO FINANCEIRO REALIZADO COM SUCESSO!';
      //frmVenda.IMPRIMIR.Click;
   End;

    if ProgressBar2.Position = 85 then
   begin

     //LABEL1.CAPTION := 'ATUALIZANDO CADASTRO DE PRODUTOS!';
     //AtualizacaoProdutos;
     //LABEL1.CAPTION := 'ATUALIZA��O DOS PRODUTOS REALIZADO COM SUCESSO!';
   end;

  if ProgressBar2.Position = 90 then
  begin
    LABEL2.CAPTION := 'C A I X A    L I V R E!';
  end;

   if ProgressBar2.Position = 100 then
  begin
    //JvGIFAnimator1.Animate := false;
    //JvGIFAnimator1.Free;
    Timer1.Enabled := FALSE;

    close;
  end;
end;

function Tfrmsplash_venda.Arredondar(Value: Extended;
  Decimals: integer): Extended;
var
  Factor, Fraction: Extended;
begin
 // Factor := IntPower(10, Decimals);
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

procedure Tfrmsplash_venda.AdicionarCaixas;
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

procedure Tfrmsplash_venda.Cancelar1Click(Sender: TObject);
begin
//close;
end;

function Tfrmsplash_venda.Cript(Action, Src: string): string;
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

procedure Tfrmsplash_venda.AdicionarUsuarios;
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

procedure Tfrmsplash_venda.AdicionarClientes;
var
  I: INTEGER;
  scst: string;
  bflag: boolean;
  LimpaDados:Boolean;
  MemoryStream : TMemoryStream;
  Jpg : TJpegImage;
  Bitmap : TBitmap;
begin
  PageView1.ActivePageIndex := 1;
  if pnlAviso.Visible then
    Exit;

  try

    LimpaDados := False;
    Screen.Cursor := crAppStart;
    pnlAviso.Left := 2;
    pnlAviso.Width := 450;
    pnlAviso.Visible := True;
    pnlAviso.Repaint;



    if conexao_servidor.Connected then
    begin
      memo1.lines.add('Iniciando processo de atualiza��o GERAL em ' + DateToStr(date) + ' as ' + timetostr(time));

      for I := 0 to grid.RowCount - 1 do
      begin
        if grid.cell[4, i].AsBoolean then
        begin
          if verifica_conexao('PDV', grid.CELL[1, I].ASSTRING, GRID.CELL[2, I].ASSTRING) then
          begin
            grid.CELL[3, I].AsInteger := 0;

            begin
              qrServidor_Tabela.Close;
              qrServidor_Tabela.sql.clear;
              qrServidor_Tabela.sql.add('select *');
              qrServidor_Tabela.sql.add('from C000007');
              qrservidor_tabela.open;

              if qrservidor_tabela.RecordCount > 0 then
              begin
                qrpdv_tabela.close;
                qrpdv_tabela.sql.clear;
                qrpdv_tabela.sql.add('select codigo from cliente where codigo = ' + inttostr(strtoint(qrservidor_tabela.fieldbyname('codigo').asstring)));
                qrpdv_tabela.Open;

                if qrPDV_Tabela.RecordCount > 0 then
                begin
                  try
                    memo1.lines.add('PDV' + grid.CELL[0, I].ASSTRING + ' - ALT - CLIENTE - ' + qrservidor.fieldbyname('codregistro').asstring);
                    qrpdv.close;
                    qrpdv.sql.clear;
                    qrpdv.sql.add('update CLIENTE set');

                    qrpdv.sql.add('CODIGO = :CODIGO,');
                    qrpdv.sql.add('NOME = :NOME,');
                    qrpdv.sql.add('CPF = :CPF,');
                    qrpdv.sql.add('ENDERECO = :ENDERECO,');
                    qrpdv.sql.add('COMPLEMENTO = :COMPLEMENTO,');
                    qrpdv.sql.add('BAIRRO = :BAIRRO,');
                    qrpdv.sql.add('CIDADE = :CIDADE,');
                    qrpdv.sql.add('UF = :UF,');
                    qrpdv.sql.add('CEP = :CEP,');
                    qrpdv.sql.add('SITUACAO = :SITUACAO,');
                    qrpdv.sql.add('OBS = :OBS,');
                    qrpdv.sql.add('LIMITE = :LIMITE,');
                    qrpdv.sql.add('UTILIZADO = :UTILIZADO,');
                    qrpdv.sql.add('DISPONIVEL = :DISPONIVEL,');
                    qrpdv.sql.add('ATUALIZADO = :ATUALIZADO');
                    qrpdv.sql.add('where codigo = :codigo');

                    qrpdv.parambyname('CODIGO').asstring := qrservidor_tabela.fieldbyname('codigo').asstring;
                    qrpdv.parambyname('NOME').asstring := qrservidor_tabela.fieldbyname('nome').asstring;
                    qrpdv.parambyname('CPF').asstring := qrservidor_tabela.fieldbyname('cpf').asstring;
                    qrpdv.parambyname('ENDERECO').asstring := qrservidor_tabela.fieldbyname('endereco').asstring;
                    qrpdv.parambyname('COMPLEMENTO').asstring := qrservidor_tabela.fieldbyname('complemento').asstring;
                    qrpdv.parambyname('BAIRRO').asstring := qrservidor_tabela.fieldbyname('bairro').asstring;
                    qrpdv.parambyname('CIDADE').asstring := qrservidor_tabela.fieldbyname('cidade').asstring;
                    qrpdv.parambyname('UF').asstring := qrservidor_tabela.fieldbyname('uf').asstring;
                    qrpdv.parambyname('CEP').asstring := qrservidor_tabela.fieldbyname('cep').asstring;
                    if trim(qrservidor_tabela.fieldbyname('situacao').asstring) = '' then
                      qrpdv.parambyname('SITUACAO').asstring := '1'
                    else
                      qrpdv.parambyname('SITUACAO').asstring := qrservidor_tabela.fieldbyname('situacao').asstring;
                    qrpdv.parambyname('OBS').asstring :=
                      qrservidor_tabela.fieldbyname('obs1').asstring + #13 +
                      qrservidor_tabela.fieldbyname('obs2').asstring + #13 +
                      qrservidor_tabela.fieldbyname('obs3').asstring + #13 +
                      qrservidor_tabela.fieldbyname('obs4').asstring + #13 +
                      qrservidor_tabela.fieldbyname('obs5').asstring + #13 +
                      qrservidor_tabela.fieldbyname('obs6').asstring;
                    qrpdv.parambyname('LIMITE').asFLOAT := qrservidor_tabela.fieldbyname('LIMITE').AsFloat;
                    qrpdv.parambyname('UTILIZADO').asfloat := verifica_crediario(qrservidor_tabela.fieldbyname('codigo').asstring);
                    qrpdv.parambyname('DISPONIVEL').asfloat := qrpdv.parambyname('LIMITE').asFLOAT - qrpdv.parambyname('UTILIZADO').asfloat;
                    qrpdv.parambyname('ATUALIZADO').asstring := datetostr(date) + ' AS ' + TimeToStr(TIME);
                    qrpdv.ExecSQL;
                  except
                    memo1.lines.add('PDV' + grid.CELL[0, I].ASSTRING + ' ERRO - ALT - CLIENTE - ' + qrservidor.fieldbyname('codregistro').asstring);
                    bflag := FALSE;
                  end;
                end
                else
                begin
                  try
                    if qrservidor_tabela.RecordCount > 0 then
                    begin
                      qrpdv.close;
                      qrpdv.sql.clear;
                      qrpdv.sql.add('insert into CLIENTE (');
                      qrpdv.sql.add('CODIGO,');
                      qrpdv.sql.add('NOME,');
                      qrpdv.sql.add('CPF,');
                      qrpdv.sql.add('ENDERECO,');
                      qrpdv.sql.add('COMPLEMENTO,');
                      qrpdv.sql.add('BAIRRO,');
                      qrpdv.sql.add('CIDADE,');
                      qrpdv.sql.add('UF,');
                      qrpdv.sql.add('CEP,');
                      qrpdv.sql.add('SITUACAO,');
                      qrpdv.sql.add('OBS,');
                      qrpdv.sql.add('LIMITE,');
                      qrpdv.sql.add('UTILIZADO,');
                      qrpdv.sql.add('DISPONIVEL,');
                      qrpdv.sql.add('ATUALIZADO');
                      qrpdv.sql.add(') values (');
                      qrpdv.sql.add(':CODIGO,');
                      qrpdv.sql.add(':NOME,');
                      qrpdv.sql.add(':CPF,');
                      qrpdv.sql.add(':ENDERECO,');
                      qrpdv.sql.add(':COMPLEMENTO,');
                      qrpdv.sql.add(':BAIRRO,');
                      qrpdv.sql.add(':CIDADE,');
                      qrpdv.sql.add(':UF,');
                      qrpdv.sql.add(':CEP,');
                      qrpdv.sql.add(':SITUACAO,');
                      qrpdv.sql.add(':OBS,');
                      qrpdv.sql.add(':LIMITE,');
                      qrpdv.sql.add(':UTILIZADO,');
                      qrpdv.sql.add(':DISPONIVEL,');
                      qrpdv.sql.add(':ATUALIZADO');
                      qrpdv.sql.add(')');
                      qrpdv.parambyname('CODIGO').asstring := qrservidor_tabela.fieldbyname('codigo').asstring;
                      qrpdv.parambyname('NOME').asstring := qrservidor_tabela.fieldbyname('nome').asstring;
                      qrpdv.parambyname('CPF').asstring := qrservidor_tabela.fieldbyname('cpf').asstring;
                      qrpdv.parambyname('ENDERECO').asstring := qrservidor_tabela.fieldbyname('endereco').asstring;
                      qrpdv.parambyname('COMPLEMENTO').asstring := qrservidor_tabela.fieldbyname('complemento').asstring;
                      qrpdv.parambyname('BAIRRO').asstring := qrservidor_tabela.fieldbyname('bairro').asstring;
                      qrpdv.parambyname('CIDADE').asstring := qrservidor_tabela.fieldbyname('cidade').asstring;
                      qrpdv.parambyname('UF').asstring := qrservidor_tabela.fieldbyname('uf').asstring;
                      qrpdv.parambyname('CEP').asstring := qrservidor_tabela.fieldbyname('cep').asstring;
                      qrpdv.parambyname('SITUACAO').asstring := qrservidor_tabela.fieldbyname('situacao').asstring;
                      qrpdv.parambyname('OBS').asstring :=
                        qrservidor_tabela.fieldbyname('obs1').asstring + #13 +
                        qrservidor_tabela.fieldbyname('obs2').asstring + #13 +
                        qrservidor_tabela.fieldbyname('obs3').asstring + #13 +
                        qrservidor_tabela.fieldbyname('obs4').asstring + #13 +
                        qrservidor_tabela.fieldbyname('obs5').asstring + #13 +
                        qrservidor_tabela.fieldbyname('obs6').asstring;
                      qrpdv.parambyname('LIMITE').asFLOAT := qrservidor_tabela.fieldbyname('LIMITE').AsFloat;
                      qrpdv.parambyname('UTILIZADO').asfloat := verifica_crediario(qrservidor_tabela.fieldbyname('codigo').asstring);
                      qrpdv.parambyname('DISPONIVEL').asfloat := qrpdv.parambyname('LIMITE').asFLOAT - qrpdv.parambyname('UTILIZADO').asfloat;
                      qrpdv.parambyname('ATUALIZADO').asstring := datetostr(date) + ' AS ' + TimeToStr(TIME);
                      qrpdv.ExecSQL;
                    end;
                  except
                    on e: exception do
                    begin
                      memo1.lines.add('PDV' + grid.CELL[0, I].ASSTRING + ' ERRO - INC - CLIENTE - ' + qrservidor.fieldbyname('codregistro').asstring);
                      memo1.lines.add('* ' + e.message);
                      qrPDV.close;
                      qrpdv.sql.clear;
                      qrPDV.sql.Add('select codigo from CLIENTE');
                      qrpdv.sql.Add('where codigo = ' + inttostr(StrToInt(qrservidor.fieldbyname('codregistro').asstring)));
                      qrPDV.Open;
                      if qrpdv.RecordCount = 0 then bflag := false;
                    end;
                  end;
                end;
              end;

            end;

          end
          else
          begin
            grid.CELL[3, I].AsInteger := 1;
          end;
        end;
      end;
    end
    else
    begin
      verifica_conexao('SERVIDOR', ed_server.TEXT, ed_server_database.TEXT);
    end;

  finally
    Screen.Cursor := crArrow;
    pnlAviso.Visible := False;
  end;
end;

procedure Tfrmsplash_venda.AdicionarVendedores;
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

end.