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
    procedure btnCloseClick(Sender: TObject);
    procedure Go(path : string);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckAnswer(button: integer);
    procedure NextQuestion;
    procedure btnAClick(Sender: TObject);
    procedure btnBClick(Sender: TObject);
    procedure btnCClick(Sender: TObject);
    procedure btnDClick(Sender: TObject);
    function HighScore(game : string; score : integer) : boolean;

  private
    marks : integer;
    quizcount : integer;
    arrNumbers : array[1..5] of integer;
    arrQuestion : array[1..20] of string;
    arrAnswer : array[1..20] of string;
    arrRan1 : array[1..20] of string;
    arrRan2 : array[1..20] of string;
    arrRan3 : array[1..20] of string;
    arrMix : array [1..4] of string;
    { Private declarations }
  public
  total : integer;
    { Public declarations }
  end;

var
  Quiz_Form: TQuiz_Form;

const
  button1 = 1;
  button2 = 2;
  button3 = 3;
  button4 = 4;

implementation

{$R *.dfm}
uses Home_U, Login_U, New_U, Client_U, Datamodule_U;
/////////////////////////////////////TIMER/////////////////////////////////////////
procedure TQuiz_Form.tmrClockTimer(Sender: TObject);
begin
  PBClock.Position := PBClock.Position + 5;
  marks := marks - 1;
  if PBclock.Position = 100 then
  begin
    NextQuestion;
  end;

end;
////////////////////////////////////TIMER//////////////////////////////////////////

////////////////////////////////////Close/////////////////////////////////////////
procedure TQuiz_Form.btnCloseClick(Sender: TObject);
begin
  Quiz_Form.Hide;
  Client_Form.Show;
end;
////////////////////////////////////Close/////////////////////////////////////////

////////////////////////////////////GO////////////////////////////////////////////
procedure TQuiz_Form.Go(path: string);
var

TFile : textfile;
counter, k : integer;
slyn : string;

begin
total := 0;
// read file en save na arrs//
/////////////////////////////
Assignfile(Tfile, path);

try
reset(tfile);
except
  MessageDlg('Quiz ' + path + ' does not exist. Please contact your administrator.',mtWarning,[mbOK],0);
  exit;

end;
counter := 1;
while NOT eof(tfile) do
begin
 readln(Tfile,slyn);
 arrQuestion[counter] := copy(slyn,0,(POS('#',Slyn)-1));
 delete(slyn,1,POS('#',Slyn));
 arrAnswer[counter] := copy(slyn,0,(POS('#',Slyn)-1));
 delete(slyn,1,POS('#',Slyn));
 arrRan1[counter] := copy(slyn,0,(POS('#',Slyn)-1));
 delete(slyn,1,POS('#',Slyn));
 arrRan2[counter] := copy(slyn,0,(POS('#',Slyn)-1));
 delete(slyn,1,POS('#',Slyn));
  arrRan3[counter] := copy(slyn,0,length(slyn));
 //showMessage('vraag: ' + arrQuestion[counter] + '  Antwoord: ' + arrAnswer[counter] + '  Ran3: ' + arrRan3[counter]);
 inc(counter);

end;
closefile(tfile);
//////////////////////////////////////
/////////////randoms/////////////////////////
randomize;
arrNumbers[1] := random(20) + 1;

arrNumbers[2] :=  random(20) + 1;
while arrNumbers[2] = arrNumbers[1] do
  arrNumbers[2] :=  random(20) + 1;

arrNumbers[3] :=  random(20) + 1;
while (arrNumbers[3] = arrNumbers[1]) OR (arrNumbers[3] = arrNumbers[2]) do
  arrNumbers[3] :=  random(20) + 1;

arrNumbers[4] :=  random(20) + 1;
while (arrNumbers[4] = arrNumbers[1]) OR (arrNumbers[4] = arrNumbers[2]) OR (arrNumbers[4] = arrNumbers[3]) do
  arrNumbers[4] :=  random(20) + 1;

arrNumbers[5] :=  random(20) + 1;
while (arrNumbers[5] = arrNumbers[1]) OR (arrNumbers[5] = arrNumbers[2]) OR (arrNumbers[5] = arrNumbers[3]) OR (arrNumbers[5] = arrNumbers[4]) do
  arrNumbers[5] :=  random(20) + 1;
//////////////////randoms////////////////////////
////////////////////////////////////////////////
  tmrClock.Enabled := true;
  quizcount := 1;
  nextquestion;
end;
////////////////////////////////////GO////////////////////////////////////////////


procedure TQuiz_Form.FormActivate(Sender: TObject);
begin
{Go('quizzes\'+Client_Form.quiz+'.txt');}

end;

procedure TQuiz_Form.FormCreate(Sender: TObject);
begin
Quiz_Form.left := round((screen.WorkAreaWidth -600)/2);
Quiz_Form.Top := round((screen.WorkAreaHeight -350)/2);
tmrClock.Enabled := false;
end;

procedure TQuiz_Form.CheckAnswer(button: integer);
begin

case button of
 button1 : if btnA.caption = arrMix[1] then
            begin
            NextQuestion;
            end
            else
            begin
            marks := 0;
            NextQuestion;
            end;

 button2 : if btnB.caption = arrMix[1] then
            begin
              NextQuestion
            end
            else
            begin
              marks := 0;
              NextQuestion;
            end;
            
 button3 : if btnC.caption = arrMix[1] then
            begin
              NextQuestion
            end
            else
            begin
              marks := 0;
              NextQuestion;
            end;

 button4 : if btnD.caption = arrMix[1] then
            begin
              NextQuestion
            end
            else
            begin
              marks := 0;
              NextQuestion;
            end;
end;

end;


/////////////////////////NEXT///////////////
procedure TQuiz_Form.NextQuestion;
var
Oth1, Oth2, Oth3, Oth : integer;
begin
  total := total + marks;
  ///////////////////////////
       arrMix[1] := arrAnswer[arrnumbers[quizcount]];
       arrMix[2] := arrran1[arrnumbers[quizcount]];
       arrMix[3] := arrran2[arrnumbers[quizcount]];
       arrMix[4] := arrran3[arrnumbers[quizcount]];

       randomize;

Oth1 := random(4)+1;
Oth2 := random(4)+1;
Oth3 := random(4)+1;

Oth := random(4)+1;
while Oth1 = Oth do
  Oth1 :=  random(4)+1;
while (Oth2 = Oth) OR (Oth2 = Oth1) do
  Oth2 :=  random(4)+1;
while (Oth3 = Oth) OR (Oth3 = Oth1) OR (Oth3 = Oth2) do
  Oth3 :=  random(4)+1;

  /////////////////////////////

  lblQuestion.caption := arrQuestion[arrnumbers[quizcount]];
  btnA.Caption := arrMix[Oth];
  btnB.Caption := arrMix[Oth1];
  btnC.Caption := arrMix[Oth2];
  btnD.Caption := arrMix[Oth3];

  PBclock.Position := 0;
  marks := 20;
  inc(quizcount);

 if quizcount > 5 then
 begin
   tmrClock.Enabled := false;
   showmessage('Your score is: ' + inttostr(total));
     if    Highscore(client_form.quiz, total) = true then
     begin
       ShowMessage('New High Score');
     end;

   Client_form.show;
   Quiz_Form.hide;
 end;


end;
/////////////////////////NEXT///////////////

procedure TQuiz_Form.btnAClick(Sender: TObject);
begin
CheckAnswer(button1);
end;

procedure TQuiz_Form.btnBClick(Sender: TObject);
begin
CheckAnswer(button2);
end;

procedure TQuiz_Form.btnCClick(Sender: TObject);
begin
CheckAnswer(button3);
end;

procedure TQuiz_Form.btnDClick(Sender: TObject);
begin
CheckAnswer(button4);
end;

function TQuiz_Form.HighScore(game: string; score: integer): boolean;
var
tempName : string;
tempScore : integer;
begin
////////////////
result := false;
////////////////
///////////////////

 Dmod.TableHighScore.First;

    while NOT Dmod.TableHighScore.Eof  do
    begin //while

     if Dmod.TableHighScore['Quiz'] = game then
        break;

        Dmod.TableHighScore.Next;
    end; //while
      if Dmod.TableHighScore.Eof then
      begin  //if
      MessageDlg('Something is wrong, please contact the administrator.',mtError,[mbCancel],0);
      exit;
      end;
    if Dmod.TableHighScore['User3 score'] < score then
    begin
      result := true;
      dmod.TableHighScore.edit;
      Dmod.TableHighScore['User3 score'] := score;
      Dmod.TableHighScore['User3'] := Login_Form.sName;
      if Dmod.TableHighScore['User3 score'] > Dmod.TableHighScore['User2 score'] then
      begin
        tempScore := Dmod.TableHighScore['User3 score'];
        tempName := Dmod.TableHighScore['User3'];

        Dmod.TableHighScore['User3 score'] := Dmod.TableHighScore['User2 score'];
        Dmod.TableHighScore['User3'] := Dmod.TableHighScore['User2'];

        Dmod.TableHighScore['User2 score'] := tempScore;
        Dmod.TableHighScore['User2'] := tempName;

          if Dmod.TableHighScore['User2 score'] > Dmod.TableHighScore['User1 score'] then
          begin
            ////////////////////////////////////
            tempScore := Dmod.TableHighScore['User2 score'];
            tempName := Dmod.TableHighScore['User2'];

            Dmod.TableHighScore['User2 score'] := Dmod.TableHighScore['User1 score'];
            Dmod.TableHighScore['User2'] := Dmod.TableHighScore['User1'];

            Dmod.TableHighScore['User1 score'] := tempScore;
            Dmod.TableHighScore['User1'] := tempName;
            ////////////////////////////////////
          end;

      end;
     Dmod.TableHighscore.Post;
    end;


//////////////// login_Form.sName
////////////////
end;

end.

