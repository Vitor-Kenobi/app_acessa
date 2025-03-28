unit UnitCheckListAdd;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit,
  FMX.DateTimeCtrls{$IFDEF ANDROID}
  ,FMX.Helpers.Android,
  Androidapi.Helpers
  {$ENDIF};

type
  TFrmChecklistAdd = class(TForm)
    Rectangle1: TRectangle;
    layout_delete: TLayout;
    img_delete: TImage;
    lbl_delete: TLabel;
    layout_limpar: TLayout;
    img_limpar: TImage;
    Label2: TLabel;
    layout_salvar: TLayout;
    img_salvar_tarefa: TImage;
    lbl_salvar: TLabel;
    Layout1: TLayout;
    Label1: TLabel;
    img_voltar: TImage;
    layout_descricao: TLayout;
    lbl_desc_tarefa: TLabel;
    edt_desc_tarefa: TEdit;
    Line1: TLine;
    StyleBook1: TStyleBook;
    layout_checkar: TLayout;
    lbl_checkar: TLabel;
    cb_check_tarefa: TCheckBox;
    layout_data: TLayout;
    lbl_data_tarefa: TLabel;
    Line3: TLine;
    dt_tarefa: TDateEdit;
    procedure img_voltarClick(Sender: TObject);
    procedure cb_check_tarefaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChecklistAdd: TFrmChecklistAdd;

implementation

{$R *.fmx}

uses UnitPrincipal;

procedure TFrmChecklistAdd.cb_check_tarefaClick(Sender: TObject);
begin
        If cb_check_tarefa.IsChecked = False then
        begin
        ShowMessage('Sua tarefa est� checada!');
        end
    else if cb_check_tarefa.IsChecked = True then
        begin
        ShowMessage('Sua tarefa est� em aberto!');
        end;
end;

procedure TFrmChecklistAdd.img_voltarClick(Sender: TObject);
begin
    FrmChecklistAdd.Close;
end;

end.
