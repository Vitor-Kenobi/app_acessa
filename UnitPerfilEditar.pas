unit UnitPerfilEditar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TFrmPerfilEditar = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    img_voltar: TImage;
    Layout2: TLayout;
    rect_sair: TRectangle;
    Label11: TLabel;
    Layout9: TLayout;
    circ_perfil: TCircle;
    lbl_fun��o_editar: TLabel;
    lbl_nome_editar: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPerfilEditar: TFrmPerfilEditar;

implementation

{$R *.fmx}

end.
