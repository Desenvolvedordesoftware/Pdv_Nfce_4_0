unit xloc_cfop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb, ExtCtrls,
  Collection, TFlatPanelUnit, Menus, Grids, Wwdbigrd, Wwdbgrid, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, MemDS, DBAccess, Uni,
  Vcl.Buttons, AdvGlowButton, JvExMask, JvToolEdit, NxColumnClasses, NxColumns,
  NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid, Vcl.DBCtrls;

type
  Tfrmxloc_cfop = class(TForm)
    FlatPanel1: TFlatPanel;
    combo_localizar: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    combo_referencia: TComboBox;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    loc: TEdit;
    PopupMenu1: TPopupMenu;
    Localizarpor1: TMenuItem;
    Referncia1: TMenuItem;
    ParmetrosdaPesquisa1: TMenuItem;
    GRID: TwwDBGrid;
    ds: TDataSource;
    N1: TMenuItem;
    Fechar1: TMenuItem;
    Bevel3: TBevel;
    query: TUniQuery;
    Label7: TLabel;
    ed_data: TJvDateEdit;
    AdvGlowButton1: TAdvGlowButton;
    Label8: TLabel;
    Panel2: TPanel;
    BitBtn11: TBitBtn;
    bt_fechar1: TBitBtn;
    bt_fechar: TAdvGlowButton;
    Reimpressao_venda: TAdvGlowButton;
    bt_cancelar_venda: TAdvGlowButton;
    qrSup_Sang: TUniQuery;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    procedure Localizarpor1Click(Sender: TObject);
    procedure Referncia1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Fechar1Click(Sender: TObject);
    procedure locKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GRIDKeyPress(Sender: TObject; var Key: Char);
    procedure locKeyPress(Sender: TObject; var Key: Char);
    procedure locEnter(Sender: TObject);
    procedure locExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GRIDEnter(Sender: TObject);
    procedure GRIDExit(Sender: TObject);
    procedure locChange(Sender: TObject);
    procedure GRIDDblClick(Sender: TObject);
    procedure ParmetrosdaPesquisa1Click(Sender: TObject);
    procedure grid_cupomCellFormating(Sender: TObject; ACol, ARow: Integer;
      var TextColor: TColor; var FontStyle: TFontStyles; CellState: TCellState);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure bt_cancelar_vendaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmxloc_cfop: Tfrmxloc_cfop;
  voltar : boolean;

implementation

uses modulo;

{$R *.dfm}

procedure Tfrmxloc_cfop.Localizarpor1Click(Sender: TObject);

 begin

     { qrSup_Sang.Close;
      qrSup_Sang.sql.clear;
      qrSup_Sang.sql.add('update nao_fiscal set descricao = ''CANCELADO''');
      qrSup_Sang.sql.add('where');
      qrSup_Sang.sql.add('coo = ''' +grid.Cell[4,grid.selectedrow].asstring+ '''');
      qrSup_Sang.open;}

  {X := combo_localizar.Items.Count - 1;
  if combo_localizar.ItemIndex = x then
     combo_localizar.ItemIndex := 0
  else
     combo_localizar.ItemIndex := combo_localizar.ItemIndex + 1}
 end;

procedure Tfrmxloc_cfop.Referncia1Click(Sender: TObject);
VAR X : INTEGER;
begin
  X := combo_referencia.Items.Count - 1;
  if combo_referencia.ItemIndex = x then
     combo_referencia.ItemIndex := 0
  else
     combo_referencia.ItemIndex := combo_referencia.ItemIndex + 1

end;

procedure Tfrmxloc_cfop.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
PARAMETRO_PESQUISA := '';
  ACTION := CAFREE;
end;

procedure Tfrmxloc_cfop.AdvGlowButton1Click(Sender: TObject);
   begin
      qrSup_Sang.Close;
      qrSup_Sang.sql.clear;
      qrSup_Sang.sql.add('select coo as Codigo, data, hora, descricao, valor');
      qrSup_Sang.sql.add('from nao_fiscal');
      qrSup_Sang.sql.add('where');
      qrSup_Sang.sql.add('data = :data');
      qrSup_Sang.sql.add('order by coo');
      qrSup_Sang.parambyname('data').asdatetime := ed_data.Date;
      qrSup_Sang.open;

     grid.setfocus;
    end;

procedure Tfrmxloc_cfop.bt_cancelar_vendaClick(Sender: TObject);
begin
      qrSup_Sang.Close;
      qrSup_Sang.sql.clear;
      qrSup_Sang.sql.add('update nao_fiscal set descricao = ''CANCELADO''');
      qrSup_Sang.sql.add('where');
      qrSup_Sang.sql.add('coo = ''' +DBEdit1.Text+ '''');
      qrSup_Sang.open;
end;

procedure Tfrmxloc_cfop.Fechar1Click(Sender: TObject);
begin
  if voltar then loc.setfocus else
  begin
    resultado_pesquisa1 := '';
    resultado_pesquisa2 := '';
    resultado_pesquisa3 := '';
    RESULTADO_PESQUISA4 := '';
    close;
  end;
end;

procedure Tfrmxloc_cfop.locKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_down then
  begin
    grid.setfocus;
  end;
end;

procedure Tfrmxloc_cfop.GRIDKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if query.RecNo > 0 then
    begin
      resultado_pesquisa1 := query.fieldbyname('cfop').asstring;
      resultado_pesquisa2 := query.fieldbyname('natureza').asstring;
      close;
    end;
  end;
end;

procedure Tfrmxloc_cfop.grid_cupomCellFormating(Sender: TObject; ACol,
  ARow: Integer; var TextColor: TColor; var FontStyle: TFontStyles;
  CellState: TCellState);
begin
//if GRID.Cell[5,arow].AsInteger = 1 then TextColor := clred;
end;

procedure Tfrmxloc_cfop.locKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if query.RecNo > 0 then
    begin
      resultado_pesquisa1 := query.fieldbyname('cfop').asstring;
      resultado_pesquisa2 := query.fieldbyname('natureza').asstring;
      close;
    end;
  end;
end;

procedure Tfrmxloc_cfop.locEnter(Sender: TObject);
begin
  tedit(sender).color := $00A0FAF8;
  voltar := false;
end;

procedure Tfrmxloc_cfop.locExit(Sender: TObject);
begin
  tedit(sender).color := clwindow;
end;

procedure Tfrmxloc_cfop.FormShow(Sender: TObject);
 begin
  ed_data.text :=FormatDateTime('dd/mm/yyyy',Now);

  qrSup_Sang.Close;
  qrSup_Sang.sql.clear;
  qrSup_Sang.sql.add('select coo as Codigo, data, hora, descricao, valor');
  qrSup_Sang.sql.add('from nao_fiscal');
  qrSup_Sang.sql.add('where');
  qrSup_Sang.sql.add('data = :data');
  qrSup_Sang.sql.add('order by coo');
  qrSup_Sang.parambyname('data').asdatetime := ed_data.Date;
  qrSup_Sang.open;

  grid.setfocus;

  end;

procedure Tfrmxloc_cfop.GRIDEnter(Sender: TObject);
begin
  voltar := true;
 // lvoltar.Caption := 'VOLTAR';
end;

procedure Tfrmxloc_cfop.GRIDExit(Sender: TObject);
begin
//  lvoltar.Caption := 'FECHAR';
  VOLTAR := FALSE;
end;

procedure Tfrmxloc_cfop.locChange(Sender: TObject);
var ref, tipo : string;
begin
  if combo_referencia.ItemIndex = 0 then ref := '' else ref := '%';
  case combo_localizar.ItemIndex  OF
  0:TIPO := 'NATUREZA';
  1:TIPO := 'CFOP';
  end;

  try
    query.close;
    query.sql.clear;
    if loc.text = '' then
      query.sql.Add('select * from c000030 where cfop IS NOT NULL and tipo '+parametro_pesquisa+' ORDER BY NATUREZA')
    else
      query.sql.Add('select * from c000030 where upper('+tipo+') like '''+ref+loc.Text+'%'' and tipo '+parametro_pesquisa+' order by '+tipo);
    query.open;
  except
  end;
end;

procedure Tfrmxloc_cfop.GRIDDblClick(Sender: TObject);
begin
   resultado_pesquisa1 := query.fieldbyname('cfop').asstring;
   resultado_pesquisa2 := query.fieldbyname('NATUREZA').asstring;
   close;

end;

procedure Tfrmxloc_cfop.ParmetrosdaPesquisa1Click(Sender: TObject);
begin
  LOC.SETFOCUS;
end;

end.