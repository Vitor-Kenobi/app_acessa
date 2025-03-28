unit UnitLancamentos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,FMX.DialogService,
  FMX.ListView{$IFDEF ANDROID}
  ,FMX.Helpers.Android,
  Androidapi.Helpers
  {$ENDIF};

type
  TFrmLancamentos = class(TForm)
    Layout1: TLayout;
    img_voltar: TImage;
    Label1: TLabel;
    Rectangle1: TRectangle;
    layout_add: TLayout;
    lay_count_lancamentos: TLayout;
    img_add: TImage;
    lbl_add: TLabel;
    lbl_count_registros: TLabel;
    layout_excluir: TLayout;
    img_excluir: TImage;
    lbl_excluir: TLabel;
    lv_lancamento: TListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure img_addClick(Sender: TObject);
    procedure lv_lancamentoUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure img_voltarClick(Sender: TObject);
    procedure lv_lancamentoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure img_excluirClick(Sender: TObject);

  private
    procedure EditarMateria(id_lancamento: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLancamentos: TFrmLancamentos;

implementation

{$R *.fmx}

uses UnitPrincipal, UnitLancamentosAdd;

procedure TFrmLancamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //Action := TCloseAction.caFree;
    //FrmLancamentos := nil;
end;

procedure TFrmLancamentos.FormShow(Sender: TObject);
var
    foto : TStream;
    x : integer;
    itens : integer;
begin
    foto := TMemoryStream.Create;
    FrmPrincipal.img_categoria.Bitmap.SaveToStream(foto);
    foto.Position := 0;

    for x := 1 to 13 do
    begin
      if x = 1 then
          FrmPrincipal.AddLancamento(FrmLancamentos.lv_lancamento,'01', 'Biologia', 'Ci�ncias Biol�gicas', '2', date, foto);

      if x = 2 then
         FrmPrincipal.AddLancamento(FrmLancamentos.lv_lancamento,'02', 'Hist�ria', 'Ci�ncias Humanas', '1', date, foto);

      if x = 3 then
         FrmPrincipal.AddLancamento(FrmLancamentos.lv_lancamento,'03', 'Portugu�s', 'L�nguas', '1', date, foto);

      if x = 4 then
      begin
         FrmPrincipal.AddLancamento(FrmLancamentos.lv_lancamento,'04', 'Matem�tica', 'Ci�ncias Exatas', '1', date, foto);
      end
      else
         FrmPrincipal.AddLancamento(FrmLancamentos.lv_lancamento,'xx', 'Testeeee', 'Categoria teste', '1', date, foto);
      end;


    itens := lv_lancamento.Items.Count;
    lbl_count_registros.Text := IntToStr(itens) + ' mat�ria(s)';

    foto.DisposeOf;
end;

procedure TFrmLancamentos.img_addClick(Sender: TObject);
begin
    EditarMateria('');
end;

procedure TFrmLancamentos.img_excluirClick(Sender: TObject);
begin
    FrmLancamentos.lv_lancamento.Items.Clear;
end;

procedure TFrmLancamentos.img_voltarClick(Sender: TObject);
begin
    FrmLancamentos.Close;

end;

procedure TFrmLancamentos.EditarMateria(id_lancamento: string);
begin
    if NOT Assigned(FrmLancamentosAdd) then
        Application.CreateForm(TFrmLancamentosAdd, FrmLancamentosAdd);
        FrmLancamentosAdd.Show;
end;

procedure TFrmLancamentos.lv_lancamentoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
   EditarMateria('');
end;

procedure TFrmLancamentos.lv_lancamentoUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
   FrmPrincipal.SetUpMaterias(FrmLancamentos.lv_lancamento, AItem);
end;

end.
