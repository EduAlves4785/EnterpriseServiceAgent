object DBConnection: TDBConnection
  Height = 240
  Width = 405
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=esadb'
      'User_Name=postgres'
      'Password=postgres'
      'DriverID=PG')
    Left = 144
    Top = 40
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 272
    Top = 128
  end
end
