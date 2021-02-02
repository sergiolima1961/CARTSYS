unit uBusca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFBusca = class(TForm)
    dsBusca: TDataSource;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cb_Busca: TComboBox;
    EdBusca: TEdit;
    BtFechar: TButton;
    DBGrid1: TDBGrid;
    BT_Seleciona: TButton;
    procedure BtFecharClick(Sender: TObject);
    procedure cb_BuscaExit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BT_SelecionaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBusca: TFBusca;

implementation

{$R *.dfm}

uses uDM_testePratico;

procedure TFBusca.BtFecharClick(Sender: TObject);
begin
  with DM_DB do
  begin

    //
    case cb_Busca.ItemIndex of
      - 1, 0:
        begin
          DM_DB.FfProspecto.CLOSE;
          DM_DB.FfProspecto.Params.ParamByName('ACAO').Value := 'B';
          DM_DB.FfProspecto.Params.ParamByName('IDU').Value :=
            DM_DB.FvLogin.FieldByName('ID').Value;
          DM_DB.ftProspecto.Params.ParamByName('TIP').Value := 0;
          DM_DB.FfProspecto.Params.ParamByName('RET').Clear;
          DM_DB.FfProspecto.Params.ParamByName('BUS').Clear;
          DM_DB.FfProspecto.open;
        end;
      1 .. 4:
        begin
          DM_DB.FfProspecto.CLOSE;
          DM_DB.FfProspecto.Params.ParamByName('ACAO').Value := 'P';
          DM_DB.FfProspecto.Params.ParamByName('IDU').Value :=
            DM_DB.FvLogin.FieldByName('ID').Value;
          DM_DB.FfProspecto.Params.ParamByName('RET').Value :=
            cb_Busca.ItemIndex;
          DM_DB.ftProspecto.Params.ParamByName('TIP').Value := 0;
          DM_DB.FfProspecto.Params.ParamByName('BUS').Value := EdBusca.Text;
          DM_DB.FfProspecto.open;
        end;
    end;
  end;

end;

procedure TFBusca.BT_SelecionaClick(Sender: TObject);
begin
  //
  DM_DB.FvProspecto.CLOSE;
  //
  DM_DB.FvProspecto.Params.ParamByName('ACAO').Value := 'B';
  //
  DM_DB.FvProspecto.Params.ParamByName('IDU').Value :=
    DM_DB.FvLogin.FieldByName('ID').Value;
  //
  DM_DB.FvProspecto.Params.ParamByName('TIP').Value :=
    DM_DB.FfProspecto.FieldByName('TIP_PROSPECTO').Value;
  //
  DM_DB.FvProspecto.Params.ParamByName('IDP').Value :=
    DM_DB.FfProspecto.FieldByName('ID').Value;
  //
  DM_DB.FvProspecto.open;
  //
  DM_DB.FfProspecto.CLOSE;
  CLOSE;
end;

procedure TFBusca.cb_BuscaExit(Sender: TObject);
begin

  EdBusca.Clear;
  EdBusca.Width := 0;

  case cb_Busca.ItemIndex of
    1:
      begin
        EdBusca.Width := 360;
      end;
    2:
      begin
        EdBusca.Width := 80;
      end;
  end;

end;

procedure TFBusca.DBGrid1DblClick(Sender: TObject);
begin
  BT_SelecionaClick(Self);
end;

end.
