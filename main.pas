unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Ball, Paddle, Math, Rect, LCLType;

type

  { TForm1 }

  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    Ball: TBall;
    Paddle: TPaddle;
    UPaddle: TPaddle;
    procedure Close(Sender: TObject; var CloseAction: TCloseAction);
    procedure Draw(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OnKeyPress(Sender: TObject; var Key: Char);
    procedure Tick(Sender: TObject);
  private
    procedure InitObjects;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Tick(Sender: TObject);
begin
  Ball.Update(Width, Height, Paddle.GetRect, UPaddle.GetRect);
  PaintBox1.Invalidate;

  if Ball.MissedCollison(Paddle.GetRect, UPaddle.GetRect) then
    Timer1.Enabled := False;
end;

procedure TForm1.Draw(Sender: TObject);
var
  R1, R2, R3: TRect;
begin
  R1 := Ball.GetRect;
  R2 := Paddle.GetRect;
  R3 := UPaddle.GetRect;
  with PaintBox1.Canvas do
  begin
    Brush.Color := clBlack;
    FillRect(0, 0, Width, Height);
    Brush.Color := clWhite;
    Pen.Color := clWhite;
    Pen.Style := psDash;
    Line(0, Floor(Height / 2), Width, Floor(Height / 2));
    Pen.Style := psSolid;
    Ellipse(Floor(R1.X1),
      Floor(R1.Y1),
      Floor(R1.X2),
      Floor(R1.Y2));
    FillRect(Floor(R2.X1),
      Floor(R2.Y1),
      Floor(R2.X2),
      Floor(R2.Y2));
    FillRect(Floor(R3.X1),
      Floor(R3.Y1),
      Floor(R3.X2),
      Floor(R3.Y2));
  end;
end;

procedure TForm1.Close(Sender: TObject; var CloseAction: TCloseAction);
begin
  Ball.Destroy;
  Paddle.Destroy;
  UPaddle.Destroy;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Ball := TBall.Create;
  Paddle := TPaddle.Create;
  UPaddle := TPaddle.Create;
  InitObjects;
  Form1.KeyPreview := True;
end;

procedure TForm1.OnKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = 'r' then
    InitObjects;
  if Key = 'a' then
    Paddle.Move(2, Width);
  if Key = 'd' then
    Paddle.Move(1, Width);
  if Key = 'j' then
    UPaddle.Move(2, Width);
  if Key = 'l' then
    UPaddle.Move(1, Width);
end;

procedure TForm1.InitObjects;
begin
  Ball.Init(Random(Width), Random(Floor(Height / 2)));
  Paddle.Init(Width / 2, Height - C_HEIGHT);
  UPaddle.Init(Width / 2, 0);

  if Timer1.Enabled = False then
    Timer1.Enabled := True;
end;

end.
