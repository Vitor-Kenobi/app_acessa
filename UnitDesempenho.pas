unit UnitDesempenho;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TFrmDesempenho = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    img_voltar: TImage;
    procedure img_voltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDesempenho: TFrmDesempenho;

implementation

{$R *.fmx}

uses UnitPrincipal;

procedure TFrmDesempenho.img_voltarClick(Sender: TObject);
begin
    FrmDesempenho.Close;

end;

end.
