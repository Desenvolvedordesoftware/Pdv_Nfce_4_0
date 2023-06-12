unit suprimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, RzEdit, Menus, AdvMenus, ComCtrls,
  XPMan, AdvGlowButton, AdvMetroButton, AdvSmoothPanel, AdvSmoothExpanderPanel,
  principal, frxClass, frxDBSet, frxDesgn, frxExportPDF, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Data.DB, MemDS,
  DBAccess, Uni;

type
  TfrmSuprimento = class(TForm)
    Panel1: TPanel;
    bt_ok1: TButton;
    bt_cancelar: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    ed_valor: TRzNumericEdit;
    pop_fechamento: TAdvPopupMenu;
    Cancelar1: TMenuItem;
    list_Forma: TListBox;
    Label2: TLabel;
    AdvSmoothExpanderPanel1: TAdvSmoothExpanderPanel;
    Label53: TLabel;
    AdvMetroButton1: TAdvMetroButton;
    bt_ok: TAdvGlowButton;
    frxDesigner1: TfrxDesigner;
    fxSangria1: TfrxReport;
    frxEmitente: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    lbEdicao: TLabel;
    ActionManager1: TActionManager;
    Action1: TAction;
    Shape1: TShape;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel4: TPanel;
    Button3: TButton;
    Button4: TButton;
    qrsuplimento_servidor: TUniQuery;
    Label3: TLabel;
    qrsangria: TUniQuery;
    fxSangria: TfrxReport;
    frxobs_sangria: TfrxDBDataset;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_ok1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure list_FormaKeyPress(Sender: TObject; var Key: Char);
    procedure AdvMetroButton1Click(Sender: TObject);
    procedure fxSangria1BeforePrint(Sender: TfrxReportComponent);
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    TipoImp: TImpressora;
    Editar:Boolean;
  public
    { Public declarations }
  end;

var
  frmSuprimento: TfrmSuprimento;

implementation

uses modulo, unECF, funcoes, menu_fiscal, UFuncoes, venda;

{$R *.dfm}

procedure TfrmSuprimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.TipoImpressora := TipoImp;
  action := cafree;
end;

procedure TfrmSuprimento.FormCreate(Sender: TObject);
begin
  Editar := False;
end;

procedure TfrmSuprimento.Action1Execute(Sender: TObject);
begin
  if Editar then
    Editar := False
  else
    Editar := True;
  lbEdicao.Visible := Editar;
end;

procedure TfrmSuprimento.AdvMetroButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmSuprimento.bt_cancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSuprimento.bt_ok1Click(Sender: TObject);
begin
  if ed_valor.value <= 0 then begin
    Application.MessageBox('Favor informar um valor MAIOR que ZERO!','Erro',mb_ok+mb_iconerror);
    ed_valor.setfocus;
    exit;
  end;

  {if list_forma.ItemIndex < 0 then begin
    Application.MessageBox('Favor selecionar uma forma!','Erro',mb_ok+mb_iconerror);
    list_forma.setfocus;
    exit;
  end;}

  repeat
    if frmPrincipal.TipoImpressora = Fiscal then begin
     sNumero_cupom := cECF_COO_Nao_Fiscal(iECF_Modelo);
     sMsg := cECF_Suprimento(iECF_Modelo,ed_valor.Value, list_forma.Items.Strings[list_Forma.ItemIndex]);
    end
     else
    begin
     sNumero_cupom := Zerar( FloatToStr( Max('') ),9 );
     sMsg := 'OK';
    end;

    if sMsg <> 'OK' then begin
      if application.MessageBox(pwidechar('Erro a lan�ar o suprimento no ECF!'+#13+
                                'Mensagem: '+sMsg+#13+
                                'Deseja tentar outra vez?'),'Erro',mb_yesno+mb_iconerror)=
                                idno then
        break;
    end else begin
      if frmPrincipal.TipoImpressora = fiscal then
        sGNF := cECF_Numero_Contador_Operacao_NF(iECF_Modelo)
      else begin
        sGNF := Zerar( FloatToStr( Max('') ),9 );
      end;
      with frmModulo do begin


        try
        //Lan�amento DB SERVIDOR
          begin

            qrsuplimento_servidor.close;
            qrsuplimento_servidor.sql.clear;
            qrsuplimento_servidor.sql.add('select nf.coo, nf.data, nf.descricao, nf.valor,');
            qrsuplimento_servidor.sql.add('nf.hora, nf.codvendedor, vd.nome,');
            qrsuplimento_servidor.sql.add('nf.pego_porquem');
            qrsuplimento_servidor.sql.add('from nao_fiscal nf, c000008 vd');
            qrsuplimento_servidor.sql.add('where vd.codigo = nf.codvendedor and');
            qrsuplimento_servidor.sql.add('nf.CODIGO = :codigo');
            qrsuplimento_servidor.ParamByName('codigo').asstring := codifica_cupom;
            qrsuplimento_servidor.ExecSQL;

            qrsuplimento_servidor.Close;
            qrsuplimento_servidor.sql.clear;
            qrsuplimento_servidor.sql.add('INSERT INTO NAO_FISCAL');
            qrsuplimento_servidor.sql.add('(CODIGO, ECF, DATA, INDICE,');
            qrsuplimento_servidor.sql.add('DESCRICAO, VALOR, COO, GNF,');
            qrsuplimento_servidor.sql.add('DENOMINACAO, HORA,');
            qrsuplimento_servidor.sql.add('CODVENDEDOR)');
            qrsuplimento_servidor.sql.add('VALUES');
            qrsuplimento_servidor.sql.add('(:CODIGO,');
            qrsuplimento_servidor.sql.add(':ECF, :DATA, :INDICE,');
            qrsuplimento_servidor.sql.add(':DESCRICAO, :VALOR, :COO,');
            qrsuplimento_servidor.sql.add(':GNF, :DENOMINACAO,');
            qrsuplimento_servidor.sql.add(':HORA, :CODVENDEDOR)');
            qrsuplimento_servidor.ParamByName('codigo').asstring := codifica_cupom;
            qrsuplimento_servidor.ParamByName('ecf').AsString := sECF_Serial;
            qrsuplimento_servidor.ParamByName('data').asdatetime := dData_Sistema;
            qrsuplimento_servidor.ParamByName('indice').asstring := sIndice_Sangria;
            qrsuplimento_servidor.ParamByName('descricao').asstring := 'SUPRIMENTO';
            qrsuplimento_servidor.ParamByName('valor').asfloat := ed_valor.value;
            qrsuplimento_servidor.ParamByName('COO').asstring := sNumero_Cupom;
            qrsuplimento_servidor.ParamByName('GNF').asstring := sGNF;
            qrsuplimento_servidor.ParamByName('hora').Astime := strtotime(copy(cECF_Data_Hora(iECF_Modelo),12,8));
            qrsuplimento_servidor.ParamByName('DENOMINACAO').asstring := 'CN';
            qrsuplimento_servidor.ParamByName('codVendedor').asstring := frmvenda.lbcod_operador.Caption;
            qrsuplimento_servidor.ExecSQL;


          {spNao_FiscalSV.close;
          spNao_FiscalSV.parambyname('codigo').asstring := codifica_cupom;
          spNao_FiscalSV.ParamByName('ecf').AsString := sECF_Serial;
          spNao_FiscalSV.ParamByName('data').asdatetime := dData_Sistema;
          spNao_FiscalSV.ParamByName('indice').asstring := sIndice_Sangria;
          spNao_FiscalSV.ParamByName('descricao').asstring := 'SUPRIMENTO';
          spNao_FiscalSV.ParamByName('valor').asfloat := ed_valor.value;
          spNao_FiscalSV.ParamByName('hora').Astime := strtotime(copy(cECF_Data_Hora(iECF_Modelo),12,8));
          spNao_FiscalSV.ParamByName('COO').asstring := sNumero_Cupom;
          spNao_FiscalSV.ParamByName('GNF').asstring := sGNF;
          spNao_FiscalSV.ParamByName('CDC').Clear;
          spNao_FiscalSV.ParamByName('GRG').clear;
          spNao_FiscalSV.ParamByName('DENOMINACAO').asstring := 'CN';
          spNao_FiscalSV.ParamByName('codvendedor').asstring := frmvenda.lbcod_operador.Caption;
          spNao_FiscalSV.Prepare;
          spNao_FiscalSV.Execute;}
          end;

          Begin
           {fxSangria.LoadFromFile(ExtractFilePath(application.ExeName) + '\rel\F000002.fr3');
           frmModulo.Qremitente.Close;
           frmModulo.Qremitente.Open;
          if Editar then
           fxSangria.DesignReport
           else
           fxSangria.ShowReport; }

            qrsangria.close;
            qrsangria.sql.clear;
            qrsangria.sql.add('select nf.coo, nf.data, nf.descricao, nf.valor,');
            qrsangria.sql.add('nf.hora, nf.codvendedor, vd.nome,');
            qrsangria.sql.add('nf.pego_porquem');
            qrsangria.sql.add('from nao_fiscal nf, c000008 vd');
            qrsangria.sql.add('where vd.codigo = nf.codvendedor and');
            qrsangria.sql.add('nf.CODIGO = :codigo');
            qrsangria.ParamByName('codigo').asstring := codifica_cupom;
            qrsangria.ExecSQL;

            {fxSangria.PrepareReport;
            fxSangria.Print;}
            fxSangria.ShowReport();

          End;

        except
            Application.MessageBox('Erro a lan�ar a SUPRIMENTO!'+#13+
            'falha de conex�o com servidor.','Erro',mb_ok+mb_iconerror);
            ed_valor.setfocus;
            exit;
        end;

      end;
    end;
  until sMsg = 'OK';
  Close;
end;

procedure TfrmSuprimento.Cancelar1Click(Sender: TObject);
begin
   close;
end;

procedure TfrmSuprimento.FormShow(Sender: TObject);
begin
  TipoImp := frmPrincipal.TipoImpressora;
  frmPrincipal.TipoImpressora := NaoFiscal;

  list_forma.Clear;
  frmmodulo.tbforma_pgto.open;
  frmmodulo.tbForma_Pgto.First;
  while not frmModulo.tbForma_Pgto.Eof do
  begin
    sMsg := TrimLeft(TrimRight(frmmodulo.tbForma_Pgto.fieldbyname('nome').asstring));
    if (sMsg = '') or
       (ansiuppercase(sMsg) = 'VALOR RECEBIDO') or
       (ansiuppercase(sMsg) = 'TROCO') Then
    begin
       // nao copiar
    end
    else
    begin
      list_Forma.Items.Add(sMsg);
    end;
    frmModulo.tbForma_Pgto.Next;
  end;

  ed_valor.SetFocus;
end;

procedure TfrmSuprimento.fxSangria1BeforePrint(Sender: TfrxReportComponent);
begin
  if Sender is TfrxMemoView then begin
    if TfrxMemoView(Sender).Name = 'mCaixa' then
      TfrxMemoView(Sender).Text := 'Caixa:'+Zerar(IntToStr(iNumCaixa),3);
    if TfrxMemoView(Sender).Name = 'mValor' then
      TfrxMemoView(Sender).Text := FormatFloat('#,##0.00',ed_valor.Value);
    if TfrxMemoView(Sender).Name = 'mOperador' then
      TfrxMemoView(Sender).Text := 'Operador: ' + sNome_Operador;
    if TfrxMemoView(Sender).Name = 'mForma' then
      TfrxMemoView(Sender).Text := 'Forma: ' + list_forma.Items.Strings[list_Forma.ItemIndex];


  end;
end;

procedure TfrmSuprimento.list_FormaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then ed_valor.setfocus;
end;


end.
