object DM: TDM
  OldCreateOrder = False
  Height = 390
  Width = 537
  object XMLData: TXMLDocument
    Options = [doNodeAutoIndent, doAttrNull, doAutoPrefix, doNamespaceDecl]
    Left = 104
    Top = 248
    DOMVendorDesc = 'ADOM XML v4'
  end
  object FDDatabese: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'DateTimeFormat=String'
      'Encrypt=No')
    ResourceOptions.AssignedValues = [rvAutoConnect]
    ResourceOptions.AutoConnect = False
    TxOptions.AutoStop = False
    ConnectedStoredUsage = [auRunTime]
    LoginPrompt = False
    Transaction = FDTransaction1
    Left = 24
    Top = 14
  end
  object FDTransaction1: TFDTransaction
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = FDDatabese
    Left = 128
    Top = 14
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 240
    Top = 14
  end
  object FDScript1: TFDScript
    SQLScripts = <>
    Connection = FDDatabese
    Transaction = FDTransaction1
    Params = <>
    Macros = <>
    Left = 24
    Top = 254
  end
  object FDQuery1: TFDQuery
    ActiveStoredUsage = [auRunTime]
    ConstraintsEnabled = True
    Connection = FDDatabese
    Left = 24
    Top = 110
  end
  object FDQuery2: TFDQuery
    ActiveStoredUsage = [auRunTime]
    ConstraintsEnabled = True
    Connection = FDDatabese
    Left = 96
    Top = 110
  end
  object FDQuery3: TFDQuery
    ActiveStoredUsage = [auRunTime]
    ConstraintsEnabled = True
    Connection = FDDatabese
    Left = 168
    Top = 110
  end
  object FDStat: TFDQuery
    ActiveStoredUsage = [auRunTime]
    ConstraintsEnabled = True
    Connection = FDDatabese
    SQL.Strings = (
      'SELECT * from pack_stats WHERE np=:np;')
    Left = 248
    Top = 110
    ParamData = <
      item
        Name = 'NP'
        ParamType = ptInput
      end>
  end
  object FDMemTable1: TFDMemTable
    ActiveStoredUsage = [auRunTime]
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 24
    Top = 182
  end
  object FDMemTable2: TFDMemTable
    ActiveStoredUsage = [auRunTime]
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvCheckRequired]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 104
    Top = 182
  end
end
