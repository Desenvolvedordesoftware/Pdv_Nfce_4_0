unit xloc_servico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb, ExtCtrls,
  Collection, TFlatPanelUnit, Menus, Grids, Wwdbigrd, Wwdbgrid, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, MemDS, DBAccess, Uni,
  AdvGlowButton, AdvMetroButton, AdvMenus;

type
  Tfrmxloc_servico = class(TForm)
    FlatPanel1: TFlatPanel;
    combo_localizar: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    combo_referencia: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    loc: TEdit;
    PopupMenu1: TPopupMenu;
    Localizarpor1: TMenuItem;
    Referncia1: TMenuItem;
    ParmetrosdaPesquisa1: TMenuItem;
    ds: TDataSource;
    N1: TMenuItem;
    Fechar1: TMenuItem;
    Bevel3: TBevel;
    query: TUniQuery;
    Label7: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Orçamento: TAdvGlowButton;
    Label4: TLabel;
    AdvMetroButton1: TAdvMetroButton;
    balterar: TAdvGlowButton;
    blocalizar: TAdvGlowButton;
    Query1: TUniQuery;
    ds1: TDataSource;
    Grid: TwwDBGrid;
    Edit1: TEdit;
    Label8: TLabel;
    pop_consumid: TAdvPopupMenu;
    MenuItem2: TMenuItem;
    AdvPopupMenu1: TAdvPopupMenu;
    MenuItem1: TMenuItem;
    procedure Localizarpor1Click(Sender: TObject);
    procedure Referncia1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Fechar1Click(Sender: TObject);
    procedure locKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GRIDKeyPress(Sender: TObject; var Key: Char);
    procedure locEnter(Sender: TObject);
    procedure locExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GRIDEnter(Sender: TObject);
    procedure GRIDExit(Sender: TObject);
    procedure locChange(Sender: TObject);
    procedure GRIDDblClick(Sender: TObject);
    procedure ParmetrosdaPesquisa1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure AdvMetroButton1Click(Sender: TObject);
    procedure blocalizarClick(Sender: TObject);
    procedure OrçamentoClick(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure MenuItem2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmxloc_servico: Tfrmxloc_servico;
  voltar : boolean;

implementation

uses modulo;

{$R *.dfm}

procedure Tfrmxloc_servico.Localizarpor1Click(Sender: TObject);
VAR X : INTEGER;
begin

     combo_localizar.ItemIndex := 0

end;

procedure Tfrmxloc_servico.Referncia1Click(Sender: TObject);
VAR X : INTEGER;
begin

     combo_referencia.ItemIndex := 0

end;

procedure Tfrmxloc_servico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  ACTION := CAFREE;
end;

procedure Tfrmxloc_servico.AdvMetroButton1Click(Sender: TObject);
begin
   close;
end;

procedure Tfrmxloc_servico.blocalizarClick(Sender: TObject);

  begin
    // buscar pelo nome
    query.close;
    query.sql.clear;
    query.SQL.Add('select PRODUTO, PRECOVENDA AS VALOR');
   query.SQL.Add('from c000025');
   query.sql.add('where upper(PRODUTO) LIKE ''%' + ANSIUPPERCASE(Edit2.Text) + '%''');
    query.open;

  grid.SetFocus;

end;

procedure Tfrmxloc_servico.Edit1Change(Sender: TObject);

begin
    query.close;
    query.sql.clear;
    query.SQL.Add('select PRODUTO, PRECOVENDA AS VALOR');
   query.SQL.Add('where upper(PRODUTO) LIKE ''%' + ANSIUPPERCASE(Edit2.Text) + '%'' order by CODIGO ');
  grid.SetFocus;
end;


procedure Tfrmxloc_servico.Edit1Enter(Sender: TObject);
begin
tedit(sender).color := $00A0FAF8;
  voltar := false;
end;

procedure Tfrmxloc_servico.Edit1Exit(Sender: TObject);
begin
tedit(sender).color := clwindow;
end;

procedure Tfrmxloc_servico.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = vk_down then
  begin
//    IF PPROCURA.Visible THEN WWDBGRID1.SetFocus ELSE grid.setfocus;
  end;
end;

procedure Tfrmxloc_servico.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then begin


   if Edit1.Text <= '' then begin
    Application.MessageBox('Favor informar CODIGO DE BARRA!','Erro',mb_ok+mb_iconerror);
    exit;
  end;

    // buscar pelo nome
    query.close;
    query.sql.clear;
    //query.SQL.Add('select PRODUTO, PRECOVENDA AS VALOR');
   query.SQL.Add('select PRODUTO, PRECOVENDA AS VALOR from C000025');
   query.sql.add('where CODBARRA = ''' + ANSIUPPERCASE(Edit1.Text) + '''');
    query.open;

  grid.SetFocus;
 end;
end;

procedure Tfrmxloc_servico.Edit2Enter(Sender: TObject);
begin
  tedit(sender).color := $00A0FAF8;
  voltar := false;
end;

procedure Tfrmxloc_servico.Edit2Exit(Sender: TObject);
begin
  tedit(sender).color := clwindow;
end;

procedure Tfrmxloc_servico.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = vk_down then
  begin
//    IF PPROCURA.Visible THEN WWDBGRID1.SetFocus ELSE grid.setfocus;
  end;
end;


procedure Tfrmxloc_servico.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin


   if Edit2.Text <= '' then begin
    Application.MessageBox('Favor informar DESCRIÇÃO!','Erro',mb_ok+mb_iconerror);
    exit;
  end;

    // buscar pelo nome
    query.close;
    query.sql.clear;
    query.SQL.Add('select PRODUTO, PRECOVENDA AS VALOR');
   query.SQL.Add('from c000025');
   query.sql.add('where upper(PRODUTO) LIKE ''%' + ANSIUPPERCASE(Edit2.Text) + '%''');
    query.open;

  grid.SetFocus;
end;
end;


procedure Tfrmxloc_servico.Fechar1Click(Sender: TObject);
begin
  if voltar then loc.setfocus else
  begin
    resultado_pesquisa1 := '';
  end;
end;

procedure Tfrmxloc_servico.locKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_down then
  begin
    grid.setfocus;
  end;
end;

procedure Tfrmxloc_servico.MenuItem2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmxloc_servico.GRIDKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if query.RecNo > 0 then
    begin
      resultado_pesquisa1 := query.fieldbyname('PRODUTO').asstring;
    end;
  end;
end;

procedure Tfrmxloc_servico.OrçamentoClick(Sender: TObject);
begin

voltar := false;
  voltar := false;
  query.Close;
  query.SQL.clear;
  query.SQL.Add('select PRODUTO, PRECOVENDA AS VALOR');
   query.SQL.Add('from c000025');
   query.sql.add('where upper(PRODUTO) LIKE ''%' + ANSIUPPERCASE(Edit2.Text) + '%''');
  query.open;
  grid.SetFocus;
end;

procedure Tfrmxloc_servico.locEnter(Sender: TObject);
begin
  tedit(sender).color := $00A0FAF8;
  voltar := false;
end;

procedure Tfrmxloc_servico.locExit(Sender: TObject);
 begin
 Edit1.SETFOCUS;
//  blocalizar.setfocus;

end;


procedure Tfrmxloc_servico.FormShow(Sender: TObject);
begin
  voltar := false;
  query.Close;
  query.SQL.clear;
  query.SQL.Add('select PRODUTO, PRECOVENDA AS VALOR');
   query.SQL.Add('from c000025');
   query.open;

    Edit1.SETFOCUS;
end;

procedure Tfrmxloc_servico.GRIDEnter(Sender: TObject);
begin
  voltar := true;
  //lvoltar.Caption := 'VOLTAR';
end;

procedure Tfrmxloc_servico.GRIDExit(Sender: TObject);
begin
 // lvoltar.Caption := 'FECHAR';
  VOLTAR := FALSE;
end;

procedure Tfrmxloc_servico.locChange(Sender: TObject);
begin
voltar := false;
  query.Close;
  query.SQL.clear;
  query.SQL.Add('select PRODUTO, PRECOVENDA AS VALOR');
   query.SQL.Add('from c000025');
   query.open;

end;

procedure Tfrmxloc_servico.GRIDDblClick(Sender: TObject);
begin
      resultado_pesquisa1 := query.fieldbyname('PRODUTO').asstring;

end;

procedure Tfrmxloc_servico.ParmetrosdaPesquisa1Click(Sender: TObject);
begin
  Edit1.SETFOCUS;
end;

end.
