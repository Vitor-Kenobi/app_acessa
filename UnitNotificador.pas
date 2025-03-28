unit UnitNotificador;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  FMX.Layouts{$IFDEF ANDROID}
  ,FMX.Helpers.Android,
  Androidapi.Helpers
  {$ENDIF}
  {$IFDEF WINDOWS}
  ,Winapi.Windows
  {$ENDIF};

type
  TFrmNotificador = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    img_voltar: TImage;
    procedure img_voltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNotificador: TFrmNotificador;

implementation

{$R *.fmx}

uses UnitPrincipal;

procedure TFrmNotificador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FrmPrincipal.FullScreen := true;
end;

procedure TFrmNotificador.img_voltarClick(Sender: TObject);
begin
    FrmNotificador.Close;
end;

end.
