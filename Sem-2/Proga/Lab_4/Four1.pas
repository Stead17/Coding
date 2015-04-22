program Lab4;
uses crt;
const 
	m = 4;
type 
	F = text;
var 
	t1,t2:F;
	ch:Char;
procedure Output(var f1:F); // Процедура вывода файлов
	begin
		reset(f1);
		while (not eof(f1)) do
		begin
			read(f1,ch);
			write(ch:1);
		end;
		close(f1);
	end;	
procedure Division_on_pages(var f1,f2:F);
var j,l,k: Integer;
begin
	reset(f1);
	rewrite(f2);
	k:=0;
	j:=1;
	l:=0;
	writeln(f2,'Page №',j);
	while ( not eof(f1) ) do 
	begin
	inc(l);
		if l-1 = m then 
		begin
			inc(j);
			writeln(f2,'Page №',j);
			l:=1;
		end;
		write(f2,'Row №',l,' ');
			read(f1,ch);
		if ( not eoln(f1) ) and ( not eof(f1) ) then 
		begin	
			while (not eoln(f1) ) do
			begin
				write(f2,ch);
				read(f1,ch);
			end;
		end;

		write(f2,ch);	
		writeln(f2);
		readln(f1);

	end;
	close(f1);
	close(f2);
end;
		
begin clrscr;
	assign(t1,'File of text.txt');
	assign(t2,'tmp.txt');
	writeln('The content of file : ');
	writeln;
	Output(t1);
	writeln;
	writeln;
	Division_on_pages(t1,t2);
	Output(t2);
end.