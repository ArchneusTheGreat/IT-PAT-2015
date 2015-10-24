unit Quiz_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ColorButton, Buttons;

type
  TQuiz_Form = class(TForm)
    lblA: TLabel;
    lblB: TLabel;
    lblC: TLabel;
    lblD: TLabel;
    lblQuestion: TLabel;
    lblPOPQuiz: TLabel;
    PBClock: TProgressBar;
    tmrClock: TTimer;
    lblClock: TLabel;
    btnA: TColorButton;
    btnB: TColorButton;
    btnC: TColorButton;
    btnD: TColorButton;
    btnClose: TBitBtn;
    procedure tmrClockTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Quiz_Form: TQuiz_Form;

implementation

{$R *.dfm}
uses Home_U, Login_U, New_U, Client_U;

procedure TQuiz_Form.tmrClockTimer(Sender: TObject);
begin
  PBClock.Position := PBClock.Position + 5;
end;



procedure TQuiz_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Home_Form.Show;
end;

procedure TQuiz_Form.FormCreate(Sender: TObject);
begin
Quiz_Form.left := round((screen.WorkAreaWidth -600)/2);
/// maak procedure vraag///
tmrClock.Enabled := true;
PBclock.Position := 0;
end;

procedure TQuiz_Form.btnCloseClick(Sender: TObject);
begin
  Quiz_Form.Hide;
  Client_Form.Show;
end;

end.
