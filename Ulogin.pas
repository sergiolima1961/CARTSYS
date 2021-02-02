unit Ulogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, IniFiles,
  //
  FireDAC.Comp.Client;

type
  TFLogin = class(TForm)
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  var
    FPath: string;
    FDatabase: string;
    FSenha: string;
    FUsuario: string;
    FDriver: string;
    FSecao: string;
  public
    { Public declarations }

  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses uDM_testePratico, Main;

procedure TFLogin.Button1Click(Sender: TObject);
begin
  // ativa a tabela
  DM_db.FvLogin.close;
  DM_db.FvLogin.Params.ParamByName('ACA').Value := 'S';
  DM_db.FvLogin.Params.ParamByName('log').Value := edtUsuario.Text;
  DM_db.FvLogin.Params.ParamByName('sen').Value := edtSenha.Text;
  DM_db.FvLogin.Open;

  // verifica se os campos coincidem,
  // tanto na tabela, quanto nas edits
  if not DM_db.FvLogin.Eof then
  begin
    // mostra outro form
    fMain.Show;
    // esconde o atual
    Self.Hide;
  end
  // se os campos forem vazios
  else if (edtUsuario.Text = '') and (edtSenha.Text = '') then
  begin
    // mostra mensagem
    ShowMessage('Preencha os campos login e senha!');
    edtUsuario.SetFocus;
  end
  else // campos nao conferem
  begin
    // campos nao conferem
    ShowMessage('Usuario ou senha inválidos!');
    edtUsuario.Clear;
    edtSenha.Clear;
  end;
end;

procedure TFLogin.Button2Click(Sender: TObject);
begin
  Halt(0);
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
  DM_db.FD_SQLlocal.Open();

end;

end.
