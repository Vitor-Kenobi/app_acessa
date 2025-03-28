program Acessa;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitLogin in 'UnitLogin.pas' {FrmLogin},
  u99Permissions in 'Units\u99Permissions.pas',
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  UnitDM in 'UnitDM.pas' {dm: TDataModule},
  UnitLancamentos in 'UnitLancamentos.pas' {FrmLancamentos},
  UnitLancamentosAdd in 'UnitLancamentosAdd.pas' {FrmLancamentosAdd},
  UnitCheckList in 'UnitCheckList.pas' {FrmChecklist},
  UnitCheckListAdd in 'UnitCheckListAdd.pas' {FrmChecklistAdd},
  UnitNotificador in 'UnitNotificador.pas' {FrmNotificador},
  UnitDesempenho in 'UnitDesempenho.pas' {FrmDesempenho},
  Lancamentos in 'Classes\Lancamentos.pas',
  UnitPerfil in 'UnitPerfil.pas' {FrmPerfil},
  UnitPerfilEditar in 'UnitPerfilEditar.pas' {FrmPerfilEditar};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmChecklist, FrmChecklist);
  Application.CreateForm(TFrmChecklistAdd, FrmChecklistAdd);
  Application.CreateForm(TFrmNotificador, FrmNotificador);
  Application.CreateForm(TFrmDesempenho, FrmDesempenho);
  Application.CreateForm(TFrmPerfil, FrmPerfil);
  Application.CreateForm(TFrmPerfilEditar, FrmPerfilEditar);
  Application.Run;
end.
