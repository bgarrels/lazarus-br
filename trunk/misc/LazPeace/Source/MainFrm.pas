unit MainFrm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Dialogs, ExtCtrls, Buttons, ActnList,
  StdCtrls, Menus, ComCtrls, ZConnection, ZDataset, DB, LCLType, StrUtils,
  Graphics, LCLIntf, LCLProc, XMLPropStorage;

type

  { TMainForm }

  TMainForm = class(TForm)
    AboutAction: TAction;
    CloseImage: TImage;
    StatusLabel: TLabel;
    OptionZQueryfrommail: TStringField;
    OptionZQueryprintastxt: TStringField;
    OptionZQueryrandommessage: TStringField;
    OptionZQuerysendmsgtoemail: TStringField;
    OptionZQueryshiftctrlf: TStringField;
    OptionZQuerysmtphost: TStringField;
    OptionZQuerysmtppassword: TStringField;
    OptionZQuerysmtpport: TStringField;
    OptionZQuerysmtpssl: TStringField;
    OptionZQuerysmtptls: TStringField;
    OptionZQuerysmtpuser: TStringField;
    OptionZQuerystartingotasluz: TStringField;
    OptionZQuerystartwithos: TStringField;
    OptionZQuerytimermessage: TStringField;
    OptionZQuerytomail: TStringField;
    MoveTimer: TTimer;
    RunOnceMonitorTimer: TTimer;
    TitlePanel: TPanel;
    SendToEmailAction: TAction;
    FavoriteZQueryabbreviation: TStringField;
    FavoriteZQuerybook: TLongintField;
    FavoriteZQueryoid: TLongintField;
    FavoriteZQueryoidmessage: TLongintField;
    ExitTrayMenuItem: TMenuItem;
    N5: TMenuItem;
    RestoreTrayMenuItem: TMenuItem;
    MessageZReadOnlyQuerymensagem: TMemoField;
    MessageZReadOnlyQueryoid: TLongintField;
    OptionZQuery: TZQuery;
    SendToEmailButton: TBitBtn;
    TrayIconPopupMenu: TPopupMenu;
    PrintAction: TAction;
    DeleteFilterAction: TAction;
    AboutMenuItem: TMenuItem;
    ExitMenuItem: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    PrintMenuItem: TMenuItem;
    N2: TMenuItem;
    OptionMenuItem: TMenuItem;
    MessageMemo: TMemo;
    OptinAction: TAction;
    FavoriteAction: TAction;
    FindAction: TAction;
    DeleteFavoriteMenuItem: TMenuItem;
    FindMenuItem: TMenuItem;
    DeleteFilterMenuItem: TMenuItem;
    N1: TMenuItem;
    LeftImage: TImage;
    ClientImage: TImage;
    NextAction: TAction;
    LastAction: TAction;
    NumberEdit: TEdit;
    NumberLabel: TLabel;
    FavoritePopupMenu: TPopupMenu;
    LeftBarPopupMenu: TPopupMenu;
    PriorAction: TAction;
    FirstAction: TAction;
    RandomizeAction: TAction;
    MainActionList: TActionList;
    AboutBitBtn: TBitBtn;
    ExitBitBtn: TBitBtn;
    ExitAction: TAction;
    OptionBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    FindBitBtn: TBitBtn;
    MainImageList: TImageList;
    LeftPanel: TPanel;
    ClientPanel: TPanel;
    BookRadioGroup: TRadioGroup;
    MainZConnection: TZConnection;
    MessageZReadOnlyQuery: TZReadOnlyQuery;
    MessageTimer: TTimer;
    NavigatorToolBar: TToolBar;
    FirstToolButton: TToolButton;
    S5: TToolButton;
    FavoriteToolButton: TToolButton;
    S1: TToolButton;
    PriorToolButton: TToolButton;
    S2: TToolButton;
    NextToolButton: TToolButton;
    S3: TToolButton;
    LastToolButton: TToolButton;
    S4: TToolButton;
    RandomizeToolButton: TToolButton;
    FavoriteZQuery: TZQuery;
    TrayIcon: TTrayIcon;
    MainXMLPropStorage: TXMLPropStorage;
    procedure AboutActionExecute(Sender: TObject);
    procedure DeleteFavoriteMenuItemClick(Sender: TObject);
    procedure DeleteFilterActionExecute(Sender: TObject);
    procedure ExitActionExecute(Sender: TObject);
    procedure FavoriteActionExecute(Sender: TObject);
    procedure FavoriteZQueryabbreviationGetText(Sender: TField;
      var aText: string; DisplayText: Boolean);
    procedure FavoriteZQuerybookGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
    procedure FavoriteZQueryPostError(DataSet: TDataSet; E: EDatabaseError;
      var DataAction: TDataAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
    procedure CloseImageClick(Sender: TObject);
    procedure MessageZReadOnlyQueryAfterScroll(DataSet: TDataSet);
    procedure NumberEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NumberEditUTF8KeyPress(Sender: TObject; var UTF8Key: TUTF8Char);
    procedure OptinActionExecute(Sender: TObject);
    procedure BookRadioGroupClick(Sender: TObject);
    procedure FindActionExecute(Sender: TObject);
    procedure FirstActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LastActionExecute(Sender: TObject);
    procedure NextActionExecute(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
    procedure PriorActionExecute(Sender: TObject);
    procedure RandomizeActionExecute(Sender: TObject);
    procedure RunOnceMonitorTimerTimer(Sender: TObject);
    procedure SendToEmailActionExecute(Sender: TObject);
    procedure MessageTimerTimer(Sender: TObject);
    procedure MoveTimerTimer(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
  private
    FFromMail: string;
    FPrintAsTXT: Boolean;
    FSendMsgToEmail: Boolean;
    FToMail: string;
    FRandomMessage: Boolean;
    FShiftCtrlF: Boolean;
    FSMTPHost: string;
    FSMTPPassword: string;
    FSMTPPort: Integer;
    FSMTPSSL: Boolean;
    FSMTPTLS: Boolean;
    FSMTPUser: string;
    FStartWithOS: Boolean;
    FStartInGotasLuz: Boolean;
    FTimerMessageInterval: Integer;
    FCanClose: Boolean;
    FCanRandomizeMessage: Boolean;
    FStatus: string;
    FThreadID: TThreadID;
    XPos, YPos, NewLeft, NewTop: Integer;
    Moving: Boolean;
  protected
    procedure DoStart;
    procedure DoStop;
  public
    procedure Initialize; virtual;
    procedure LoadOption; virtual;
    procedure SaveOption; virtual;
    procedure RandomizeMessage;
    procedure AddFavorite;
    procedure LoadFavorite;
    procedure AddPopupFavorite(const ABook, AOidMessage: Integer;
      const AAbbreviation: string);
    procedure ClearPopupFavorite;
    procedure PopupFavoriteClick(Sender: TObject);
    procedure ShowIconInTray;
    procedure RestoreApp;
    function GetHTMLMessage: string;
    procedure Send;
    procedure OnStart;
    procedure OnStop(const AStatus: string);
    procedure HintClick(Sender: TObject);
    property ShiftCtrlF: Boolean read FShiftCtrlF write FShiftCtrlF;
    property StartWithOS: Boolean read FStartWithOS write FStartWithOS;
    property RandomMessage: Boolean read FRandomMessage write FRandomMessage;
    property StartInGotasLuz: Boolean read FStartInGotasLuz write FStartInGotasLuz;
    property TimerMessageInterval: Integer read FTimerMessageInterval write FTimerMessageInterval;
    property SMTPUser: string read FSMTPUser write FSMTPUser;
    property SMTPPassword: string read FSMTPPassword write FSMTPPassword;
    property SMTPHost: string read FSMTPHost write FSMTPHost;
    property SMTPPort: Integer read FSMTPPort write FSMTPPort;
    property SMTPSSL: Boolean read FSMTPSSL write FSMTPSSL;
    property SMTPTLS: Boolean read FSMTPTLS write FSMTPTLS;
    property FromMail: string read FFromMail write FFromMail;
    property ToMail: string read FToMail write FToMail;
    property SendMsgToEmail: Boolean read FSendMsgToEmail write FSendMsgToEmail;
    property PrintAsTXT: Boolean read FPrintAsTXT write FPrintAsTXT;
  end;

const
  CConfFile = {$I %localappdata%} + '\LazPeace 1.0\lazpeace.conf';
  CLazPeaceAppAtom = 'lazpeace';

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

uses
  LSForms, LSUtils, LSSMTPSend, LSNotifierOS, FindFrm, OptionFrm, FavoriteFrm;

var
  _PrintHTMLFileTmp: string = '';
  _PrintTXTFileTmp: string = '';
  _FirstStart: Boolean = True;

procedure _Send;
begin
  with MainForm do
  begin
    TThread.Synchronize(nil, @DoStart);
    FStatus := LSSendMail(FFromMail, FToMail, Utf8ToAnsi(Copy(MessageMemo.Text,
      1, 17)) + '...', GetHTMLMessage, 'unknow', '', '', FSMTPUser,
      FSMTPPassword, FSMTPHost, IntToStr(FSMTPPort), nil, False, FSMTPSSL,
      FSMTPTLS, mtHTML);
    TThread.Synchronize(nil, @DoStop);
  end;
end;

{ TMainForm }

procedure TMainForm.BookRadioGroupClick(Sender: TObject);
const
  CPreSelect = 'select * from %s order by oid;';
begin
  MessageZReadOnlyQuery.Close;
  case BookRadioGroup.ItemIndex of
    0: MessageZReadOnlyQuery.SQL.Text := Format(CPreSelect, ['minutos']);
    1: MessageZReadOnlyQuery.SQL.Text := Format(CPreSelect, ['gotas']);
  end;
  MessageZReadOnlyQuery.Open;
  if FRandomMessage then
    RandomizeMessage;
end;

procedure TMainForm.DeleteFilterActionExecute(Sender: TObject);
begin
  BookRadioGroupClick(Sender);
end;

procedure TMainForm.ExitActionExecute(Sender: TObject);
begin
  FCanClose := True;
  Close;
end;

procedure TMainForm.DeleteFavoriteMenuItemClick(Sender: TObject);
begin
  TFavoriteForm.Execute;
end;

procedure TMainForm.AboutActionExecute(Sender: TObject);
begin
  ShowMessage('LazPeace 1.0 - Lindas mensagens de paz para refletir' +
    sLineBreak + sLineBreak + 'Autor:' + sLineBreak +
    'Silvio Clécio - http://silvioprog.com.br' + sLineBreak + sLineBreak +
    'Atualizações:' + sLineBreak + 'http://code.google.com/p/lazarus-br' +
    sLineBreak + sLineBreak + '<Este produto é totalmente gratuito, não' +
    ' podendo ser comercializado.>');
end;

procedure TMainForm.FavoriteActionExecute(Sender: TObject);
begin
  AddFavorite;
end;

procedure TMainForm.FavoriteZQueryabbreviationGetText(Sender: TField;
  var aText: string; DisplayText: Boolean);
begin
  aText := Sender.AsString + '...';
end;

procedure TMainForm.FavoriteZQuerybookGetText(Sender: TField;
  var aText: string; DisplayText: Boolean);
begin
  case Sender.AsInteger of
    0: aText := 'Minutos';
    1: aText := 'Gotas';
  end;
end;

procedure TMainForm.FavoriteZQueryPostError(DataSet: TDataSet;
  E: EDatabaseError; var DataAction: TDataAction);
begin
  if Pos('is not unique', LowerCase(E.Message)) > 0 then
  begin
    DataAction := daAbort;
    ShowMessage('Favorita duplicada.');
  end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CanClose := FCanClose;
  if not CanClose then
    Application.Minimize;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if FThreadID <> 0 then
    SuspendThread(FThreadID);
end;

procedure TMainForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Y <= 22) then
  begin
    XPos := X;
    YPos := Y;
    Moving := True;
  end;
end;

procedure TMainForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Moving then
  begin
    Canvas.Brush.Style := bsDiagCross;
    Canvas.Brush.Color := clBlack;
    Canvas.Rectangle(ClientRect);
    MoveTimer.Enabled := True;
    NewLeft := (Left + X) - XPos;
    NewTop := (Top + Y) - YPos;
  end;
end;

procedure TMainForm.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Moving := False;
  Repaint;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := clTeal;
  Canvas.FillRect(ClientRect);
end;

procedure TMainForm.FormWindowStateChange(Sender: TObject);
begin
  if WindowState = wsMinimized then
    Hide;
end;

procedure TMainForm.CloseImageClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.MessageZReadOnlyQueryAfterScroll(DataSet: TDataSet);
var
  S: string;
  I: Integer;
begin
  NumberEdit.Text := MessageZReadOnlyQuery.FieldByName('oid').AsString;
  S := MessageZReadOnlyQuery.FieldByName('mensagem').AsString;
  I := Pos(' ', S);
  MessageMemo.Text := UTF8UpperCase(Copy(S, 1, I - 1)) +
    Copy(S, I, Length(S) - I) + '.';
end;

procedure TMainForm.NumberEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    MessageZReadOnlyQuery.RecNo := StrToIntDef(NumberEdit.Text, 1);
  end;
end;

procedure TMainForm.NumberEditUTF8KeyPress(Sender: TObject;
  var UTF8Key: TUTF8Char);
begin
  if not (UTF8Key[1] in ['0'..'9']) then
    UTF8Key := #0;
end;

procedure TMainForm.OptinActionExecute(Sender: TObject);
begin
  TOptionForm.Execute;
end;

procedure TMainForm.FindActionExecute(Sender: TObject);
begin
  TFindForm.Execute;
end;

procedure TMainForm.FirstActionExecute(Sender: TObject);
begin
  MessageZReadOnlyQuery.First;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  with MainZConnection do
  begin
    Database := ExtractFilePath(ParamStr(0)) + 'lazpeace.db3';
    Protocol := 'sqlite-3';
    Connect;
  end;
  Initialize;
end;

procedure TMainForm.LastActionExecute(Sender: TObject);
begin
  MessageZReadOnlyQuery.Last;
end;

procedure TMainForm.NextActionExecute(Sender: TObject);
begin
  MessageZReadOnlyQuery.Next;
end;

procedure TMainForm.PrintActionExecute(Sender: TObject);
var
  VStrTemp: TStringList;
begin
  if FPrintAsTXT then
  begin
    MessageMemo.Lines.SaveToFile(_PrintTXTFileTmp);
    OpenDocument(_PrintTXTFileTmp);
  end
  else
  begin
    VStrTemp := TStringList.Create;
    try
      VStrTemp.Text := GetHTMLMessage;
      VStrTemp.SaveToFile(_PrintHTMLFileTmp);
      OpenURL(_PrintHTMLFileTmp);
    finally
      VStrTemp.Free;
    end;
  end;
end;

procedure TMainForm.PriorActionExecute(Sender: TObject);
begin
  MessageZReadOnlyQuery.Prior;
end;

procedure TMainForm.RandomizeActionExecute(Sender: TObject);
begin
  RandomizeMessage;
end;

procedure TMainForm.RunOnceMonitorTimerTimer(Sender: TObject);
begin
  if LSGlobalFindAtom(CLazPeaceAppAtom) then
  begin
    LSGlobalDeleteAtom(CLazPeaceAppAtom);
    if not _FirstStart then
      RestoreApp;
    _FirstStart := False;
  end;
end;

procedure TMainForm.SendToEmailActionExecute(Sender: TObject);
begin
  if IsOpenSSLAvailable then
    Send
  else
    ShowMessage('Não foi possível encontrar as bobliotecas OpenSSL.');
end;

procedure TMainForm.MessageTimerTimer(Sender: TObject);
begin
  MessageTimer.Enabled := False;
  RandomizeMessage;
  TLSNotifierOS.Execute('LazPeace 1.0 (Clique para ler)',
    Copy(MessageMemo.Lines.Strings[0], 1, 50) + '...', Application.Icon,
    npBottomRight, 10000, ntRound, Color, 100, 0, CLeftGain, CTopGain,
    @HintClick);
  if FSendMsgToEmail and (FTimerMessageInterval > 30) then
    SendToEmailAction.Execute;
end;

procedure TMainForm.MoveTimerTimer(Sender: TObject);
begin
  Left := NewLeft;
  Top := NewTop;
  MoveTimer.Enabled := False;
end;

procedure TMainForm.TrayIconDblClick(Sender: TObject);
begin
  RestoreApp;
end;

procedure TMainForm.DoStart;
begin
  OnStart;
end;

procedure TMainForm.DoStop;
begin
  OnStop(FStatus);
end;

procedure TMainForm.Initialize;
begin
  if not FileExists(CConfFile) then
  begin
    Left := (LSGetWorkAreaRect(Handle).Right - Width) - 10;
    Top := (LSGetWorkAreaRect(Handle).Bottom - Height) - 10;
  end
  else
    Application.ShowMainForm := False;
  ShowIconInTray;
{$IFDEF UNIX}
  NumberEdit.BorderStyle := bsNone;
{$ENDIF}
  MainXMLPropStorage.FileName := CConfFile;
  FCanClose := False;
  FCanRandomizeMessage := True;
  LoadOption;
  LoadFavorite;
  if FStartInGotasLuz then
    BookRadioGroup.ItemIndex := 1;
  BookRadioGroupClick(Self);
end;

procedure TMainForm.LoadOption;
begin
  if MainZConnection.Connected then
  begin
    OptionZQuery.Open;
    FShiftCtrlF := OptionZQuery.FieldByName('shiftctrlf').AsBoolean;
    FStartWithOS := OptionZQuery.FieldByName('startwithos').AsBoolean;
    FRandomMessage := OptionZQuery.FieldByName('randommessage').AsBoolean;
    FStartInGotasLuz := OptionZQuery.FieldByName('startingotasluz').AsBoolean;
    FTimerMessageInterval := StrToIntDef(OptionZQuery.FieldByName(
      'timermessage').AsString, 60);
    MessageTimer.Enabled := FTimerMessageInterval > 0;
    MessageTimer.Interval := (FTimerMessageInterval * 60) * 1000;
    FSMTPUser := OptionZQuery.FieldByName('smtpuser').AsString;
    FSMTPPassword := OptionZQuery.FieldByName('smtppassword').AsString;
    FSMTPHost := OptionZQuery.FieldByName('smtphost').AsString;
    FSMTPPort := OptionZQuery.FieldByName('smtpport').AsInteger;
    FSMTPSSL := OptionZQuery.FieldByName('smtpssl').AsBoolean;
    FSMTPTLS := OptionZQuery.FieldByName('smtptls').AsBoolean;
    FFromMail := OptionZQuery.FieldByName('frommail').AsString;
    FToMail := OptionZQuery.FieldByName('tomail').AsString;
    FSendMsgToEmail := OptionZQuery.FieldByName('sendmsgtoemail').AsBoolean;
    FPrintAsTXT := OptionZQuery.FieldByName('printastxt').AsBoolean;
    OptionZQuery.Close;
  end;
end;

procedure TMainForm.SaveOption;
begin
  OptionZQuery.Open;
  OptionZQuery.Edit;
  OptionZQuery.FieldByName('shiftctrlf').AsBoolean := FShiftCtrlF;
  OptionZQuery.FieldByName('startwithos').AsBoolean := FStartWithOS;
  OptionZQuery.FieldByName('randommessage').AsBoolean := FRandomMessage;
  OptionZQuery.FieldByName('startingotasluz').AsBoolean := FStartInGotasLuz;
  OptionZQuery.FieldByName('timermessage').AsInteger := FTimerMessageInterval;
  OptionZQuery.FieldByName('smtpuser').AsString := FSMTPUser;
  OptionZQuery.FieldByName('smtppassword').AsString := FSMTPPassword;
  OptionZQuery.FieldByName('smtphost').AsString := FSMTPHost;
  OptionZQuery.FieldByName('smtpport').AsInteger := FSMTPPort;
  OptionZQuery.FieldByName('smtpssl').AsBoolean := FSMTPSSL;
  OptionZQuery.FieldByName('smtptls').AsBoolean := FSMTPTLS;
  OptionZQuery.FieldByName('frommail').AsString := FFromMail;
  OptionZQuery.FieldByName('tomail').AsString := FToMail;
  OptionZQuery.FieldByName('sendmsgtoemail').AsBoolean := FSendMsgToEmail;
  OptionZQuery.FieldByName('printastxt').AsBoolean := FPrintAsTXT;
  OptionZQuery.Post;
  OptionZQuery.Close;
end;

procedure TMainForm.RandomizeMessage;
begin
  MessageZReadOnlyQuery.RecNo := Random(MessageZReadOnlyQuery.RecordCount);
end;

procedure TMainForm.AddFavorite;
var
  VOidMessage: Integer;
  VAbbreviation: string;
begin
  FavoriteZQuery.Open;
  FavoriteZQuery.Insert;
  VOidMessage := MessageZReadOnlyQuery.RecNo;
  VAbbreviation := Copy(MessageMemo.Text, 1, 50);
  FavoriteZQuery.FieldByName('book').AsInteger := BookRadioGroup.ItemIndex;
  FavoriteZQuery.FieldByName('oidmessage').AsInteger := VOidMessage;
  FavoriteZQuery.FieldByName('abbreviation').AsString := VAbbreviation;
  AddPopupFavorite(BookRadioGroup.ItemIndex, VOidMessage, VAbbreviation);
  FavoriteZQuery.Post;
  FavoriteZQuery.Close;
end;

procedure TMainForm.LoadFavorite;
begin
  FavoriteZQuery.Open;
  if FavoriteZQuery.IsEmpty then
    ClearPopupFavorite
  else
  begin
    FavoriteZQuery.First;
    while not FavoriteZQuery.EOF do
    begin
      AddPopupFavorite(FavoriteZQuery.FieldByName('book').AsInteger,
        FavoriteZQuery.FieldByName('oidmessage').AsInteger,
        FavoriteZQuery.FieldByName('abbreviation').AsString);
      FavoriteZQuery.Next;
    end;
  end;
  FavoriteZQuery.Close;
end;

procedure TMainForm.AddPopupFavorite(const ABook, AOidMessage: Integer;
  const AAbbreviation: string);
const
  CBookName: array [0..1] of string = ('Minutos', 'Gotas');
var
  VFavoriteMenuItem: TMenuItem;
begin
  if FavoritePopupMenu.Items.Count = 1 then
  begin
    VFavoriteMenuItem := TMenuItem.Create(FavoritePopupMenu);
    VFavoriteMenuItem.Caption := '-';
    FavoritePopupMenu.Items.Add(VFavoriteMenuItem);
  end;
  VFavoriteMenuItem := TMenuItem.Create(FavoritePopupMenu);
  VFavoriteMenuItem.Caption := CBookName[ABook] + ', ' + IntToStr(AOidMessage) +
    ': ' + AAbbreviation + ' ...';
  VFavoriteMenuItem.Tag := AOidMessage;
  VFavoriteMenuItem.OnClick := @PopupFavoriteClick;
  FavoritePopupMenu.Items.Add(VFavoriteMenuItem);
end;

procedure TMainForm.ClearPopupFavorite;
var
  VDefaultFavoriteMenuItem: TMenuItem;
begin
  FavoritePopupMenu.Items.Clear;
  VDefaultFavoriteMenuItem := TMenuItem.Create(FavoritePopupMenu);
  VDefaultFavoriteMenuItem.Caption := 'Excluir favorita';
  VDefaultFavoriteMenuItem.OnClick := @DeleteFavoriteMenuItemClick;
  FavoritePopupMenu.Items.Add(VDefaultFavoriteMenuItem);
end;

procedure TMainForm.PopupFavoriteClick(Sender: TObject);
begin
  if Pos('Minutos', TMenuItem(Sender).Caption) <> 0 then
    BookRadioGroup.ItemIndex := 0
  else
    BookRadioGroup.ItemIndex := 1;
  MessageZReadOnlyQuery.RecNo := TMenuItem(Sender).Tag;
end;

procedure TMainForm.ShowIconInTray;
begin
  TrayIcon.Icon.Assign(Application.Icon);
  TrayIcon.Visible := True;
  FCanRandomizeMessage := True;
end;

procedure TMainForm.RestoreApp;
begin
  WindowState := wsNormal;
  Show;
  BringToFront;
  FCanRandomizeMessage := False;
end;

function TMainForm.GetHTMLMessage: string;
begin
  Result := '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' + sLineBreak +
           '<html xmlns="http://www.w3.org/1999/xhtml">' + sLineBreak +
           '<head>' + sLineBreak +
           '  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>' + sLineBreak +
           '    <title>LazPeace 1.0</title>' + sLineBreak +
           '</head>' + sLineBreak +
           '  <body><b><i>' + StringsReplace(
             MessageZReadOnlyQuery.FieldByName('mensagem').AsString, [sLineBreak],
             ['<br/>'], [rfReplaceAll]) + '</i></b><br /><br /><br /><hr width=100 align="right" />' +
             '<p align=right><i><font size=-2>LazPeace 1.0</font></i></p></body>' + sLineBreak +
           '</html>';
end;

procedure TMainForm.Send;
begin
   FThreadID := BeginThread(TThreadFunc(@_Send));
end;

procedure TMainForm.OnStart;
begin
  StatusLabel.Show;
  SendToEmailAction.Enabled := False;
end;

procedure TMainForm.OnStop(const AStatus: string);
begin
  SendToEmailAction.Enabled := True;
  StatusLabel.Hide;
  ShowMessage(AStatus);
end;

procedure TMainForm.HintClick(Sender: TObject);
begin
  TLSNotifierOS.CloseHint;
  RestoreApp;
end;

initialization
  _PrintHTMLFileTmp := ExtractFilePath(ParamStr(0)) + 'lazpeaceprint.html';
  _PrintTXTFileTmp := ExtractFilePath(ParamStr(0)) + 'lazpeaceprint.txt';
  Randomize;

finalization
  if FileExists(_PrintHTMLFileTmp) then
    DeleteFile(_PrintHTMLFileTmp);
  if FileExists(_PrintTXTFileTmp) then
    DeleteFile(_PrintTXTFileTmp);

end.

