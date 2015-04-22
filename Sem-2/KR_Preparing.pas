program Task1;
uses crt;
const 
	n = 10;
	punkktuation: set of char = [' ',',','.'];
type
	f = file of Integer;
	t = text;
var
	ch: char;
	k,j,i:Integer;
	f1:f;
	t1:t;
begin
	assign(f1,'Type_file.dat');
	assign(t1,'Text_file.txt');
	rewrite(f1);
	for j:= 1 to n do 
	begin		
		i:= random(10);
		write(f1,i);
	end;
	close(f1);
	j:=0;
	reset(f1);
	while (not eof(f1) ) do
	begin
		read(f1,i);
			if i = 5 then 
			j:=j+1;
	end;
	close(f1);


	reset(t1);
	while (not eof(t1) ) do
	begin
		read(t1,ch);
		{while ( not eoln(t1) ) and ( not ( ch in punkktuation ) ) do
		begin
			read((t1,ch);
		end;}
		writeln('plo',ch:2);
		if ch in punkktuation then 
			inc (k);
		if eoln then
			readln(t1);
	end;


	close(t1);
	
	

	reset(t1);
		while (not eof(t1)) do
		begin
			read(t1,ch);
			write(ch:1);
		end;
	close(t1);
	
	writeln;
	reset(f1);
		while (not eof(f1)) do
		begin
			read(f1,i);
			write(i:2);
		end;
	close(f1);
	
	writeln;

	writeln('Amount of 5 = ',j);
	writeln('Amount of words = ',k);
end.