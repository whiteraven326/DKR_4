uses graphABC;
function funkciya(x:real):real;
begin
funkciya:= 2*(x**3)+1*(x**2)+(-3)*x+8;
end;
function trap(a, b: Real; n: Integer):real;
var
  h, x,sum: Real;
  
begin
  h:= (b-a)/n;
  sum := (funkciya(a) + funkciya(b)) / 2;
  x:= a+h;
  for var i:=1 to n-1 do begin
    sum := sum + funkciya(x); 
    x := x + h;
  end;
  trap:= h * sum; 
end;
var x1:=0;
var y1:=0;
begin
write('Введите нижний предел: ');
var a:=ReadReal();
writeln(a);
write('Введите верхний предел: ');
var b:=ReadReal();
writeln(b);
write('Введите количество подотрезков : ');
var n:=ReadInteger();
writeln(n);
var sum := trap(a, b, n);
var x0 := 250;
var y0 := 250;
SetWindowSize(605, 605);
SetPenColor(clBlack);
SetPenWidth(3);
MoveTo(x0, y0);
Line(-900, y0, 900, y0);
Line(x0, 900, x0, -900);
SetFontColor(clgreen); // устанавливаем цвет текста
textout(x0 + 340, y0 - 20, 'x'); // подпись на оси x
textout(x0-12, y0 - 250, 'y'); // подпись на оси y
var l := -10.0;
var p := 10;
var mx := 50;
var my := 5;
var x := l;
var y:=0.0;
while x <= p do
begin
y := funkciya(x);
x1 := x0 + round(x * mx);
y1 := y0 - round(y * my);
setpixel(x1, y1, clred);
x += 0.0001;
end;
x := a;
y := funkciya(x);
x1 := x0 + round(x * mx);
y1 := y0 - round(y * my);
MoveTo(x1, y1);
var h:=(b-a)/n;
while x <= b do
begin
  y := funkciya(x);
  x1 := x0 + round(x * mx);
  y1 := y0 - round(y * my);
  setpencolor(clblue);
  lineto(x1, y1);
  // Рисование параболы
  MoveTo(x1, y1);
  LineTo(round(x1), y0);
  LineTo(round (x1), y1);
  x += h;
end;
writeln('');
writeln('Значение интеграла по методу трапеций: ', sum);
end.

