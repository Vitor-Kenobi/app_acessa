unit UnitCheckList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView{$IFDEF ANDROID}
  ,FMX.Helpers.Android,
  Androidapi.Helpers
  {$ENDIF};

type
  TFrmChecklist = class(TForm)
    Rectangle1: TRectangle;
    layout_add: TLayout;
    img_add: TImage;
    lbl_add: TLabel;
    lay_count_tarefas: TLayout;
    lbl_count_tarefas: TLabel;
    layout_excluir: TLayout;
    img_excluir: TImage;
    lbl_excluir: TLabel;
    Layout1: TLayout;
    Label1: TLabel;
    img_voltar: TImage;
    lv_tarefas: TListView;
    img_tarefa_false: TImage;
    img_tarefa_true: TImage;
    procedure FormShow(Sender: TObject);
    procedure img_addClick(Sender: TObject);
    procedure lv_tarefasItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure img_excluirClick(Sender: TObject);
    procedure img_voltarClick(Sender: TObject);
  private
      procedure AddTarefa(listview: TListView; id_tarefa, desc_tarefa: string; dt: TDateTime; foto: TStream);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChecklist: TFrmChecklist;

implementation

{$R *.fmx}

uses UnitCheckListAdd, UnitPrincipal;

procedure TFrmChecklist.AddTarefa(listview: TListView; id_tarefa, desc_tarefa: string; dt: TDateTime; foto: TStream);
var
    txt : TListItemText;
    img : TListItemImage;
    bmp : TBitmap;
begin
    with listview.Items.Add do
    begin
        TagString := id_tarefa;

        txt := TListItemText(Objects.FindDrawable('TxtTarefa'));
        txt.Text := desc_tarefa;

        TListItemText(Objects.FindDrawable('TxtData')).Text := FormatDateTime('dd/mm', dt);

        // Icone...
        img := TListItemImage(Objects.FindDrawable('ImgIcone'));

        if foto <> nil then
        begin
            bmp := TBitmap.Create;
            bmp.LoadFromStream(foto);

            img.OwnsBitmap := true;
            img.Bitmap := bmp;
        end;

    end;
end;

procedure TFrmChecklist.FormShow(Sender: TObject);
var
    foto : TStream;
    x : integer;
    itens : integer;
begin
    foto := TMemoryStream.Create;
    img_tarefa_false.Bitmap.SaveToStream(foto);
    foto.Position := 0;

    for x := 1 to 10 do

    AddTarefa(FrmChecklist.lv_tarefas,'01', 'Exemplo', date, foto);


    itens := lv_tarefas.Items.Count;
    lbl_count_tarefas.Text := IntToStr(itens) + ' tarefa(s)';

    foto.DisposeOf;
end;

procedure TFrmChecklist.img_addClick(Sender: TObject);
begin
    if NOT Assigned(FrmChecklistAdd) then
        Application.CreateForm(TFrmChecklistAdd, FrmChecklistAdd);
        FrmChecklistAdd.Show;
end;

procedure TFrmChecklist.img_excluirClick(Sender: TObject);
begin
    FrmChecklist.lv_tarefas.Items.Clear;
end;

procedure TFrmChecklist.img_voltarClick(Sender: TObject);
begin
    FrmChecklist.Close;

end;

procedure TFrmChecklist.lv_tarefasItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
    if NOT Assigned(FrmChecklistAdd) then
        Application.CreateForm(TFrmChecklist, FrmChecklist);
        FrmChecklistAdd.Show;
end;

end.
