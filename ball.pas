unit Ball;

{$mode objfpc}{$H+}{$M+}

interface

uses
  Classes, SysUtils, Rect;

const
  C_INCR = 2;
  C_RADIUS = 10;

type
  TBall = class
  public
    CurX, CurY: real;
    IncrX, IncrY: real;
    Rad: integer;
    procedure Init(X, Y: real);
<<<<<<< HEAD
    procedure Update(Width, Height: integer; PaddleRect: TRect);
    function GetRect: TRect;
    function MissedCollison(PaddleRect: TRect): boolean;
=======
    procedure Update(Width, Height: integer; PaddleRect, UPaddleRect: TRect);
    function GetRect: TRect;
    function MissedCollison(PaddleRect, UPaddleRect: TRect): boolean;
>>>>>>> 2 paddles
  end;

implementation

procedure TBall.Init(X, Y: real);
begin
  CurX := X;
  CurY := Y;
  IncrX := C_INCR;
  IncrY := C_INCR;
  Rad := C_RADIUS;
end;

<<<<<<< HEAD
procedure TBall.Update(Width, Height: integer; PaddleRect: TRect);
=======
procedure TBall.Update(Width, Height: integer; PaddleRect, UPaddleRect: TRect);
>>>>>>> 2 paddles
begin
  if (CurX - C_RADIUS < 0) or (Curx + C_RADIUS > Width) then
    IncrX := -1.0 * IncrX;
  if (CurY - C_RADIUS < 0) or (CurY + C_RADIUS > Height) then
    IncrY := -1.0 * IncrY;

  if (CurY + C_RADIUS >= PaddleRect.Y1) and (CurX >= PaddleRect.X1) and
    (CurX <= PaddleRect.X2) then
    IncrY := -1.0 * IncrY;

<<<<<<< HEAD
=======
  if (CurY - C_RADIUS <= UPaddleRect.Y2) and (CurX >= UPaddleRect.X1) and
    (CurX <= UPaddleRect.X2) then
    IncrY := -1.0 * IncrY;

>>>>>>> 2 paddles
  CurX := CurX + IncrX;
  CurY := CurY + IncrY;
end;

function TBall.GetRect: TRect;
var
  Rect: TRect;
begin
  Rect := TRect.Create;
  with Rect do
  begin
    X1 := CurX - Rad;
    Y1 := CurY - Rad;
    X2 := CurX + Rad;
    Y2 := CurY + Rad;
  end;

  GetRect := Rect;
end;

<<<<<<< HEAD
function TBall.MissedCollison(PaddleRect: TRect): boolean;
=======
function TBall.MissedCollison(PaddleRect, UPaddleRect: TRect): boolean;
>>>>>>> 2 paddles
begin
  if CurY + C_RADIUS > PaddleRect.Y1 + 1 then
    MissedCollison := True
  else
<<<<<<< HEAD
=======
  if CurY - C_RADIUS < UPaddleRect.Y2 - 1 then
    MissedCollison := True
  else
>>>>>>> 2 paddles
    MissedCollison := False;
end;

end.
