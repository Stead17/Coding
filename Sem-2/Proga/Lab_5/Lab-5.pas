program Lab_5;
uses crt;
const 
	a = 0.2;
	b = 1.3;
	E = 0.001;
type 
	differ = function ( x: real ) : Double;
var 
	Integ: Double;
	Oversight: Double;
	j: byte;
function func(x : real) : Double; far;
begin
	func:= sqrt( ln(x) + sin(x)/cos(x) + 2.17 ) * sin(x);
end;
function Integral ( f: differ; var D: double; k: byte) : Double;
const 
	n = 20;
var 
	i: byte;
	x,h,R: real;
	result: double;
begin
	h:= ( b - a ) / n*k;
	R:= ( sqr(b - a)*(b - a)/ 12*sqr(n) * k ) * 0;
	result:= 0;
	for i:= 1 to (n-1)*k do
	begin 
		x:= a + ( i + 0.5 ) * h;
		result:= result + f(x); 
	end;
	result:= h * result + R;
	D:= abs( (D - 1) / 3*result);
	Integral:= result;
end;
begin clrscr;
	Oversight:= 1 + e;
	Integ:= 0;
	j:= 1;
	while (Oversight > E) do
	begin
		Oversight:= (1/3) * Integ;
		Integ:= Integral(func,Oversight,j);
		if j = 1 then 
			j:= j + 1
		else 
			j:= j + 2;
	end;
	writeln(' Integral = ',Integ);
	readkey;
end.