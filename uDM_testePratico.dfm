object DM_DB: TDM_DB
  OldCreateOrder = False
  Height = 355
  Width = 520
  object FD_SQLlocal: TFDConnection
    Params.Strings = (
      'Database=CartSys'
      'User_Name=LAPTOPSLIMA\slima'
      'Server=LAPTOPSLIMA'
      'OSAuthent=Yes'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 48
  end
  object FvCliente: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO            CHAR(1)      = :ACAO,'
      '        @ID_ENTIDADE     INT          = :ID,'
      '        @NOME            VARCHAR(90)  = :NOM,'
      '        @EMAIL           VARCHAR(100) = :EMA,'
      '        @TELEFONE        VARCHAR(16)  = :TEL ,'
      '        @CELULAR         VARCHAR(16)  = :CEL,'
      '        @TIPO_ENTIDADE   INT          = :TIP,'
      '        @ID_USUARIO      INT          = :USE,'
      '        @STATUS          BIT          = :STA,'
      '        @ID_ENDERECO     INT          = :IDEND,'
      '        @CEP             VARCHAR(8)   = :CEP,'
      '        @LOGRADOURO      VARCHAR(50)  = :LOG,'
      '        @NUMERO          VARCHAR(10)  = :NUM,'
      '        @COMPLEMENTO     VARCHAR(20)  = :COM,'
      '        @BAIRRO          VARCHAR(30)  = :BAI,'
      '        @CIDADE          VARCHAR(40)  = :CID,'
      '        @ESTADO          VARCHAR(2)   = :EST,'
      '        @ID_RETORN       INT          = :IDR'
      ''
      'EXECUTE [DBO].[SP_IAEC_ENTIDADE]'
      '  @ACAO,'
      '  @ID_ENTIDADE,'
      '  @NOME,'
      '  @EMAIL,'
      '  @TELEFONE,'
      '  @CELULAR,'
      '  @TIPO_ENTIDADE,'
      '  @ID_USUARIO,'
      '  @STATUS,'
      '  @ID_ENDERECO,'
      '  @CEP,'
      '  @LOGRADOURO,'
      '  @NUMERO,'
      '  @COMPLEMENTO,'
      '  @BAIRRO,'
      '  @CIDADE,'
      '  @ESTADO,'
      '  @ID_RETORN'
      '')
    Left = 208
    Top = 88
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TEL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TIP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'USE'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'STA'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDEND'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BAI'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EST'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDR'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FvClienteID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object FvClienteContato: TStringField
      FieldName = 'Contato'
      Origin = 'Contato'
      Size = 90
    end
    object FvClienteEmail: TStringField
      FieldName = 'E-mail'
      Origin = '[E-mail]'
      Size = 100
    end
    object FvClienteTelefone: TStringField
      FieldName = 'Telefone'
      Origin = 'Telefone'
      Size = 16
    end
    object FvClienteCelular: TStringField
      FieldName = 'Celular'
      Origin = 'Celular'
      Size = 16
    end
    object FvClienteTipo: TIntegerField
      FieldName = 'Tipo'
      Origin = 'Tipo'
    end
    object FvClienteUse: TIntegerField
      FieldName = 'Use'
      Origin = '[Use]'
    end
    object FvClienteSta: TStringField
      FieldName = 'Sta'
      Origin = 'Sta'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object FvClienteSTATUS: TBooleanField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object FvClienteID_ENDERECO: TIntegerField
      FieldName = 'ID_ENDERECO'
      Origin = 'ID_ENDERECO'
    end
    object FvClienteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      EditMask = '00000\-000;0;_'
      Size = 8
    end
    object FvClienteLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 50
    end
    object FvClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object FvClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object FvClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object FvClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object FvClienteESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
  end
  object FvUsuario: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO       CHAR(1)     = :ACA,'
      '        @ID_USUARIO INT         = :COD,'
      '        @NOME       VARCHAR(90) = :NOM,'
      '        @LOGIN      VARCHAR(30) = :LOG ,'
      '        @SENHA      VARCHAR(16) = :SEN ,'
      '        @ATIVO      BIT         = 1,'
      '        @ID_RETORN  INT         '
      ''
      '-- TODO: Defina valores de par'#226'metros aqui.'
      'EXECUTE [DBO].[SP_IAEC_USUARIO]'
      '  @ACAO,'
      '  @ID_USUARIO,'
      '  @NOME,'
      '  @LOGIN,'
      '  @SENHA,'
      '  @ATIVO,'
      '  @ID_RETORN ')
    Left = 136
    Top = 72
    ParamData = <
      item
        Name = 'ACA'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'NOM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SEN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FvUsuarioID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
      Visible = False
    end
    object FvUsuarioUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'Usuario'
      Required = True
      Size = 40
    end
    object FvUsuarioLogin: TStringField
      FieldName = 'Login'
      Origin = 'Login'
      Required = True
    end
    object FvUsuarioSenha: TStringField
      FieldName = 'Senha'
      Origin = 'Senha'
      Required = True
    end
    object FvUsuarioSituacao: TStringField
      FieldName = 'Situacao'
      Origin = 'Situacao'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object FvUsuarioSTATUS: TBooleanField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Visible = False
    end
  end
  object FtCliente: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO            CHAR(1)      = :ACAO,'
      '        @ID_ENTIDADE     INT          = :ID,'
      '        @NOME            VARCHAR(90)  = :NOM,'
      '        @EMAIL           VARCHAR(100) = :EMA,'
      '        @TELEFONE        VARCHAR(16)  = :TEL ,'
      '        @CELULAR         VARCHAR(16)  = :CEL,'
      '        @TIPO_ENTIDADE   INT          = :TIP,'
      '        @ID_USUARIO      INT          = :USE,'
      '        @STATUS          BIT          = :STA,'
      '        @ID_ENDERECO     INT          = :IDEND,'
      '        @CEP             VARCHAR(8)   = :CEP,'
      '        @LOGRADOURO      VARCHAR(50)  = :LOG,'
      '        @NUMERO          VARCHAR(10)  = :NUM,'
      '        @COMPLEMENTO     VARCHAR(20)  = :COM,'
      '        @BAIRRO          VARCHAR(30)  = :BAI,'
      '        @CIDADE          VARCHAR(40)  = :CID,'
      '        @ESTADO          VARCHAR(2)   = :EST,'
      '        @ID_RETORN       INT          = :IDR'
      ''
      'EXECUTE [DBO].[SP_IAEC_ENTIDADE]'
      '  @ACAO,'
      '  @ID_ENTIDADE,'
      '  @NOME,'
      '  @EMAIL,'
      '  @TELEFONE,'
      '  @CELULAR,'
      '  @TIPO_ENTIDADE,'
      '  @ID_USUARIO,'
      '  @STATUS,'
      '  @ID_ENDERECO,'
      '  @CEP,'
      '  @LOGRADOURO,'
      '  @NUMERO,'
      '  @COMPLEMENTO,'
      '  @BAIRRO,'
      '  @CIDADE,'
      '  @ESTADO,'
      '  @ID_RETORN'
      '')
    Left = 208
    Top = 32
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TEL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TIP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'USE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'STA'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDEND'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BAI'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EST'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDR'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FtClienteID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object FtClienteContato: TStringField
      FieldName = 'Contato'
      Origin = 'Contato'
      Size = 90
    end
    object FtClienteTelefone: TStringField
      FieldName = 'Telefone'
      Origin = 'Telefone'
      Size = 16
    end
    object FtClienteCelular: TStringField
      FieldName = 'Celular'
      Origin = 'Celular'
      Size = 16
    end
    object FtClienteEmail: TStringField
      FieldName = 'E-mail'
      Origin = '[E-mail]'
      Size = 100
    end
    object FtClienteTipo: TIntegerField
      FieldName = 'Tipo'
      Origin = 'Tipo'
    end
    object FtClienteUse: TIntegerField
      FieldName = 'Use'
      Origin = '[Use]'
    end
    object FtClienteSta: TStringField
      FieldName = 'Sta'
      Origin = 'Sta'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object FtClienteSTATUS: TBooleanField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object FtClienteID_ENDERECO: TIntegerField
      FieldName = 'ID_ENDERECO'
      Origin = 'ID_ENDERECO'
    end
    object FtClienteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object FtClienteLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 50
    end
    object FtClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object FtClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object FtClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object FtClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object FtClienteESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
  end
  object FtUsuario: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO       CHAR(1)     = :ACA,'
      '        @ID_USUARIO INT         = :COD,'
      '        @NOME       VARCHAR(90) = :NOM,'
      '        @LOGIN      VARCHAR(30) = :LOG ,'
      '        @SENHA      VARCHAR(16) = :SEN ,'
      '        @ATIVO      BIT         = :ATV,'
      '        @ID_RETORN  INT         '
      ''
      '-- TODO: Defina valores de par'#226'metros aqui.'
      'EXECUTE [DBO].[SP_IAEC_USUARIO]'
      '  @ACAO,'
      '  @ID_USUARIO,'
      '  @NOME,'
      '  @LOGIN,'
      '  @SENHA,'
      '  @ATIVO,'
      '  @ID_RETORN ')
    Left = 136
    Top = 24
    ParamData = <
      item
        Name = 'ACA'
        DataType = ftString
        ParamType = ptInput
        Value = 'c'
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'NOM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SEN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ATV'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end>
    object FtUsuarioID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object FtUsuarioUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'Usuario'
      Required = True
      Size = 50
    end
    object FtUsuarioLogin: TStringField
      FieldName = 'Login'
      Origin = 'Login'
      Required = True
    end
    object FtUsuarioSenha: TStringField
      FieldName = 'Senha'
      Origin = 'Senha'
      Required = True
      Size = 30
    end
    object FtUsuarioSituacao: TBooleanField
      FieldName = 'Situacao'
      Origin = 'Situacao'
    end
  end
  object FvEndereco: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      ''
      'DECLARE @ACAO            CHAR(1) = :AC,'
      '        @ID_ENDERECO     INT = :ID,'
      '        @CEP             VARCHAR(8) = :CEP,'
      '        @LOGRADOURO      VARCHAR(50) = :LOG,'
      '        @NUMERO          VARCHAR(10) = :NUM ,'
      '        @COMPLEMENTO     VARCHAR(20) = :COM,'
      '        @BAIRRO          VARCHAR(30) = :BAI,'
      '        @CIDADE          VARCHAR(40) = :CID,'
      '        @ESTADO          VARCHAR(2)  = :UF,'
      '        @ID_RETORN       INT = 0'
      ''
      'EXECUTE [DBO].[SP_IAEC_ENDERECO]'
      '  @ACAO,'
      '  @ID_ENDERECO,'
      '  @CEP,'
      '  @LOGRADOURO,'
      '  @NUMERO,'
      '  @COMPLEMENTO,'
      '  @BAIRRO,'
      '  @CIDADE,'
      '  @ESTADO,'
      '        @ID_RETORN')
    Left = 424
    Top = 232
    ParamData = <
      item
        Name = 'AC'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BAI'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'UF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField5: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object StringField4: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      EditMask = '00000\-000;0;_'
      Size = 8
    end
    object StringField5: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object StringField7: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object StringField8: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object StringField9: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object StringField10: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
  end
  object fvCEPS: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO            CHAR(1) = :AC,'
      '        @ID_CEPS         INT = :ID,'
      '        @CEP             VARCHAR(8) = :CEP,'
      '        @LOGRADOURO      VARCHAR(50) = :LOG,'
      '        @COMPLEMENTO     VARCHAR(20) = :COM,'
      '        @BAIRRO          VARCHAR(30) = :BAI,'
      '        @CIDADE          VARCHAR(40) = :CID,'
      '        @ESTADO          VARCHAR(2)  = :EST'
      ''
      'EXECUTE SP_IAEC_CEPS'
      '  @ACAO,'
      '  @ID_CEPS,'
      '  @CEP,'
      '  @LOGRADOURO,'
      '  @COMPLEMENTO,'
      '  @BAIRRO,'
      '  @CIDADE,'
      '  @ESTADO ')
    Left = 424
    Top = 280
    ParamData = <
      item
        Name = 'AC'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Value = '04141020'
      end
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BAI'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EST'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField7: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object StringField20: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object StringField21: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 50
    end
    object StringField23: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object StringField24: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object StringField25: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object StringField26: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
  end
  object fvAtividade: TFDQuery
    AfterScroll = fvAtividadeAfterScroll
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO           CHAR(1)       = :ACAO,'
      '        @ID_ATIVIDADE   INT           = :IDA ,'
      '        @ID_PROSPECTO   INT           = :IDP,'
      '        @DAT_ATIVIDADE  DATETIME      = :DAT,'
      '        @TIP_ATIVIDADE  SMALLINT      = :ATI,'
      '        @DSC_COMENTARIO VARCHAR(1000) = :COM,'
      '        @STA_ATIVIDADE  BIT           = :STA'
      ''
      'EXECUTE [DBO].[SP_IAEC_ATIVIDADE]'
      '  @ACAO,'
      '  @ID_ATIVIDADE,'
      '  @ID_PROSPECTO,'
      '  @DAT_ATIVIDADE,'
      '  @TIP_ATIVIDADE,'
      '  @DSC_COMENTARIO,'
      '  @STA_ATIVIDADE'
      '')
    Left = 352
    Top = 96
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'IDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'IDP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DAT'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ATI'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COM'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'STA'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end>
    object fvAtividadeIDA: TFDAutoIncField
      FieldName = 'IDA'
      Origin = 'IDA'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object fvAtividadeData: TSQLTimeStampField
      DisplayWidth = 10
      FieldName = 'Data'
      Origin = 'Data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
      EditMask = '!99/99/9900;1;_'
    end
    object fvAtividadeTIP_ATIVIDADE: TIntegerField
      FieldName = 'TIP_ATIVIDADE'
      Origin = 'TIP_ATIVIDADE'
      Required = True
      Visible = False
    end
    object fvAtividadeAtividade: TStringField
      FieldName = 'Atividade'
      Origin = 'Atividade'
      Required = True
      Size = 38
    end
    object fvAtividadeComentário: TStringField
      DisplayWidth = 80
      FieldName = 'Coment'#225'rio'
      Origin = '[Coment'#225'rio]'
      Required = True
      Size = 1000
    end
    object fvAtividadeSTA_ATIVIDADE: TBooleanField
      FieldName = 'STA_ATIVIDADE'
      Origin = 'STA_ATIVIDADE'
      Required = True
      Visible = False
    end
    object fvAtividadeID_PROSPECTO: TIntegerField
      FieldName = 'ID_PROSPECTO'
      Origin = 'ID_PROSPECTO'
      Required = True
      Visible = False
    end
  end
  object FvProspecto: TFDQuery
    AfterOpen = FvProspectoAfterOpen
    AfterScroll = FvProspectoAfterScroll
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO          CHAR(1)= :ACAO,'
      '        @ID_PROSPECTO  INT    = :IDP,'
      '        @ID_ENTIDADE   INT    = :IDE ,  '
      '        @DAT_PROSPECTO DATETIME = :DATA,'
      '        @ID_USUARIO    INT      = :IDU,'
      '        @TIP_PROSPECTO SMALLINT = :TIP,'
      '        @STA_PROSPECTO BIT      = :STA,'
      '        @DSC_CONTATO VARCHAR(200) = :BUS,'
      '        @RET_BUSCA INT = :RET'
      ''
      '-- TODO: Defina valores de par'#226'metros aqui.'
      'EXECUTE [DBO].[SP_IAEC_PROSPECTO]'
      '  @ACAO,'
      '  @ID_PROSPECTO,'
      '  @ID_ENTIDADE,'
      '  @DAT_PROSPECTO,'
      '  @ID_USUARIO,'
      '  @TIP_PROSPECTO,'
      '  @STA_PROSPECTO,'
      '  @DSC_CONTATO  ,'
      '  @RET_BUSCA  ')
    Left = 448
    Top = 40
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'IDP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDU'
        DataType = ftInteger
        ParamType = ptInput
        Size = 1
        Value = Null
      end
      item
        Name = 'TIP'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'STA'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BUS'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RET'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
    object FvProspectoID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
      Visible = False
    end
    object FvProspectoID_ENTIDADE: TIntegerField
      FieldName = 'ID_ENTIDADE'
      Origin = 'ID_ENTIDADE'
      Required = True
      Visible = False
    end
    object FvProspectoData: TSQLTimeStampField
      DisplayWidth = 18
      FieldName = 'Data'
      Origin = 'Data'
    end
    object FvProspectoContato: TStringField
      FieldName = 'Contato'
      Origin = 'Contato'
      Size = 90
    end
    object FvProspectoID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
      Visible = False
    end
    object FvProspectoTIP_PROSPECTO: TSmallintField
      FieldName = 'TIP_PROSPECTO'
      Origin = 'TIP_PROSPECTO'
      Visible = False
    end
    object FvProspectoSTA_PROSPECTO: TBooleanField
      FieldName = 'STA_PROSPECTO'
      Origin = 'STA_PROSPECTO'
      Visible = False
    end
    object FvProspectoAtividades: TStringField
      FieldName = 'Atividades'
      Origin = 'Atividades'
      ReadOnly = True
      Visible = False
      Size = 26
    end
    object FvProspectoSituacao: TStringField
      FieldName = 'Situacao'
      Origin = 'Situacao'
      ReadOnly = True
      Required = True
      Size = 10
    end
  end
  object ftProspecto: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO          CHAR(1)= :ACAO,'
      '        @ID_PROSPECTO  INT    = :IDP,'
      '        @ID_ENTIDADE   INT    = :IDE ,  '
      '        @DAT_PROSPECTO DATETIME = :DATA,'
      '        @ID_USUARIO    INT      = :IDU,'
      '        @TIP_PROSPECTO SMALLINT = :TIP,'
      '        @STA_PROSPECTO BIT      = :STA,'
      '        @DSC_CONTATO VARCHAR(200) = :BUS,'
      '        @RET_BUSCA INT = :RET'
      ''
      '-- TODO: Defina valores de par'#226'metros aqui.'
      'EXECUTE [DBO].[SP_IAEC_PROSPECTO]'
      '  @ACAO,'
      '  @ID_PROSPECTO,'
      '  @ID_ENTIDADE,'
      '  @DAT_PROSPECTO,'
      '  @ID_USUARIO,'
      '  @TIP_PROSPECTO,'
      '  @STA_PROSPECTO,'
      '  @DSC_CONTATO  ,'
      '  @RET_BUSCA  ')
    Left = 464
    Top = 96
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'IDP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDU'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TIP'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'STA'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BUS'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RET'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_ENTIDADE'
      Origin = 'ID_ENTIDADE'
      Required = True
      Visible = False
    end
    object SQLTimeStampField1: TSQLTimeStampField
      DisplayWidth = 14
      FieldName = 'Data'
      Origin = 'Data'
    end
    object StringField1: TStringField
      FieldName = 'Contato'
      Origin = 'Contato'
      Size = 90
    end
    object IntegerField3: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
      Visible = False
    end
    object SmallintField1: TSmallintField
      FieldName = 'TIP_PROSPECTO'
      Origin = 'TIP_PROSPECTO'
      Visible = False
    end
    object BooleanField1: TBooleanField
      FieldName = 'STA_PROSPECTO'
      Origin = 'STA_PROSPECTO'
      Visible = False
    end
    object StringField2: TStringField
      FieldName = 'Atividades'
      Origin = 'Atividades'
      ReadOnly = True
      Visible = False
      Size = 26
    end
    object StringField11: TStringField
      FieldName = 'Situacao'
      Origin = 'Situacao'
      ReadOnly = True
      Required = True
      Size = 10
    end
  end
  object FtAtividade: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO           CHAR(1)       = :ACAO,'
      '        @ID_ATIVIDADE   INT           = :IDA ,'
      '        @ID_PROSPECTO   INT           = :IDP,'
      '        @DAT_ATIVIDADE  DATETIME      = :DAT,'
      '        @TIP_ATIVIDADE  SMALLINT      = :ATI,'
      '        @DSC_COMENTARIO VARCHAR(1000) = :COM,'
      '        @STA_ATIVIDADE  BIT           = :STA'
      ''
      'EXECUTE [DBO].[SP_IAEC_ATIVIDADE]'
      '  @ACAO,'
      '  @ID_ATIVIDADE,'
      '  @ID_PROSPECTO,'
      '  @DAT_ATIVIDADE,'
      '  @TIP_ATIVIDADE,'
      '  @DSC_COMENTARIO,'
      '  @STA_ATIVIDADE'
      '')
    Left = 344
    Top = 40
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'IDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'IDP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DAT'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ATI'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COM'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'STA'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField3: TFDAutoIncField
      FieldName = 'IDA'
      Origin = 'IDA'
      ReadOnly = True
    end
    object FtAtividadeData: TStringField
      FieldName = 'Data'
      Origin = 'Data'
      ReadOnly = True
      Size = 18
    end
    object FtAtividadeTIP_ATIVIDADE: TIntegerField
      FieldName = 'TIP_ATIVIDADE'
      Origin = 'TIP_ATIVIDADE'
      Required = True
    end
    object FtAtividadeAtividades: TStringField
      FieldName = 'Atividades'
      Origin = 'Atividades'
      ReadOnly = True
      Size = 38
    end
    object FtAtividadeComentário: TStringField
      FieldName = 'Coment'#225'rio'
      Origin = '[Coment'#225'rio]'
      Size = 1000
    end
    object FtAtividadeSTA_ATIVIDADE: TBooleanField
      FieldName = 'STA_ATIVIDADE'
      Origin = 'STA_ATIVIDADE'
    end
    object FtAtividadeID_PROSPECTO: TIntegerField
      FieldName = 'ID_PROSPECTO'
      Origin = 'ID_PROSPECTO'
      Required = True
    end
  end
  object FfProspecto: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO          CHAR(1)= :ACAO,'
      '        @ID_PROSPECTO  INT    = :IDP,'
      '        @ID_ENTIDADE   INT    = :IDE ,  '
      '        @DAT_PROSPECTO DATETIME = :DATA,'
      '        @ID_USUARIO    INT      = :IDU,'
      '        @TIP_PROSPECTO SMALLINT = :TIP,'
      '        @STA_PROSPECTO BIT      = :STA,'
      '        @DSC_CONTATO VARCHAR(200) = :BUS,'
      '        @RET_BUSCA INT = :RET'
      ''
      '-- TODO: Defina valores de par'#226'metros aqui.'
      'EXECUTE [DBO].[SP_IAEC_PROSPECTO]'
      '  @ACAO,'
      '  @ID_PROSPECTO,'
      '  @ID_ENTIDADE,'
      '  @DAT_PROSPECTO,'
      '  @ID_USUARIO,'
      '  @TIP_PROSPECTO,'
      '  @STA_PROSPECTO,'
      '  @DSC_CONTATO  ,'
      '  @RET_BUSCA  ')
    Left = 464
    Top = 152
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'B'
      end
      item
        Name = 'IDP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDU'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'TIP'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'STA'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BUS'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'RET'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 1
      end>
    object FfProspectoID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
      Visible = False
    end
    object FfProspectoID_ENTIDADE: TIntegerField
      FieldName = 'ID_ENTIDADE'
      Origin = 'ID_ENTIDADE'
      Required = True
      Visible = False
    end
    object FfProspectoData: TSQLTimeStampField
      DisplayWidth = 10
      FieldName = 'Data'
      Origin = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object FfProspectoContato: TStringField
      FieldName = 'Contato'
      Origin = 'Contato'
      Size = 40
    end
    object FfProspectoAtividades: TStringField
      FieldName = 'Atividades'
      Origin = 'Atividades'
      ReadOnly = True
      Size = 26
    end
    object FfProspectoSituacao: TStringField
      FieldName = 'Situacao'
      Origin = 'Situacao'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object FfProspectoID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
      Visible = False
    end
    object FfProspectoTIP_PROSPECTO: TSmallintField
      FieldName = 'TIP_PROSPECTO'
      Origin = 'TIP_PROSPECTO'
      Visible = False
    end
    object FfProspectoSTA_PROSPECTO: TBooleanField
      FieldName = 'STA_PROSPECTO'
      Origin = 'STA_PROSPECTO'
      Visible = False
    end
  end
  object FvDscAtividades: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'SELECT '
      '1 ID , '#39'Telefonema'#39' DSC'
      '  UNION'
      'SELECT '
      ' 2,'#39'E-mail'#39
      '  UNION'
      'SELECT '
      '  3,'#39'visita ao poss'#237'vel cliente'#39
      '  UNION'
      'SELECT '
      '   4,'#39'visita do poss'#237'vel cliente '#224' empresa'#39)
    Left = 352
    Top = 152
    object FvDscAtividadesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
      Required = True
    end
    object FvDscAtividadesDSC: TStringField
      FieldName = 'DSC'
      Origin = 'DSC'
      ReadOnly = True
      Required = True
      Size = 38
    end
  end
  object FvAgenda: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @IDU INT = :IDU'
      ''
      
        'SELECT CONVERT(VARCHAR(03), FORMAT(Datediff(DD, Getdate(), ATV.D' +
        'AT_ATIVIDADE), '#39'0##'#39'))                                          ' +
        '      [Falta]'
      
        '       ,CONVERT(VARCHAR(14), FORMAT(ATV.DAT_ATIVIDADE, '#39'dd MMM y' +
        'yyy'#39'))                                                          ' +
        '      [Data]'
      
        '       ,CHOOSE (ATV.[TIP_ATIVIDADE], '#39'Telefonema'#39', '#39'E-mail'#39', '#39'vi' +
        'sita ao poss'#237'vel cliente'#39', '#39'visita do poss'#237'vel cliente '#224' empresa' +
        #39') [Atividade]'
      
        '       ,CONVERT(VARCHAR(60), ETI.NOME)                          ' +
        '                                                                ' +
        '      [Contato/Cliente]'
      'FROM   PROSPECTO PRO'
      '       INNER JOIN ATIVIDADE ATV'
      '               ON PRO.ID_PROSPECTO = ATV.ID_PROSPECTO'
      '       INNER JOIN ENTIDADE ETI'
      '               ON PRO.ID_ENTIDADE = ETI.ID_ENTIDADE'
      'WHERE  PRO.ID_USUARIO = @IDU'
      
        '       AND CONVERT(DATE, ATV.DAT_ATIVIDADE) >= CONVERT(DATE, Get' +
        'date())'
      'ORDER  BY ATV.DAT_ATIVIDADE '
      '          ,ETI.NOME ')
    Left = 272
    Top = 168
    ParamData = <
      item
        Name = 'IDU'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object FvAgendaFalta: TStringField
      FieldName = 'Falta'
      Origin = 'Falta'
      ReadOnly = True
      Size = 3
    end
    object FvAgendaData: TStringField
      FieldName = 'Data'
      Origin = 'Data'
      ReadOnly = True
      Size = 14
    end
    object FvAgendaAtividade: TStringField
      FieldName = 'Atividade'
      Origin = 'Atividade'
      ReadOnly = True
      Size = 36
    end
    object FvAgendaContatoCliente: TStringField
      FieldName = 'Contato/Cliente'
      Origin = '[Contato/Cliente]'
      ReadOnly = True
      Size = 60
    end
  end
  object FvLogin: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO       CHAR(1)     = :ACA,'
      '        @ID_USUARIO INT         = :COD,'
      '        @NOME       VARCHAR(90) = :NOM,'
      '        @LOGIN      VARCHAR(30) = :LOG ,'
      '        @SENHA      VARCHAR(16) = :SEN ,'
      '        @ATIVO      BIT         = 1,'
      '        @ID_RETORN  INT         '
      ''
      '-- TODO: Defina valores de par'#226'metros aqui.'
      'EXECUTE [DBO].[SP_IAEC_USUARIO]'
      '  @ACAO,'
      '  @ID_USUARIO,'
      '  @NOME,'
      '  @LOGIN,'
      '  @SENHA,'
      '  @ATIVO,'
      '  @ID_RETORN ')
    Left = 128
    Top = 128
    ParamData = <
      item
        Name = 'ACA'
        DataType = ftString
        ParamType = ptInput
        Value = 'S'
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'NOM'
        DataType = ftString
        ParamType = ptInput
        Value = 'llima'
      end
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = 'llima'
      end
      item
        Name = 'SEN'
        DataType = ftString
        ParamType = ptInput
        Value = '1234'
      end>
    object FvLoginID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object FvLoginUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'Usuario'
      Required = True
      Size = 50
    end
    object FvLoginSituacao: TStringField
      FieldName = 'Situacao'
      Origin = 'Situacao'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object FvLoginSTATUS: TBooleanField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
  end
  object FGProspecto: TFDQuery
    Active = True
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO          CHAR(1)= :ACAO,'
      '        @ID_PROSPECTO  INT    = :IDP,'
      '        @ID_ENTIDADE   INT    = :IDE ,  '
      '        @DAT_PROSPECTO DATETIME = :DATA,'
      '        @ID_USUARIO    INT      = :IDU,'
      '        @TIP_PROSPECTO SMALLINT = :TIP,'
      '        @STA_PROSPECTO BIT      = :STA,'
      '        @DSC_CONTATO VARCHAR(200) = :BUS,'
      '        @RET_BUSCA INT = :RET'
      ''
      '-- TODO: Defina valores de par'#226'metros aqui.'
      'EXECUTE [DBO].[SP_IAEC_PROSPECTO]'
      '  @ACAO,'
      '  @ID_PROSPECTO,'
      '  @ID_ENTIDADE,'
      '  @DAT_PROSPECTO,'
      '  @ID_USUARIO,'
      '  @TIP_PROSPECTO,'
      '  @STA_PROSPECTO,'
      '  @DSC_CONTATO  ,'
      '  @RET_BUSCA  ')
    Left = 88
    Top = 224
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'g'
      end
      item
        Name = 'IDP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDU'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'TIP'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'STA'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BUS'
        DataType = ftString
        ParamType = ptInput
        Value = 'IAN E SUELI LIMPEZA ME'
      end
      item
        Name = 'RET'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 1
      end>
    object FGProspectoFrequencia: TIntegerField
      FieldName = 'Frequencia'
      Origin = 'Frequencia'
      ReadOnly = True
    end
    object FGProspectoLocalidade: TStringField
      FieldName = 'Localidade'
      Origin = 'Localidade'
      Size = 2
    end
  end
end
