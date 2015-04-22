program Lab2;
uses Crt;
type 
	F = file of Longint;
var
	ch:Char;
	g,h,f1:F;
	krat,n,i:Byte;
	k,a,b:Longint;
procedure myFile; // Процедура заполнения файла
var x:Longint;
	begin
		assign (f1,'f1.dat');
		rewrite(f1);
		for i:= 1 to n do 
		begin
			x:= i*(i+1)*(i+2);	
			write(f1,x);
			write(x:10);
		end;
		seek(f1,n-2);
		while (not eof (f1)) do
		begin
			read(f1,a,b);
			write(a,b)
		end;
		//rewrite(f1);
		while (not eof(f1)) do
		begin
			read(f1,a);
			write(a:10);
		end;
		close(f1);
		writeln;
	end;	
procedure Kratnost( var f1:F); // Процедура разделения на кратные и не кратные
	begin
		assign(g,'g.dat');
		assign(h,'h.dat');	
		rewrite(g);
		rewrite(h);
		reset(f1);
		while not eof(f1) do 
		begin
			read(f1,a);
			if (a mod krat = 0) then 
				write (g,a)
			else 
				write (h,a);	
		end;
		close(f1);
		close(h);
		close(g);
	end;

begin clrscr; // Головна програма 
	repeat 
	if ch = 'y' then clrscr;
	write('Enter the amount of numbers ');
	readln(n);
	myFile;
	k:=0;
	repeat
		begin		
			writeln('Number must be > 0');
			write('Enter a number to check the multiplicity ');
			readln(krat);
		end;
	until (krat <> 0);
	Kratnost(f1);
	writeln;
	writeln('Numbers which are divisioned on ',krat,' without a rest');
	reset(g);
	begin	
		while not eof(g) do 
		begin
			read(g,a);
			write(a:10);
		end;
	end;
	close(g);
	writeln;
	writeln('Numbers which are divisioned on ',krat,' with a rest');
	reset(h);
	begin
		while not eof(h) do
		begin		
			read(h,a);
			write(a:10);
		end;
	writeln;
	end;
	close(h);
	writeln('If you wanna repeat a program then enter "y" else enter "n" ');
	read(ch);
	until (ch = 'n') or (ch = 'N');
end.