object Home_Form: THome_Form
  Left = 1273
  Top = 761
  BorderStyle = bsNone
  Caption = 'Home_Form'
  ClientHeight = 258
  ClientWidth = 600
  Color = clOlive
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblPOPQuiz: TLabel
    Left = 184
    Top = 16
    Width = 249
    Height = 77
    Caption = 'POPQuiz'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -64
    Font.Name = 'AR DARLING'
    Font.Style = []
    ParentFont = False
  end
  object lblLucky: TLabel
    Left = 176
    Top = 96
    Width = 261
    Height = 33
    Caption = 'Are you feeling lucky?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -27
    Font.Name = 'AR DARLING'
    Font.Style = []
    ParentFont = False
  end
  object lblTheme: TLabel
    Left = 536
    Top = 208
    Width = 54
    Height = 18
    Caption = 'Theme:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnLogin: TColorButton
    Left = 128
    Top = 144
    Width = 113
    Height = 57
    Caption = 'Login'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnLoginClick
    BackColor = clOlive
    ForeColor = clBackground
    HoverColor = clTeal
  end
  object btnAdmin: TColorButton
    Left = 248
    Top = 144
    Width = 113
    Height = 57
    Caption = 'Admin'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnAdminClick
    BackColor = clOlive
    HoverColor = clTeal
  end
  object btnNew: TColorButton
    Left = 368
    Top = 144
    Width = 113
    Height = 57
    Caption = 'Sign Up'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnNewClick
    BackColor = clOlive
    HoverColor = clTeal
  end
  object btnClose: TBitBtn
    Left = 568
    Top = 0
    Width = 33
    Height = 25
    Caption = ' '
    TabOrder = 3
    OnClick = btnCloseClick
    Kind = bkAbort
  end
  object btnOlive: TColorButton
    Left = 568
    Top = 232
    Width = 27
    Height = 25
    TabOrder = 4
    OnClick = btnOliveClick
    BackColor = clOlive
    HoverColor = clTeal
  end
  object btnBlack: TColorButton
    Left = 533
    Top = 233
    Width = 27
    Height = 25
    TabOrder = 5
    OnClick = btnBlackClick
    BackColor = clBlack
    HoverColor = clTeal
  end
end
