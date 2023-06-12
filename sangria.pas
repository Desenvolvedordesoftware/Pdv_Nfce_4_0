unit sangria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, RzEdit, Menus, AdvMenus, ComCtrls,
  XPMan, AdvGlowButton, AdvMetroButton, AdvSmoothPanel, AdvSmoothExpanderPanel,
  principal, frxClass, frxDBSet, frxDesgn, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, MemDS, DBAccess, Uni;

type
  TfrmSangria = class(TForm)
    Panel1: TPanel;
    bt_ok1: TButton;
    bt_cancelar1: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    ed_valor: TRzNumericEdit;
    pop_fechamento: TAdvPopupMenu;
    Cancelar1: TMenuItem;
    AdvSmoothExpanderPanel1: TAdvSmoothExpanderPanel;
    Label53: TLabel;
    AdvMetroButton1: TAdvMetroButton;
    bt_ok: TAdvGlowButton;
    bt_cancelar: TAdvGlowButton;
    fxSangria: TfrxReport;
    frxEmitente: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    ActionManager1: TActionManager;
    Action1: TAction;
    lbEdicao: TLabel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel4: TPanel;
    Button3: TButton;
    Button4: TButton;
    Edit2: TEdit;
    Label7: TLabel;
    frxobs_sangria: TfrxDBDataset;
    qrobs_sangria: TUniQuery;
    qrsangria: TUniQuery;
    qrobs_sangriaSV: TUniQuery;
    qrsangria_servidor: TUniQuery;
    qrsagriaSV: TUniQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_cancelar1Click(Sender: TObject);
    procedure bt_ok1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure AdvMetroButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fxSangriaBeforePrint(Sender: TfrxReportComponent);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ed_valorEnter(Sender: TObject);
    procedure ed_valorExit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    TipoImp: TImpressora;
    Editar:Boolean;
  public
    { Public declarations }
  end;

var
  frmSangria: TfrmSangria;

implementation

uses modulo, unECF, funcoes, menu_fiscal, UFuncoes, venda;

{$R *.dfm}

procedure TfrmSangria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.TipoImpressora := TipoImp;
  action := cafree;
end;

procedure TfrmSangria.FormCreate(Sender: TObject);
begin
  Editar := False;
end;

procedure TfrmSangria.FormShow(Sender: TObject);
begin
  TipoImp := frmPrincipal.TipoImpressora;
  frmPrincipal.TipoImpressora := NaoFiscal;
end;

procedure TfrmSangria.fxSangriaBeforePrint(Sender: TfrxReportComponent);
begin
  if Sender is TfrxMemoView then begin
    if TfrxMemoView(Sender).Name = 'mCaixa' then
      TfrxMemoView(Sender).Text := 'Caixa:'+Zerar(IntToStr(iNumCaixa),3);
    if TfrxMemoView(Sender).Name = 'mValor' then
      TfrxMemoView(Sender).Text := FormatFloat('#,##0.00',ed_valor.Value);
    if TfrxMemoView(Sender).Name = 'mOperador' then
      TfrxMemoView(Sender).Text := 'Operador: ' + sNome_Operador;
  end;

end;

procedure TfrmSangria.Action1Execute(Sender: TObject);
begin
  if Editar then
    Editar := False
  else
    Editar := True;
  lbEdicao.Visible := Editar;
end;

procedure TfrmSangria.AdvMetroButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmSangria.bt_cancelar1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmSangria.bt_ok1Click(Sender: TObject);
begin
  if ed_valor.value <= 0 then begin
    Application.MessageBox('Favor informar um valor MAIOR que ZERO!','Erro',mb_ok+mb_iconerror);
    ed_valor.setfocus;
    exit;
  end;

  repeat
    // extrair do ecf
    if frmPrincipal.TipoImpressora = fiscal then begin
      sNumero_cupom := cECF_COO_Nao_Fiscal(iECF_Modelo);
      sMsg := cECF_Sangria(iECF_Modelo,ed_valor.Value);

    end else begin




      sNumero_cupom := zerar(FloatToStr( max('')),9);
      //fxSangria.ShowReport();
      //fxSangria.LoadFromFile(ExtractFilePath(application.ExeName) + '\rel\F000001.fr3');
      frmModulo.Qremitente.Close;
      frmModulo.Qremitente.Open;
      if Editar then
        //fxSangria.DesignReport
      else
        //fxSangria.ShowReport;
      sMsg := 'OK';
      sMsg := Imp_Sangria(sPortaNaoFiscal,ed_valor.Value);
      if Length(sNumero_Cupom) = 9 then
      sNumero_Cupom := '9' + sNumero_Cupom;
    end;


    if sMsg <> 'OK' then begin
      if application.MessageBox(pwidechar('Erro a lan�ar a sangria no ECF!'+#13+
                                          'Mensagem: '+sMsg+#13+
                                          'Deseja tentar outra vez?'),'Erro',mb_yesno+mb_iconerror)=
                                          idno then
                                                break;
    end else begin
      // extrair o numero dos contadores
      if frmPrincipal.TipoImpressora = fiscal then
        sGNF := cECF_Numero_Contador_Operacao_NF(iECF_Modelo)
      else begin
        sGNF := zerar(FloatToStr(Max('')),10  );
        if Length(sGNF) = 10 then
          sNumero_cupom := Zerar( FloatToStr( Max('') ),9 );
         if Length(sNumero_Cupom) = 9 then
            sNumero_Cupom := '9' + sNumero_Cupom;


      end;

      with frmModulo do begin

        try
          Begin
            {spNao_FiscalSV.close;
            spNao_FiscalSV.ParamByName('codigo').asstring := codifica_cupom;
            spNao_FiscalSV.ParamByName('ecf').AsString := sECF_Serial;
            spNao_FiscalSV.ParamByName('data').asdatetime := dData_Sistema;
            spNao_FiscalSV.ParamByName('indice').asstring := sIndice_Sangria;
            spNao_FiscalSV.ParamByName('descricao').asstring := 'SANGRIA';
            spNao_FiscalSV.ParamByName('valor').asfloat := ed_valor.value;
            spNao_FiscalSV.ParamByName('hora').Astime := strtotime(copy(cECF_Data_Hora(iECF_Modelo),12,8));
            spNao_FiscalSV.ParamByName('COO').asstring := sNumero_Cupom;
            spNao_FiscalSV.ParamByName('GNF').asstring := sGNF;
            spNao_FiscalSV.ParamByName('CDC').Clear;
            spNao_FiscalSV.ParamByName('GRG').clear;
            spNao_FiscalSV.ParamByName('DENOMINACAO').asstring := 'CN';
            spNao_FiscalSV.ParamByName('codVendedor').asstring := frmvenda.lbcod_operador.Caption;
            spNao_FiscalSV.Prepare;
            spNao_FiscalSV.Execute; }

            qrsagriaSV.close;
            qrsagriaSV.sql.clear;
            qrsagriaSV.sql.add('select nf.coo, nf.data, nf.descricao, nf.valor,');
            qrsagriaSV.sql.add('nf.hora, nf.codvendedor, vd.nome,');
            qrsagriaSV.sql.add('nf.pego_porquem');
            qrsagriaSV.sql.add('from nao_fiscal nf, c000008 vd');
            qrsagriaSV.sql.add('where vd.codigo = nf.codvendedor and');
            qrsagriaSV.sql.add('nf.CODIGO = :codigo');
            qrsagriaSV.ParamByName('codigo').asstring := codifica_cupom;
            qrsagriaSV.ExecSQL;

            qrsagriaSV.Close;
            qrsagriaSV.sql.clear;
            qrsagriaSV.sql.add('INSERT INTO NAO_FISCAL');
            qrsagriaSV.sql.add('(CODIGO, ECF, DATA, INDICE,');
            qrsagriaSV.sql.add('DESCRICAO, VALOR, COO, GNF,');
            qrsagriaSV.sql.add('DENOMINACAO, HORA,');
            qrsagriaSV.sql.add('CODVENDEDOR)');
            qrsagriaSV.sql.add('VALUES');
            qrsagriaSV.sql.add('(:CODIGO,');
            qrsagriaSV.sql.add(':ECF, :DATA, :INDICE,');
            qrsagriaSV.sql.add(':DESCRICAO, :VALOR, :COO,');
            qrsagriaSV.sql.add(':GNF, :DENOMINACAO,');
            qrsagriaSV.sql.add(':HORA, :CODVENDEDOR)');
            qrsagriaSV.ParamByName('codigo').asstring := codifica_cupom;
            qrsagriaSV.ParamByName('ecf').AsString := sECF_Serial;
            qrsagriaSV.ParamByName('data').asdatetime := dData_Sistema;
            qrsagriaSV.ParamByName('indice').asstring := sIndice_Sangria;
            qrsagriaSV.ParamByName('descricao').asstring := 'SANGRIA';
            qrsagriaSV.ParamByName('valor').asfloat := ed_valor.value;
            qrsagriaSV.ParamByName('COO').asstring := sNumero_Cupom;
            qrsagriaSV.ParamByName('GNF').asstring := sGNF;
            qrsagriaSV.ParamByName('hora').Astime := strtotime(copy(cECF_Data_Hora(iECF_Modelo),12,8));
            qrsagriaSV.ParamByName('DENOMINACAO').asstring := 'CN';
            qrsagriaSV.ParamByName('codVendedor').asstring := frmvenda.lbcod_operador.Caption;
            qrsagriaSV.ExecSQL;
          End;

          Begin
            qrobs_sangria.Close;
            qrobs_sangria.sql.clear;
            qrobs_sangria.sql.add('update nao_fiscal set pego_porquem = :OBS ');
            qrobs_sangria.sql.add('where');
            qrobs_sangria.sql.add('CODIGO = :codigo');
            qrobs_sangria.ParamByName('codigo').asstring := codifica_cupom;
            qrobs_sangria.Parambyname('OBS').asstring := Edit2.text;
            qrobs_sangria.ExecSQL;
           end;

        except
          Application.MessageBox('Erro a lan�ar a SANGRIA!'+#13+
          'falha de conex�o com servidor.','Erro',mb_ok+mb_iconerror);
          ed_valor.setfocus;
          exit;
        end;





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


      end;
    end;
  until sMsg = 'OK';
  close;
end;

procedure TfrmSangria.Cancelar1Click(Sender: TObject);
begin
   close;
end;


procedure TfrmSangria.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then bt_ok1.SetFocus;
end;

procedure TfrmSangria.ed_valorEnter(Sender: TObject);
begin
  Edit2.SetFocus;
end;

procedure TfrmSangria.ed_valorExit(Sender: TObject);
begin
Edit2.SetFocus;
end;

end.