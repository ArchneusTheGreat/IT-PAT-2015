unit Login_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ColorButton, jpeg, ExtCtrls, Datamodule_U, Buttons;

type
  TLogin_Form = class(TForm)
    lblPOPQuiz: TLabel;
    lblName: TLabel;
    edtName: TEdit;
    lblPass: TLabel;
    edtPassword: TEdit;
    lblHand: TLabel;
    btnLogin: TColorButton;
    btnForgot: TColorButton;
    imgMan: TImage;
    imgWoman: TImage;
    btnClose: TBitBtn;
    procedure btnLoginClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnForgotClick(Sender: TObject);
  private
    { Private declarations }
  public
  sName, sPassword : string;
    { Public declarations }
  end;

var
  Login_Form: TLogin_Form;

implementation
uses Quiz_U, Home_U, New_U, Client_U, Admin_U;

{$R *.dfm}

procedure TLogin_Form.btnLoginClick(Sender: TObject);
begin  //pro
sName := edtName.text;
sPassword := edtPassword.text;
edtPassword.Text := '';
if Home_Form.bAdmin = false then
    begin
      Dmod.TableUser.First;
    while NOT Dmod.TableUser.Eof  do
    begin //while

     if Dmod.TableUser['Username'] = sName then
        break;

        Dmod.TableUser.Next;
    end; //while
      if Dmod.TableUser.Eof then
      begin  //if
      MessageDlg('Invallid Login, Please check username',mtError,[mbCancel],0);
      edtName.Color := clred;
      exit;
      end;   //if

      if NOT (Dmod.TableUser['Password'] = sPassword) then
      begin  //if pass
      MessageDlg('Invallid Login, Please check password',mtError,[mbCancel],0);
      edtPassword.Color := clred;
      edtName.Color := clteal;
      exit;  //if pass
      end;
      edtName.Color := clteal;
      edtPassword.Color := clteal;
      Client_Form.Show;
      Login_Form.Hide;
end
else
begin
      Dmod.TableAdmin.First;
    while NOT Dmod.TableAdmin.Eof  do
    begin //while

     if Dmod.TableAdmin['Username'] = sName then
        break;

        Dmod.TableAdmin.Next;
    end; //while
      if Dmod.TableAdmin.Eof then
      begin  //if
      MessageDlg('Invallid Login, Please check username',mtError,[mbCancel],0);
      exit;
      edtName.Color := clred;
      end;   //if

      if NOT (Dmod.TableAdmin['Password'] = sPassword) then
      begin  //if pass
      MessageDlg('Invallid Login, Please check password',mtError,[mbCancel],0);
      exit;
      edtPassword.Color := clred;
      edtName.Color := clteal;
      end; //if pass
      edtName.Color := clteal;
      edtPassword.Color := clteal;
Admin_Form.Show;
Login_Form.Hide;
end;


end; //pro

procedure TLogin_Form.btnCloseClick(Sender: TObject);
begin
  Login_Form.Hide;
  Home_Form.Show;
end;

procedure TLogin_Form.FormCreate(Sender: TObject);
begin
  Login_Form.Left := round((screen.WorkAreaWidth -600)/2);
  Login_Form.Top := round((screen.WorkAreaHeight -350)/2);
end;

procedure TLogin_Form.btnForgotClick(Sender: TObject);
begin
  sName := edtName.text;

if Home_Form.bAdmin = false then
begin
  Dmod.TableUser.First;
  while NOT Dmod.TableUser.Eof  do
  begin //while

     if Dmod.TableUser['Username'] = sName then
      break;

     Dmod.TableUser.Next;
  end; //while
   if Dmod.TableUser.Eof then
   begin  //if
    MessageDlg('Invallid Login, Please check username',mtError,[mbCancel],0);
    exit;
   end;   //if
   MessageDlg('Hint: ' + Dmod.TableUser['Hint'],mtInformation,[mbOK],0);
end
else
begin
  Dmod.TableAdmin.First;
  while NOT Dmod.TableAdmin.Eof  do
  begin //while

     if Dmod.TableAdmin['Username'] = sName then
      break;

     Dmod.TableAdmin.Next;
  end; //while
   if Dmod.TableAdmin.Eof then
   begin  //if
    MessageDlg('Invallid Login, Please check username',mtError,[mbCancel],0);
    exit;
   end;   //if
   MessageDlg('Hint: ' + Dmod.TableAdmin['Hint'],mtInformation,[mbOK],0);
end;

end;

end.
