unit UnitLancamentosAdd;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit,
  FMX.DateTimeCtrls, FMX.ListBox{$IFDEF ANDROID}
  ,FMX.Helpers.Android,
  Androidapi.Helpers
  {$ENDIF};

type
  TFrmLancamentosAdd = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    img_voltar: TImage;
    layout_descricao: TLayout;
    lbl_descricao: TLabel;
    edt_descricao: TEdit;
    Line1: TLine;
    layout_categoria: TLayout;
    lbl_categoria: TLabel;
    edt_categoria: TEdit;
    Line2: TLine;
    layout_data: TLayout;
    lbl_data_lancamento: TLabel;
    Line3: TLine;
    dt_lancamento: TDateEdit;
    Rectangle1: TRectangle;
    img_salvar_materia: TImage;
    img_delete: TImage;
    img_limpar: TImage;
    layout_delete: TLayout;
    layout_limpar: TLayout;
    layout_salvar: TLayout;
    lbl_delete: TLabel;
    lbl_salvar: TLabel;
    Label2: TLabel;
    Layout2: TLayout;
    lbl_icone: TLabel;
    lb_icone: TListBox;
    ListBoxItem1: TListBoxItem;
    img_selecao: TImage;
    Image1: TImage;
    ListBoxItem2: TListBoxItem;
    Image2: TImage;
    ListBoxItem3: TListBoxItem;
    Image3: TImage;
    ListBoxItem4: TListBoxItem;
    Image4: TImage;
    ListBoxItem5: TListBoxItem;
    Image5: TImage;
    ListBoxItem6: TListBoxItem;
    Image6: TImage;
    ListBoxItem7: TListBoxItem;
    Image7: TImage;
    ListBoxItem8: TListBoxItem;
    Image8: TImage;
    ListBoxItem9: TListBoxItem;
    Image9: TImage;
    ListBoxItem10: TListBoxItem;
    Image10: TImage;
    ListBoxItem11: TListBoxItem;
    Image11: TImage;
    ListBoxItem12: TListBoxItem;
    Image12: TImage;
    ListBoxItem13: TListBoxItem;
    Image13: TImage;
    ListBoxItem14: TListBoxItem;
    Image14: TImage;
    ListBoxItem15: TListBoxItem;
    Image15: TImage;
    ListBoxItem16: TListBoxItem;
    Image16: TImage;
    procedure img_voltarClick(Sender: TObject);
    procedure img_limparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLancamentosAdd: TFrmLancamentosAdd;

implementation

{$R *.fmx}

uses UnitPrincipal;

procedure TFrmLancamentosAdd.img_limparClick(Sender: TObject);
begin
    edt_descricao.Text := '';
    edt_categoria.Text:= '';
    dt_lancamento.Text := DateToStr(Date);
end;

procedure TFrmLancamentosAdd.img_voltarClick(Sender: TObject);
begin
    FrmLancamentosAdd.Close;

end;

end.
