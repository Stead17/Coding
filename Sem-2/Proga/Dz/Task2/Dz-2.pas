program Dz;
uses crt;
const separator: set of char = [' ',',','.'];
type 
	T = text;
var 
	f:T;
	k:Integer;
	ch:Char;
procedure Words_Amount(var f1:T);
	begin
		k:=0;
		reset(f1);
		while (not eof(f1)) do
		begin
			while (not eoln(f1)) do
			begin
				read(f1,ch);
				if not (ch in separator) then 
				begin	
					
					while (not (ch in separator) ) and ( not eoln (f1) ) and ( not eof(f1) ) do
					begin
						read(f1,ch);
					end;		
				inc(k);	
				end;
			end;	
		readln(f1);	
		end;
		close(f1);
	end;	
procedure Output(var f1:T);
	begin
		assign(f1,'Amount.txt');	
		reset(f1);
		while (not eof(f1)) do
		begin
			read(f1,ch);
			write(ch:1);
		end;
		close(f1);
	end;	
begin clrscr;
	writeln('The content of the file: ');
	writeln();
	Output(f);
	writeln;
	Words_Amount(f);
	writeln();
	writeln('The amount of words = ',k);
end.