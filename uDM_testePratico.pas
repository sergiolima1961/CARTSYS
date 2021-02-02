unit uDM_testePratico;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef;

type
  TDM_DB = class(TDataModule)
    FD_SQLlocal: TFDConnection;
    FvCliente: TFDQuery;
    FvUsuario: TFDQuery;
    FtCliente: TFDQuery;
    FtUsuario: TFDQuery;
    FvEndereco: TFDQuery;
    FDAutoIncField5: TFDAutoIncField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    fvCEPS: TFDQuery;
    FDAutoIncField7: TFDAutoIncField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    FtClienteID: TFDAutoIncField;
    FtClienteEmail: TStringField;
    FtClienteTelefone: TStringField;
    FtClienteCelular: TStringField;
    FtClienteTipo: TIntegerField;
    FtClienteUse: TIntegerField;
    FtClienteSta: TStringField;
    FtClienteSTATUS: TBooleanField;
    FtClienteID_ENDERECO: TIntegerField;
    FtClienteCEP: TStringField;
    FtClienteLOGRADOURO: TStringField;
    FtClienteNUMERO: TStringField;
    FtClienteCOMPLEMENTO: TStringField;
    FtClienteBAIRRO: TStringField;
    FtClienteCIDADE: TStringField;
    FtClienteESTADO: TStringField;
    FtClienteContato: TStringField;
    FvClienteID: TFDAutoIncField;
    FvClienteContato: TStringField;
    FvClienteEmail: TStringField;
    FvClienteTelefone: TStringField;
    FvClienteCelular: TStringField;
    FvClienteTipo: TIntegerField;
    FvClienteUse: TIntegerField;
    FvClienteSta: TStringField;
    FvClienteSTATUS: TBooleanField;
    FvClienteID_ENDERECO: TIntegerField;
    FvClienteCEP: TStringField;
    FvClienteLOGRADOURO: TStringField;
    FvClienteNUMERO: TStringField;
    FvClienteCOMPLEMENTO: TStringField;
    FvClienteBAIRRO: TStringField;
    FvClienteCIDADE: TStringField;
    FvClienteESTADO: TStringField;
    FtUsuarioID: TFDAutoIncField;
    FtUsuarioUsuario: TStringField;
    FtUsuarioLogin: TStringField;
    FtUsuarioSenha: TStringField;
    FtUsuarioSituacao: TBooleanField;
    FvUsuarioID: TFDAutoIncField;
    FvUsuarioUsuario: TStringField;
    FvUsuarioLogin: TStringField;
    FvUsuarioSenha: TStringField;
    FvUsuarioSituacao: TStringField;
    FvUsuarioSTATUS: TBooleanField;
    fvAtividade: TFDQuery;
    fvAtividadeIDA: TFDAutoIncField;
    FvProspecto: TFDQuery;
    FvProspectoID: TFDAutoIncField;
    FvProspectoID_ENTIDADE: TIntegerField;
    FvProspectoContato: TStringField;
    FvProspectoData: TSQLTimeStampField;
    FvProspectoID_USUARIO: TIntegerField;
    FvProspectoTIP_PROSPECTO: TSmallintField;
    FvProspectoSTA_PROSPECTO: TBooleanField;
    FvProspectoAtividades: TStringField;
    FvProspectoSituacao: TStringField;
    ftProspecto: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    IntegerField2: TIntegerField;
    SQLTimeStampField1: TSQLTimeStampField;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    SmallintField1: TSmallintField;
    BooleanField1: TBooleanField;
    StringField2: TStringField;
    StringField11: TStringField;
    FtAtividade: TFDQuery;
    FDAutoIncField3: TFDAutoIncField;
    FfProspecto: TFDQuery;
    FfProspectoID: TFDAutoIncField;
    FfProspectoID_ENTIDADE: TIntegerField;
    FfProspectoContato: TStringField;
    FfProspectoData: TSQLTimeStampField;
    FfProspectoAtividades: TStringField;
    FfProspectoSituacao: TStringField;
    fvAtividadeData: TSQLTimeStampField;
    fvAtividadeTIP_ATIVIDADE: TIntegerField;
    fvAtividadeAtividade: TStringField;
    fvAtividadeComentário: TStringField;
    fvAtividadeSTA_ATIVIDADE: TBooleanField;
    fvAtividadeID_PROSPECTO: TIntegerField;
    FtAtividadeData: TStringField;
    FtAtividadeTIP_ATIVIDADE: TIntegerField;
    FtAtividadeAtividades: TStringField;
    FtAtividadeComentário: TStringField;
    FtAtividadeSTA_ATIVIDADE: TBooleanField;
    FtAtividadeID_PROSPECTO: TIntegerField;
    FvDscAtividades: TFDQuery;
    FvDscAtividadesID: TIntegerField;
    FvDscAtividadesDSC: TStringField;
    FvAgenda: TFDQuery;
    FvLogin: TFDQuery;
    FvLoginID: TFDAutoIncField;
    FvLoginUsuario: TStringField;
    FvLoginSituacao: TStringField;
    FvLoginSTATUS: TBooleanField;
    FvAgendaFalta: TStringField;
    FvAgendaData: TStringField;
    FvAgendaAtividade: TStringField;
    FvAgendaContatoCliente: TStringField;
    FGProspecto: TFDQuery;
    FGProspectoFrequencia: TIntegerField;
    FGProspectoLocalidade: TStringField;
    FfProspectoID_USUARIO: TIntegerField;
    FfProspectoTIP_PROSPECTO: TSmallintField;
    FfProspectoSTA_PROSPECTO: TBooleanField;
    procedure FvProspectoAfterScroll(DataSet: TDataSet);
    procedure fvAtividadeAfterScroll(DataSet: TDataSet);
    procedure FvProspectoAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_DB: TDM_DB;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses CadCliente, Main,
  InscricaoFiscal;

{$R *.dfm}

procedure TDM_DB.fvAtividadeAfterScroll(DataSet: TDataSet);
begin
  //
  DM_DB.FvAgenda.Close;
  DM_DB.FvAgenda.Params.ParamByName('IDU').value :=
    DM_DB.FvLogin.FieldByName('ID').value;
  DM_DB.FvAgenda.Open;

end;

procedure TDM_DB.FvProspectoAfterOpen(DataSet: TDataSet);
begin
  DM_DB.fvAtividade.Close;
  DM_DB.fvAtividade.Params.ParamByName('ACAO').value := 'C';
  DM_DB.fvAtividade.Params.ParamByName('IDP').value :=
    DM_DB.FvProspecto.FieldByName('ID').value;
  DM_DB.fvAtividade.Open;

end;

procedure TDM_DB.FvProspectoAfterScroll(DataSet: TDataSet);
begin
  DM_DB.fvAtividade.Close;
  DM_DB.fvAtividade.Params.ParamByName('ACAO').value := 'C';
  DM_DB.fvAtividade.Params.ParamByName('IDP').value :=
    DM_DB.FvProspecto.FieldByName('ID').value;
  DM_DB.fvAtividade.Open;

end;


end.
