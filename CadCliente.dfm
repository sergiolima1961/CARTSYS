object fCadCliente: TfCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Contato'
  ClientHeight = 459
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 641
    Height = 459
    Align = alLeft
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 44
      Width = 637
      Height = 95
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 7
        Width = 39
        Height = 13
        Caption = 'Contato'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 10
        Top = 37
        Width = 28
        Height = 13
        Caption = 'E-mail'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 2
        Top = 68
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 252
        Top = 68
        Width = 33
        Height = 13
        Caption = 'Celular'
        FocusControl = DBEdit4
      end
      object DBEdit1: TDBEdit
        Left = 55
        Top = 6
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Contato'
        DataSource = DS_CLIENTE
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 54
        Top = 33
        Width = 500
        Height = 21
        CharCase = ecLowerCase
        DataField = 'E-mail'
        DataSource = DS_CLIENTE
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 50
        Top = 68
        Width = 178
        Height = 21
        DataField = 'Telefone'
        DataSource = DS_CLIENTE
        TabOrder = 2
        OnKeyPress = DBEdit11KeyPress
      end
      object DBEdit4: TDBEdit
        Left = 320
        Top = 68
        Width = 178
        Height = 21
        DataField = 'Celular'
        DataSource = DS_CLIENTE
        TabOrder = 3
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 637
      Height = 29
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Panel1'
      ShowCaption = False
      TabOrder = 1
      object Label16: TLabel
        Left = 398
        Top = 8
        Width = 52
        Height = 13
        Caption = '0000/0000'
      end
      object Button1: TButton
        Left = 2
        Top = 2
        Width = 56
        Height = 25
        Align = alLeft
        Caption = 'Novo'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 226
        Top = 2
        Width = 56
        Height = 25
        Align = alLeft
        Caption = 'Cancelar'
        Enabled = False
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 170
        Top = 2
        Width = 56
        Height = 25
        Align = alLeft
        Caption = 'Gravar'
        Enabled = False
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 58
        Top = 2
        Width = 56
        Height = 25
        Align = alLeft
        Caption = 'Editar'
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 114
        Top = 2
        Width = 56
        Height = 25
        Align = alLeft
        Caption = 'Excluir'
        TabOrder = 4
        OnClick = Button5Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 267
      Width = 637
      Height = 190
      Align = alClient
      DataSource = DS_CLIENTE
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 139
      Width = 637
      Height = 128
      Align = alTop
      Caption = 'Endere'#231'o'
      TabOrder = 3
      object Label5: TLabel
        Left = 16
        Top = 16
        Width = 19
        Height = 13
        Caption = 'CEP'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 15
        Top = 43
        Width = 19
        Height = 13
        Caption = 'Rua'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 16
        Top = 71
        Width = 29
        Height = 13
        Caption = 'Compl'
        FocusControl = DBEdit7
      end
      object Label8: TLabel
        Left = 516
        Top = 44
        Width = 43
        Height = 13
        Caption = 'NUMERO'
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 302
        Top = 71
        Width = 28
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit9
      end
      object Label10: TLabel
        Left = 16
        Top = 104
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBEdit10
      end
      object Label11: TLabel
        Left = 521
        Top = 104
        Width = 40
        Height = 13
        Caption = 'ESTADO'
        FocusControl = DBEdit11
      end
      object DBEdit5: TDBEdit
        Left = 54
        Top = 14
        Width = 94
        Height = 21
        DataField = 'CEP'
        DataSource = DS_CLIENTE
        TabOrder = 0
        OnKeyPress = DBEdit11KeyPress
      end
      object DBEdit6: TDBEdit
        Left = 54
        Top = 41
        Width = 456
        Height = 21
        CharCase = ecUpperCase
        DataField = 'LOGRADOURO'
        DataSource = DS_CLIENTE
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit7: TDBEdit
        Left = 54
        Top = 69
        Width = 214
        Height = 21
        DataField = 'COMPLEMENTO'
        DataSource = DS_CLIENTE
        TabOrder = 3
      end
      object DBEdit8: TDBEdit
        Left = 572
        Top = 40
        Width = 61
        Height = 21
        DataField = 'NUMERO'
        DataSource = DS_CLIENTE
        TabOrder = 1
      end
      object DBEdit9: TDBEdit
        Left = 348
        Top = 69
        Width = 250
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAIRRO'
        DataSource = DS_CLIENTE
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit10: TDBEdit
        Left = 55
        Top = 101
        Width = 434
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CIDADE'
        DataSource = DS_CLIENTE
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit11: TDBEdit
        Left = 570
        Top = 101
        Width = 30
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ESTADO'
        DataSource = DS_CLIENTE
        ReadOnly = True
        TabOrder = 6
      end
      object Button_Buscar_Cep: TButton
        Left = 179
        Top = 10
        Width = 89
        Height = 25
        Caption = 'Buscar CEP'
        TabOrder = 7
        OnClick = Button_Buscar_CepClick
      end
    end
  end
  object DS_CLIENTE: TDataSource
    AutoEdit = False
    DataSet = DM_DB.FvCliente
    OnDataChange = DS_CLIENTEDataChange
    Left = 576
    Top = 48
  end
  object XMLDocument1: TXMLDocument
    Left = 575
    Top = 97
  end
end
