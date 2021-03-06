unit frmMain;

{$mode objfpc}{$H+}

interface

uses
  RFB, Classes, SysUtils, Forms, Dialogs, StdCtrls, ExtCtrls, LCLIntf;

type

  { TfrMain }

  TfrMain = class(TForm)
    btQuery: TButton;
    edDocument: TEdit;
    imCaptcha: TImage;
    lbDocument: TLabel;
    edCaptcha: TEdit;
    lbCaptcha: TLabel;
    btGetCaptcha: TButton;
    procedure edCaptchaKeyPress(Sender: TObject; var Key: char);
    procedure edDocumentKeyPress(Sender: TObject; var Key: char);
    procedure btQueryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btGetCaptchaClick(Sender: TObject);
  private
    FRFB: TRFB;
  end;

var
  frMain: TfrMain;

implementation

{$R *.lfm}

procedure TfrMain.FormCreate(Sender: TObject);
begin
  FRFB := TRFB.Create;
end;

procedure TfrMain.FormDestroy(Sender: TObject);
begin
  FRFB.Free;
end;

procedure TfrMain.btGetCaptchaClick(Sender: TObject);
var
  VImage: TStream = nil;
begin
  FRFB.Prepare;
  try
    FRFB.GetCaptcha(VImage);
    imCaptcha.Picture.Clear;
    imCaptcha.Picture.LoadFromStream(VImage);
  finally
    FreeAndNil(VImage);
  end;
end;

procedure TfrMain.edDocumentKeyPress(Sender: TObject; var Key: char);
begin
  edCaptchaKeyPress(Sender, Key);
  if Key in [' ', '.', '/', '-', 'a'..'z', 'A'..'Z'] then
    Key := #0;
end;

procedure TfrMain.btQueryClick(Sender: TObject);
begin
  if Trim(edDocument.Text) = '' then
  begin
    ShowMessage(SEmptyDocumentError);
    edDocument.SetFocus;
    Exit;
  end;
  if Trim(edCaptcha.Text) = '' then
  begin
    ShowMessage(SEmptyCaptchaError);
    edCaptcha.SetFocus;
    Exit;
  end;
  FRFB.Captcha := edCaptcha.Text;
  FRFB.Document := edDocument.Text;
  FRFB.Query;
  ShowMessageFmt('Nome: %s' + LineEnding + 'Situação: %s' + LineEnding +
    'Documento: %s', [FRFB.PersonName, FRFB.PersonStatus, FRFB.QueriedDocument]);
  edDocument.Clear;
  btGetCaptcha.SetFocus;
  edCaptcha.Clear;
  imCaptcha.Picture.Clear;
end;

procedure TfrMain.edCaptchaKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
  begin
    btQueryClick(Sender);
    Key := #0;
  end;
end;

procedure TfrMain.FormShow(Sender: TObject);
begin
  btGetCaptchaClick(Sender);
end;

end.

