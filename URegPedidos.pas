unit URegPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  Datasnap.DBClient, VclTee.TeeGDIPlus, VclTee.TeEngine, VclTee.TeeProcs,
  VclTee.Chart, VclTee.DBChart, Vcl.DBCGrids, VclTee.Series;

type
  TFProspects = class(TForm)
    dsCliente: TDataSource;
    PC_Funil: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    Panel3: TPanel;
    Label16: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Pnl_Atividade: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button10: TButton;
    DBGrid1: TDBGrid;
    dsAtividade: TDataSource;
    gbComentario: TGroupBox;
    DBRE_Comentario: TDBRichEdit;
    gb_Atividade: TGroupBox;
    dsPROSPECTO: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBText1: TDBText;
    dblCliente: TDBLookupComboBox;
    DBText2: TDBText;
    DBText3: TDBText;
    DBGrid2: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    dsAtividade_Dsc: TDataSource;
    DBText5: TDBText;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    dsAgenda: TDataSource;
    BtFechar: TButton;
    btAplicar: TButton;
    Panel6: TPanel;
    Label7: TLabel;
    Button15: TButton;
    Button16: TButton;
    Panel7: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBText4: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBLookupComboBox2: TDBLookupComboBox;
    DBGrid4: TDBGrid;
    Panel8: TPanel;
    Label11: TLabel;
    Button9: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    GroupBox1: TGroupBox;
    DBText10: TDBText;
    Label12: TLabel;
    Label13: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    GroupBox2: TGroupBox;
    DBRichEdit1: TDBRichEdit;
    DBGrid5: TDBGrid;
    TabSheet5: TTabSheet;
    DBGrid3: TDBGrid;
    DBChart1: TDBChart;
    Series1: THorizBarSeries;
    Panel2: TPanel;
    Label14: TLabel;
    Button14: TButton;
    Button17: TButton;
    Panel5: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText11: TDBText;
    DBLookupComboBox4: TDBLookupComboBox;
    DBGrid6: TDBGrid;
    Panel9: TPanel;
    Label19: TLabel;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    GroupBox3: TGroupBox;
    DBText12: TDBText;
    Label20: TLabel;
    Label21: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    GroupBox4: TGroupBox;
    DBRichEdit2: TDBRichEdit;
    DBGrid7: TDBGrid;
    Panel10: TPanel;
    Label22: TLabel;
    Button22: TButton;
    Panel11: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    DBLookupComboBox6: TDBLookupComboBox;
    DBGrid8: TDBGrid;
    Panel12: TPanel;
    Label26: TLabel;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    GroupBox5: TGroupBox;
    DBText16: TDBText;
    Label27: TLabel;
    Label28: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    GroupBox6: TGroupBox;
    DBRichEdit3: TDBRichEdit;
    DBGrid9: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PG_RegPedidosChange(Sender: TObject);
    procedure BtAplicarClick(Sender: TObject);
    procedure dblClienteExit(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure dsPROSPECTODataChange(Sender: TObject; Field: TField);
    procedure PC_FunilChange(Sender: TObject);
    procedure Carrega_prospecto;
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure dsAtividadeDataChange(Sender: TObject; Field: TField);
    procedure Button11Click(Sender: TObject);
    procedure BtFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProspects: TFProspects;

implementation

{$R *.dfm}

uses
  Main,
  uDM_testePratico, ubusca;

procedure TFProspects.BtFecharClick(Sender: TObject);
var
  FB: TForm;
begin
  FB := TFBusca.Create(Application);
  FB.ShowModal;

  if not DM_DB.FvProspecto.FieldByName('TIP_PROSPECTO').IsNull then
    PC_Funil.TabIndex := (DM_DB.FvProspecto.FieldByName('TIP_PROSPECTO')
      .Value - 1);

  FreeAndNil(FB);
end;

procedure TFProspects.Button10Click(Sender: TObject);
begin
  if MessageDlg('Confirma a exclusão do Item?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
  begin
    Button7.Enabled := true;
    Button10.Enabled := (Button7.Enabled);
    Button8.Enabled := not(Button7.Enabled);
    Button8Click(Self);
  end;
end;

procedure TFProspects.Button11Click(Sender: TObject);
begin
  if DM_DB.FvProspectoSTA_PROSPECTO.AsBoolean then
  begin
    if MessageDlg('Confirma a Desativa  ?', TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
    begin
      DBGrid1.Tag := 1;
      Button3Click(Self);
    end;
  end
end;

procedure TFProspects.Button1Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  BtFechar.Enabled := (Button1.Enabled);
  Pnl_Atividade.Enabled := (Button1.Enabled);

  DM_DB.FvProspecto.Append;
  DM_DB.FvProspecto.FieldByName('DATA').Value := now;
  dblCliente.SetFocus;

end;

procedure TFProspects.Button2Click(Sender: TObject);
begin
  if DM_DB.FvProspecto.State = dsBrowse then
    DM_DB.FvProspecto.Cancel;
  Button1.Enabled := true;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  BtFechar.Enabled := (Button1.Enabled);
  Pnl_Atividade.Enabled := (Button1.Enabled);
end;

procedure TFProspects.Button3Click(Sender: TObject);
Var
  pacao: string;
begin
  try

    with DM_DB do
    begin

      pacao := 'E';

      if DBGrid1.Tag = 0 then
      begin
        IF FvProspecto.State = dsInsert THEN
          pacao := 'I';
        IF FvProspecto.State = dsEdit then
          pacao := 'A';
      end;

      if pacao <> 'E' then
      BEGIN
        if dblCliente.KeyValue = Null then
        begin
          ShowMessage('Ocorreu um erro.' + #13 +
            'Por favor, Selecione o Cliente.');
          dblCliente.SetFocus;
          exit;
        end;
      END;

      DM_DB.ftProspecto.CLOSE;

      DM_DB.ftProspecto.Params.ParamByName('ACAO').Value := pacao;
      DM_DB.ftProspecto.Params.ParamByName('IDP').Value :=
        DM_DB.FvProspecto.FieldByName('ID').Value;
      DM_DB.ftProspecto.Params.ParamByName('IDE').Value :=
        DM_DB.FvProspecto.FieldByName('ID_ENTIDADE').Value;
      DM_DB.ftProspecto.Params.ParamByName('DATA').Value :=
        DM_DB.FvProspecto.FieldByName('Data').Value;
      DM_DB.ftProspecto.Params.ParamByName('IDU').Value :=
        DM_DB.FvLogin.FieldByName('ID').Value;
      DM_DB.ftProspecto.Params.ParamByName('TIP').Value :=
        PC_Funil.TabIndex + 1;

      case DBGrid1.Tag of
        0:
          DM_DB.ftProspecto.Params.ParamByName('STA').Value := 1;
        1:
          DM_DB.ftProspecto.Params.ParamByName('STA').Value := 0;
        2:
          begin
            DM_DB.ftProspecto.Params.ParamByName('ACAO').Value := 'S';
            case PC_Funil.TabIndex of
              0:
                DM_DB.ftProspecto.Params.ParamByName('TIP').Value := 2;
              1:
                DM_DB.ftProspecto.Params.ParamByName('TIP').Value := 3;
              2:
                DM_DB.ftProspecto.Params.ParamByName('TIP').Value := 4;
            end;
          end;
      end;

      DM_DB.ftProspecto.ExecSQL;
      //
      if FvProspecto.State = dsBrowse then
        FvProspecto.Cancel;
      //
      FvProspecto.CLOSE;
      FvProspecto.Params.ParamByName('ACAO').Value := 'C';
      FvProspecto.Params.ParamByName('IDU').Value :=
        FvLogin.FieldByName('ID').Value;
      FvProspecto.Open;
      DBGrid1.Tag := 0;
    end;
    Button1.Enabled := true;
    Button4.Enabled := (Button1.Enabled);
    Button5.Enabled := (Button1.Enabled);
    Button3.Enabled := not(Button1.Enabled);
    Button2.Enabled := not(Button1.Enabled);
    BtFechar.Enabled := (Button1.Enabled);
    Pnl_Atividade.Enabled := (Button1.Enabled);
    DBGrid1.Tag := 0;
  except
    On E: Exception do
    begin
      ShowMessage('Ocorreu um erro.' + #13 +
        'Por favor, entre em contato com o administrador do sistema.');
    end;
  end;

end;

procedure TFProspects.Button4Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  BtFechar.Enabled := (Button1.Enabled);
  Pnl_Atividade.Enabled := (Button1.Enabled);
  DM_DB.FvProspecto.Edit;
  dblCliente.SetFocus;
end;

procedure TFProspects.Button5Click(Sender: TObject);
begin

  if DM_DB.FvProspectoSTA_PROSPECTO.AsBoolean then
  begin
    if MessageDlg('Confirma a Desativa  ?', TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
    begin
      DBGrid1.Tag := 1;
      Button3Click(Self);
    end;
  end
  else
  begin
    if MessageDlg('Confirma a Ativa  ?', TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
    begin
      DBGrid1.Tag := 0;
      Button3Click(Self);
    end;
  end;

end;

procedure TFProspects.Button6Click(Sender: TObject);
begin
  DM_DB.fvAtividade.Append;
  DM_DB.fvAtividade.FieldByName('Data').Value :=
    FormatDateTime('dd/MM/yyyy HH:MM', now);
  DM_DB.fvAtividade.FieldByName('ID_PROSPECTO').Value :=
    DM_DB.FvProspecto.FieldByName('ID').Value;

  Button6.Enabled := false;
  Button10.Enabled := (Button6.Enabled);
  Button7.Enabled := not(Button6.Enabled);
  Button8.Enabled := not(Button6.Enabled);

end;

procedure TFProspects.Button7Click(Sender: TObject);
begin
  DM_DB.fvAtividade.Cancel;
  Button6.Enabled := true;
  Button10.Enabled := (Button6.Enabled);
  Button7.Enabled := not(Button6.Enabled);
  Button8.Enabled := not(Button6.Enabled);
end;

procedure TFProspects.Button8Click(Sender: TObject);
var
  VACAO: string;
begin

  try
    VACAO := 'E';
    IF DM_DB.fvAtividade.State = dsInsert THEN
      VACAO := 'I';

    if VACAO = 'I' then
    begin
      if (DM_DB.fvAtividade.FieldByName('Atividade').Value = '') or
        (DM_DB.fvAtividade.FieldByName('Atividade').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 +
          'Por favor, Informe a Atividade.');
        exit;
      end;
      //
      if (DM_DB.fvAtividade.FieldByName('Comentário').Value = '') or
        (DM_DB.fvAtividade.FieldByName('Comentário').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 +
          'Por favor, Informe o Comentário .');
        DBRE_Comentario.SetFocus;
        exit;
      end;
    end;
    //

    DBGrid1.Tag := DM_DB.FvProspectoID.Value;
    DM_DB.ftAtividade.CLOSE;
    DM_DB.ftAtividade.Params.ParamByName('ACAO').Value := VACAO;
    DM_DB.ftAtividade.Params.ParamByName('IDA').Value :=
      DM_DB.fvAtividade.FieldByName('IDA').Value;
    DM_DB.ftAtividade.Params.ParamByName('IDP').Value :=
      DM_DB.FvProspectoID.Value;
    DM_DB.ftAtividade.Params.ParamByName('DAT').Value :=
      DM_DB.fvAtividade.FieldByName('Data').Value;
    DM_DB.ftAtividade.Params.ParamByName('ATI').Value :=
      DM_DB.fvAtividade.FieldByName('TIP_ATIVIDADE').Value;
    DM_DB.ftAtividade.Params.ParamByName('COM').Value :=
      DM_DB.fvAtividade.FieldByName('Comentário').Value;

    DM_DB.ftAtividade.Params.ParamByName('STA').Value :=
      DM_DB.fvAtividade.FieldByName('STA_ATIVIDADE').Value;

    DM_DB.ftAtividade.ExecSQL;
    //
    DM_DB.fvAtividade.Cancel;
    DM_DB.fvAtividade.CLOSE;
    DM_DB.ftAtividade.Params.ParamByName('ACAO').Value := 'C';
    DM_DB.fvAtividade.Open;
    //
    Button6.Enabled := true;
    Button10.Enabled := (Button6.Enabled);
    Button7.Enabled := not(Button6.Enabled);
    Button8.Enabled := not(Button6.Enabled);
    DBGrid1.Tag := 0;

  except
    On E: Exception do
    begin
      ShowMessage('Ocorreu um erro.' + #13 +
        'Por favor, entre em contato com o administrador do sistema.');
    end;
  end;

end;

procedure TFProspects.BtAplicarClick(Sender: TObject);
begin
  if DM_DB.FvProspectoSTA_PROSPECTO.AsBoolean then
  begin
    case PC_Funil.TabIndex of
      0:
        begin
          if MessageDlg('Confirma para ' + TabSheet2.Caption,
            TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0)
            = idYes then
          begin
            DBGrid1.Tag := 2;
            Button3Click(Self);
          end;
        end;
      1:
        begin
          if MessageDlg('Confirma para ' + TabSheet3.Caption,
            TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0)
            = idYes then
          begin
            DBGrid1.Tag := 2;
            Button3Click(Self);
          end;
        end;
      2:
        begin
          if MessageDlg('Confirma para ' + TabSheet4.Caption,
            TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0)
            = idYes then
          begin
            DBGrid1.Tag := 2;
            Button3Click(Self);
          end;
        end;
    end;
  end;

end;

procedure TFProspects.dblClienteExit(Sender: TObject);
begin
  if DM_DB.FvProspecto.State <> dsBrowse then
    DM_DB.FvProspectoContato.Value := DM_DB.FvCliente.FieldByName
      ('Contato').Value;
end;

procedure TFProspects.DBLookupComboBox1Exit(Sender: TObject);
begin
  if DM_DB.fvAtividade.State <> dsBrowse then
    DM_DB.fvAtividadeAtividade.Value := DM_DB.FvDscAtividadesDSC.Value;
end;

procedure TFProspects.dsAtividadeDataChange(Sender: TObject; Field: TField);
begin
  Label3.Caption := FormatFloat('0###', DM_DB.fvAtividade.RecNo) + '/' +
    FormatFloat('0###', DM_DB.fvAtividade.RecordCount);
end;

procedure TFProspects.dsPROSPECTODataChange(Sender: TObject; Field: TField);
begin
  Label16.Caption := FormatFloat('0###', DM_DB.FvProspecto.RecNo) + '/' +
    FormatFloat('0###', DM_DB.FvProspecto.RecordCount);
  Pnl_Atividade.Enabled := DM_DB.FvProspectoSTA_PROSPECTO.AsBoolean;
  //
  Label7.Caption := FormatFloat('0###', DM_DB.FvProspecto.RecNo) + '/' +
    FormatFloat('0###', DM_DB.FvProspecto.RecordCount);
  //
  Label14.Caption := FormatFloat('0###', DM_DB.FvProspecto.RecNo) + '/' +
    FormatFloat('0###', DM_DB.FvProspecto.RecordCount);
  //
  Label22.Caption := FormatFloat('0###', DM_DB.FvProspecto.RecNo) + '/' +
    FormatFloat('0###', DM_DB.FvProspecto.RecordCount);

end;

procedure TFProspects.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_DB.FvAgenda.CLOSE;
  DM_DB.FvCliente.CLOSE;
  DM_DB.FvDscAtividades.CLOSE;
  DM_DB.FvProspecto.CLOSE;
  DM_DB.fvAtividade.CLOSE;
end;

procedure TFProspects.FormCreate(Sender: TObject);
begin
  Button1.Enabled := BtFechar.Enabled;
  Button4.Enabled := Button1.Enabled;
  Button5.Enabled := Button1.Enabled;
  //
  DM_DB.FvCliente.Open;
  //
  DM_DB.FvDscAtividades.Open;
  //
  Carrega_prospecto;
end;

procedure TFProspects.PC_FunilChange(Sender: TObject);
begin
  Carrega_prospecto;
end;

procedure TFProspects.PG_RegPedidosChange(Sender: TObject);
begin

  DM_DB.FvProspecto.CLOSE;
  DM_DB.FvProspecto.Params.ParamByName('ACAO').Value := 'C';
  DM_DB.FvProspecto.Params.ParamByName('TIP').Value := (PC_Funil.TabIndex + 1);
  DM_DB.FvProspecto.Params.ParamByName('IDU').Value :=
    DM_DB.FvUsuario.FieldByName('ID').Value;
  //
  DM_DB.FvProspecto.Params.ParamByName('IDP').Value := 0;
  //
  DM_DB.FvProspecto.Open;
  //
  DM_DB.FvAgenda.CLOSE;
  DM_DB.FvAgenda.Params.ParamByName('IDU').Value :=
    DM_DB.FvLogin.FieldByName('ID').Value;
  DM_DB.FvAgenda.Open;

end;

procedure TFProspects.Carrega_prospecto;
begin
  DM_DB.FvProspecto.CLOSE;
  DM_DB.FvProspecto.Params.ParamByName('ACAO').Value := 'C';
  DM_DB.FvProspecto.Params.ParamByName('TIP').Value := (PC_Funil.TabIndex + 1);
  DM_DB.FvProspecto.Params.ParamByName('IDU').Value :=
    DM_DB.FvLogin.FieldByName('ID').Value;
  DM_DB.FvProspecto.Open;
  //
  DM_DB.FvAgenda.CLOSE;
  DM_DB.FvAgenda.Params.ParamByName('IDU').Value :=
    DM_DB.FvLogin.FieldByName('ID').Value;
  DM_DB.FvAgenda.Open;
  //
  DM_DB.FGProspecto.CLOSE;
  DM_DB.FGProspecto.Params.ParamByName('ACAO').Value := 'G';
  DM_DB.FGProspecto.Params.ParamByName('IDU').Value :=
    DM_DB.FvLogin.FieldByName('ID').Value;
  DM_DB.FGProspecto.Open;

end;

end.
