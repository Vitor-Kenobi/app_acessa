object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 448
  Width = 421
  object conn: TFDConnection
    Params.Strings = (
      
        'Database=D:\Vitor - Particular\Vitor\Pessoal\Docs Curso\TCC\Proj' +
        'eto TCC App\BD\acessa_bd.db'
      'OpenMode=ReadWrite'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 96
    Top = 96
  end
end
