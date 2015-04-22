program Maximum;

var
	a,b: Word;
procedure Output(var a,b : Word);
begin
	writeln('Enter numbers to find maximum');
	write('Enter first number');
	readln(a);
	write('Enter secind number');
	readln(b);
end;
function Maximum(var a,b: Word):Integer;
begin
	if (a > b) then 
		Maximum:= b 
	else 
	begin
		if ( a = b ) then 
			Maximum:= a + b;
	Maximum:= a;
	end;
end;
begin
	Output(a,b);
 Maximum(a,b);

end.