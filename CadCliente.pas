unit CadCliente;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  // Units Necessárias
  FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  Xml.xmldom, Xml.XmlTransform, Xml.XMLIntf, Xml.XMLDoc,
  FireDAC.VCLUI.Wait, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdTelnet, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  IdBaseComponent, IdMessage, System.DateUtils,
  IdText, IdAttachmentFile, Vcl.ComCtrls, IdCustomTCPServer,
  IdSocksServer, IdHTTP, Vcl.Grids, Vcl.DBGrids;

type
  TEnderecoCompleto = record
    CEP, logradouro, complemento, bairro, localidade, uf, unidade,
      IBGE: string end;

  type
    TfCadCliente = class(TForm)
      DS_CLIENTE: TDataSource;
      GroupBox2: TGroupBox;
      Panel2: TPanel;
      Panel1: TPanel;
      Label16: TLabel;
      Button1: TButton;
      Button2: TButton;
      Button3: TButton;
      Button4: TButton;
      Button5: TButton;
      DBGrid1: TDBGrid;
      Label1: TLabel;
      DBEdit1: TDBEdit;
      Label2: TLabel;
      DBEdit2: TDBEdit;
      Label3: TLabel;
      DBEdit3: TDBEdit;
      Label4: TLabel;
      DBEdit4: TDBEdit;
      GroupBox1: TGroupBox;
      Label5: TLabel;
      DBEdit5: TDBEdit;
      Label6: TLabel;
      DBEdit6: TDBEdit;
      Label7: TLabel;
      DBEdit7: TDBEdit;
      Label8: TLabel;
      DBEdit8: TDBEdit;
      Label9: TLabel;
      DBEdit9: TDBEdit;
      Label10: TLabel;
      DBEdit10: TDBEdit;
      Label11: TLabel;
      DBEdit11: TDBEdit;
      Button_Buscar_Cep: TButton;
      XMLDocument1: TXMLDocument;
      procedure Button1Click(Sender: TObject);
      procedure Button2Click(Sender: TObject);
      procedure Button3Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FDQuery1AfterInsert(DataSet: TDataSet);
      procedure FDQuery1AfterPost(DataSet: TDataSet);
      procedure FDQuery1AfterCancel(DataSet: TDataSet);
      procedure DBEdit11KeyPress(Sender: TObject; var Key: Char);
      procedure FDQuery1AfterEdit(DataSet: TDataSet);
      procedure Button4Click(Sender: TObject);
      procedure DS_CLIENTEDataChange(Sender: TObject; Field: TField);
      procedure Button5Click(Sender: TObject);
      procedure Button_Buscar_CepClick(Sender: TObject);
      procedure ConsultaCEP(CEP: String);

    private
      { Private declarations }

    var
      dadosEnderecoCompleto: TEnderecoCompleto;

      procedure mensagemAviso(mensagem: string);

    public
      { Public declarations }
      pAcao: string;
    end;

  var
    fCadCliente: TfCadCliente;

implementation

{$R *.dfm}

uses
  Main,
  System.RegularExpressions,
  uDM_testePratico;

procedure TfCadCliente.Button1Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);

  pAcao := 'I';
  DM_DB.FvCliente.Append;
  DBEdit1.SetFocus;
end;

procedure TfCadCliente.Button2Click(Sender: TObject);
begin
  DM_DB.FvCliente.Cancel;
  Button1.Enabled := true;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
end;

procedure TfCadCliente.Button3Click(Sender: TObject);
begin

  try
    try

      if (DM_DB.FvCliente.FieldByName('Contato').Value = '') or
        (DM_DB.FvCliente.FieldByName('Contato').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 + 'Por favor, Informe o Contato.');
        DBEdit1.SetFocus;
        exit;
      end;
      //
      if (DM_DB.FvCliente.FieldByName('E-mail').Value = '') or
        (DM_DB.FvCliente.FieldByName('E-mail').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 + 'Por favor, Informe o E-mail.');
        DBEdit3.SetFocus;
        exit;
      end;
      //
      if (DM_DB.FvCliente.FieldByName('Telefone').Value = '') or
        (DM_DB.FvCliente.FieldByName('Telefone').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 +
          'Por favor, Informe o Telefone.');
        DBEdit3.SetFocus;
        exit;
      end;
      //
      if (DM_DB.FvCliente.FieldByName('Celular').Value = '') or
        (DM_DB.FvCliente.FieldByName('Celular').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 + 'Por favor, Informe o Celular.');
        DBEdit3.SetFocus;
        exit;
      end;
      //

      if (DM_DB.FvCliente.FieldByName('CEP').Value = 0) or
        (DM_DB.FvCliente.FieldByName('CEP').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 + 'Por favor, Informe o CEP.');
        DBEdit5.SetFocus;
        exit;
      end;

      {
        banco de endereço
      }
      //
      DM_DB.FtCliente.close;
      DM_DB.FtCliente.Params.ParamByName('ACAO').Value := pAcao;
      //
      DM_DB.FtCliente.Params.ParamByName('ID').Value :=
        DM_DB.FvCliente.FieldByName('ID').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('NOM').Value :=
        DM_DB.FvCliente.FieldByName('Contato').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('EMA').Value :=
        DM_DB.FvCliente.FieldByName('E-mail').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('TEL').Value :=
        DM_DB.FvCliente.FieldByName('Telefone').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('CEL').Value :=
        DM_DB.FvCliente.FieldByName('Celular').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('TIP').Value :=
        DM_DB.FvCliente.FieldByName('TIPO').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('USE').Value :=
        DM_DB.FvLogin.FieldByName('ID').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('STA').Value :=
        DM_DB.FvCliente.FieldByName('STATUS').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('IDEND').Value :=
        DM_DB.FvCliente.FieldByName('ID_ENDERECO').Value;
      //
      DM_DB.FvCliente.Params.ParamByName('IDR').Value := 0;
      //
      DM_DB.FtCliente.Params.ParamByName('CEP').Value :=
        DM_DB.FvCliente.FieldByName('CEP').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('LOG').Value :=
        DM_DB.FvCliente.FieldByName('LOGRADOURO').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('NUM').Value :=
        DM_DB.FvCliente.FieldByName('NUMERO').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('COM').Value :=
        DM_DB.FvCliente.FieldByName('COMPLEMENTO').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('BAI').Value :=
        DM_DB.FvCliente.FieldByName('BAIRRO').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('CID').Value :=
        DM_DB.FvCliente.FieldByName('CIDADE').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('EST').Value :=
        DM_DB.FvCliente.FieldByName('ESTADO').Value;
      //

      DM_DB.FtCliente.ExecSQL;
      //
      Button1.Enabled := true;
      DBGrid1.Enabled := (Button1.Enabled);
      Button4.Enabled := (Button1.Enabled);
      Button5.Enabled := (Button1.Enabled);
      Button3.Enabled := not(Button1.Enabled);
      Button2.Enabled := not(Button1.Enabled);
      DM_DB.FvCliente.Cancel;;

      DM_DB.FvCliente.Active := false;
      DM_DB.FvCliente.Active := true;
      // DM_DB.FvCliente.Locate('codigo', DBGrid1.Tag, []);

    except
      On E: Exception do
      begin
        ShowMessage('Ocorreu um erro.' + #13 +
          'Por favor, entre em contato com o administrador do sistema.');
        exit;
      end;
    end;

  finally
  end;

end;

procedure TfCadCliente.Button4Click(Sender: TObject);
begin
  DBGrid1.Enabled := false;
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DBGrid1.Enabled := (Button1.Enabled);
  pAcao := 'A';
  DM_DB.FvCliente.Edit;
  DBEdit1.SetFocus;
end;

procedure TfCadCliente.Button5Click(Sender: TObject);
begin

  pAcao := '';
  if MessageDlg('Confirma a Exclusão em Defitivo ?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
  begin
    pAcao := 'E';
    Button3Click(Self);
  end;

end;

procedure TfCadCliente.Button_Buscar_CepClick(Sender: TObject);
begin
  try

    if Length(DM_DB.FvCliente.FieldByName('CEP').Value) <> 8 then
    begin
      mensagemAviso('CEP inválido');
      DBEdit5.SetFocus;
      exit;
    end;

    try
      dadosEnderecoCompleto.CEP := DM_DB.FvCliente.FieldByName('CEP').Value;

      DM_DB.FvCEPS.close;
      DM_DB.FvCEPS.Params.ParamByName('AC').Value := 'C';
      DM_DB.FvCEPS.Params.ParamByName('ID').Value := 0;
      DM_DB.FvCEPS.Params.ParamByName('CEP').Value := dadosEnderecoCompleto.CEP;
      DM_DB.FvCEPS.open;

      if DM_DB.FvCEPS.Eof then
      Begin
        ConsultaCEP(dadosEnderecoCompleto.CEP);
        //
        DBEdit6.Text := UPPERCASE(dadosEnderecoCompleto.logradouro);
        //
        DBEdit11.Text := UPPERCASE(dadosEnderecoCompleto.uf);
        //
        DBEdit7.Text := UPPERCASE(dadosEnderecoCompleto.complemento);
        //
        DBEdit10.Text := UPPERCASE(dadosEnderecoCompleto.localidade);
        //
        DBEdit9.Text := UPPERCASE(dadosEnderecoCompleto.bairro);
      End
      Else
      begin

        dadosEnderecoCompleto.logradouro :=
          DM_DB.FvCEPS.FieldByName('LOGRADOURO').Value;
        //
        dadosEnderecoCompleto.uf := DM_DB.FvCEPS.FieldByName('ESTADO').Value;
        //
        dadosEnderecoCompleto.complemento :=
          DM_DB.FvCEPS.FieldByName('COMPLEMENTO').Value;
        //
        dadosEnderecoCompleto.localidade :=
          DM_DB.FvCEPS.FieldByName('CIDADE').Value;
        //
        dadosEnderecoCompleto.bairro := DM_DB.FvCEPS.FieldByName
          ('BAIRRO').Value;
        //
        DBEdit6.Text := UPPERCASE(dadosEnderecoCompleto.logradouro);
        //
        DBEdit11.Text := UPPERCASE(dadosEnderecoCompleto.uf);
        //
        DBEdit7.Text := UPPERCASE(dadosEnderecoCompleto.complemento);
        //
        DBEdit10.Text := UPPERCASE(dadosEnderecoCompleto.localidade);
        //
        DBEdit9.Text := UPPERCASE(dadosEnderecoCompleto.bairro);
        //
      end;

      //
      DM_DB.FvCliente.FieldByName('LOGRADOURO').Value := DBEdit6.Text;
      //
      DM_DB.FvCliente.FieldByName('COMPLEMENTO').Value := DBEdit7.Text;
      //
      DM_DB.FvCliente.FieldByName('BAIRRO').Value := DBEdit9.Text;
      //
      DM_DB.FvCliente.FieldByName('CIDADE').Value := DBEdit10.Text;
      //
      DM_DB.FvCliente.FieldByName('ESTADO').Value := DBEdit11.Text;
      //
      DM_DB.FvCliente.FieldByName('NUMERO').Value := '';

      DBEdit8.SetFocus;

    except
      mensagemAviso('CEP inválido');
      DBEdit5.SetFocus;
    end;
  finally
  end;

end;

procedure TfCadCliente.FDQuery1AfterCancel(DataSet: TDataSet);
begin
  Button1.Enabled := true;
  Button3.Enabled := Not(Button1.Enabled);
  Button2.Enabled := Not(Button1.Enabled);
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
end;

procedure TfCadCliente.FDQuery1AfterEdit(DataSet: TDataSet);
begin
  Button3.Enabled := Not(Button1.Enabled);
  Button2.Enabled := Not(Button1.Enabled);
end;

procedure TfCadCliente.FDQuery1AfterInsert(DataSet: TDataSet);
begin
  Button3.Enabled := Not(Button4.Enabled);
  Button2.Enabled := Not(Button4.Enabled);
end;

procedure TfCadCliente.FDQuery1AfterPost(DataSet: TDataSet);
begin
  Button1.Enabled := true;
  Button3.Enabled := Not(Button1.Enabled);
  Button2.Enabled := Not(Button1.Enabled);
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
end;

procedure TfCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_DB.FvCliente.close;
  DM_DB.FvEndereco.close;
end;

procedure TfCadCliente.FormCreate(Sender: TObject);
begin
  DM_DB.FvCliente.CLOSE;
  DM_DB.FVCliente.Params.ParamByName('ACAO').Value := 'C';
  DM_DB.FvCliente.Params.ParamByName('USE').Value :=
    DM_db.FvLogin.FieldByName('ID').Value;
  DM_DB.FvCliente.open;
  //
  DM_DB.FvEndereco.Params.ParamByName('AC').Value := 'C';
  DM_DB.FvEndereco.Params.ParamByName('ID').Value := 0;
  DM_DB.FvEndereco.Params.ParamByName('CEP').Value :=
    DM_DB.FvCliente.FieldByName('ID_ENDERECO').Value;
  DM_DB.FvEndereco.open;

end;

procedure TfCadCliente.DS_CLIENTEDataChange(Sender: TObject; Field: TField);
begin
  Label16.Caption := FormatFloat('0###', DM_DB.FvCliente.RecNo) + '/' +
    FormatFloat('0###', DM_DB.FvCliente.RecordCount);
end;

procedure TfCadCliente.DBEdit11KeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0' .. '9', #8, #13, #27, ^C, ^V, ^X, ^Z]) then
  begin
    Key := #0;
  end;
end;

procedure TfCadCliente.mensagemAviso(mensagem: string);
begin
  Application.MessageBox(PChar(mensagem), '', MB_OK + MB_ICONERROR);
end;

procedure TfCadCliente.ConsultaCEP(CEP: String);
var
  tempXML: IXMLNode;
  tempNodePAI: IXMLNode;
  tempNodeFilho: IXMLNode;
  i: integer;
begin

  XMLDocument1.FileName := 'https://viacep.com.br/ws/' + Trim(CEP) + '/xml/';
  XMLDocument1.Active := true;
  tempXML := XMLDocument1.DocumentElement;

  tempNodePAI := tempXML.ChildNodes.FindNode('logradouro');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.logradouro := tempNodeFilho.Text;
  end;

  tempNodePAI := tempXML.ChildNodes.FindNode('bairro');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.bairro := tempNodeFilho.Text;
  end;

  tempNodePAI := tempXML.ChildNodes.FindNode('localidade');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.localidade := tempNodeFilho.Text;
  end;

  tempNodePAI := tempXML.ChildNodes.FindNode('uf');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.uf := tempNodeFilho.Text;
  end;

  tempNodePAI := tempXML.ChildNodes.FindNode('complemento');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.complemento := tempNodeFilho.Text;
  end;

  DBEdit6.Text := Copy(dadosEnderecoCompleto.logradouro, 1,
    Pos(' ', dadosEnderecoCompleto.logradouro) - 1);
  //
  DBEdit6.Text := Copy(dadosEnderecoCompleto.logradouro,
    Pos(' ', dadosEnderecoCompleto.logradouro) + 1,
    Length(dadosEnderecoCompleto.logradouro));

end;

end.
