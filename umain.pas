unit uMain;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Menus, Buttons;

type

  { TfMain }

  TfMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    N1: TMenuItem;
    Alwaysontop1: TMenuItem;
    HidefromTaskbar1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Alwaysontop1Click(Sender: TObject);
    procedure HidefromTaskbar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}

procedure TfMain.Timer1Timer(Sender: TObject);
begin
  Label1.Caption:=FormatDateTime('yyyy-mm-dd HH:nn:ss',Now())+' (US)';
  Label2.Caption:=FormatDateTime('yyyy-mm-dd HH:nn:ss',Now()+7/24)+' (RO)';
end;

procedure TfMain.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMain.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(fMain.Handle, WM_SYSCOMMAND, $F012, 0);
end;

procedure TfMain.Alwaysontop1Click(Sender: TObject);
begin
  Alwaysontop1.Checked:=Not Alwaysontop1.Checked;
  If Alwaysontop1.Checked Then
    fMain.FormStyle:=fsStayOnTop
  Else
    fMain.FormStyle:=fsNormal;
end;

procedure TfMain.HidefromTaskbar1Click(Sender: TObject);
begin
  HidefromTaskBar1.Checked:=Not HidefromTaskBar1.Checked;
  If HidefromTaskBar1.Checked Then
    ShowWindow(Application.Handle, SW_HIDE)
  Else
    ShowWindow(Application.Handle, SW_SHOW);
end;

end.
