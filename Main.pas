unit Main;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  System.Actions,
  Vcl.ActnList,
  System.ImageList,
  Vcl.ImgList,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client, Vcl.Imaging.pngimage;

type
  TfMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PanelWorkArea: TPanel;
    Label1: TLabel;
    Button1: TButton;
    ActionList1: TActionList;
    ImageList1: TImageList;
    ActionCadContato: TAction;
    ActionGerenciamentoProspects: TAction;
    Button3: TButton;
    ActionCadUsuario: TAction;
    Image1: TImage;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ActionCadContatoExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionCadUsuarioExecute(Sender: TObject);
    procedure ActionGerenciamentoProspectsExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FFormActive: TForm;
    procedure LoadForm(AClass: TFormClass);
  public
    { Public declarations }
    function GeneratorID(aName: string; Incrementa: Boolean): integer;
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

uses
  CadCliente, uDM_testePratico, UCadUsuario,
  URegPedidos;

procedure TfMain.ActionCadContatoExecute(Sender: TObject);
begin
  Self.LoadForm(TfCadCliente);
end;

procedure TfMain.ActionCadUsuarioExecute(Sender: TObject);
begin
  Self.LoadForm(TFCadUsuario);
end;

procedure TfMain.ActionGerenciamentoProspectsExecute(Sender: TObject);
begin
  Self.LoadForm(TFProspects);
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_db.FD_SQLlocal.close;
   close;
  Halt(0);
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  DM_db.FD_SQLlocal.Open();
end;

procedure TfMain.FormShow(Sender: TObject);
begin
  Label1.Caption := Concat(Label1.Caption, ' (',
    DM_db.FvLogin.FieldByName('Usuario').Value, ' )');

end;

procedure TfMain.LoadForm(AClass: TFormClass);
var
  slQuery: TStringList;
begin
  slQuery := TStringList.Create;

  if Assigned(Self.FFormActive) then
  begin
    Self.FFormActive.CLOSE;
    Self.FFormActive.Free;
    Self.FFormActive := nil;
  end;

  Self.FFormActive := AClass.Create(nil);
  Self.FFormActive.Parent := Self.PanelWorkArea;
  Self.FFormActive.BorderStyle := TFormBorderStyle.bsNone;

  Self.FFormActive.Top := 0;
  Self.FFormActive.Left := 0;
  Self.FFormActive.Align := TAlign.alClient;

  fMain.Caption := Self.FFormActive.Caption;

  Self.FFormActive.Show;
end;

function TfMain.GeneratorID(aName: string; Incrementa: Boolean): integer;
begin
end;

end.
