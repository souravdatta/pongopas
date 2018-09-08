unit Paddle;

{$mode objfpc}{$H+}{$M+}

interface

uses
  Classes, SysUtils, Rect;

const
  C_WIDTH = 80;
  C_HEIGHT = 10;
  C_MOVEBY = 6;

type
  TPaddle = class
  public
    Px, Py: Real;

    procedure Init(X, Y: Real);
    procedure Move(D: Integer; Width: Integer);
    function GetRect: TRect;
  end;

implementation

procedure TPaddle.Init(X, Y: Real);
begin
  Px := X;
  Py := Y;
end;

procedure TPaddle.Move(D: Integer; Width: Integer);
begin
  if (Px >= 0) and (Px + C_WIDTH <= Width) then
    if D = 1 then
      Px := Px + C_MOVEBY
    else
      Px := Px - C_MOVEBY;

  if Px < 0 then
    Px := 0;

  if Px > (Width - C_WIDTH) then
    Px := Width - C_WIDTH;
end;

function TPaddle.GetRect: TRect;
var
  R: TRect;
begin
  with R do
  begin
    X1 := Px;
    Y1 := Py;
    X2 := Px + C_WIDTH;
    Y2 := Py + C_HEIGHT;
  end;
  GetRect := R;
end;

end.
