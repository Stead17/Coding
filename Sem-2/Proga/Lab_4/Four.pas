program Lab4;
uses crt;
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
procedure Doubling(var f1,f2:F); // Процедура записывания в конец файла цифр из файла
const
	dig: set of Char = ['0'..'9']; // Множество цифр
	begin
	reset(f1);
	rewrite(f2);
			while (not eof(f1)) do
			begin
				if ( not eoln(f1) ) then
			  		read(f1,ch);
				while (not eoln(f1)) do
				begin
					write(f2,ch);
					if ch in dig then 
					begin
						write(f2,ch);
					end;
					read(f1,ch);
				end;
			write(f2,ch);
			if (ch in dig) then 
			write(f2,ch);
			readln(f1);
			end;	
	close(f1);
	close(f2);
	end;	
procedure Delete(var f1,f2:F); // Процедура удаления маленьких гласных латинских букв
const
	prygolos: set of Char = ['a','e','i','o','u','y'];
	begin
	reset(f1);
	rewrite(f2);
	while ( not eof(f1) ) do
	begin
		while ( not eoln(f1) ) do
		begin
			read(f1,ch);
			if (not (ch in prygolos) ) and ( not eoln(f1) ) and ( not eof(f1) )	then 
			begin
				while (not (ch in prygolos)) and ( not eoln(f1) ) and ( not eof(f1) ) do // Запись в буферный файл
				begin
					write(f2,ch);
					read(f1,ch);
				end;
			end;	
		end;
	if (not (ch in prygolos)) then
	write(f2,ch); // Запись последнего елемента
	end;
	close(f1);
	close(f2);
	end;
procedure Change_of_Files(var f1,f2:F); // Вставка в оригинальный файл елементов из буфера
	begin
		rewrite(f1);
		reset(f2);
		while ( not eof(f2) ) do
		begin
			while ( not eoln(f2) ) do
			begin
				read(f2,ch);
				write(f1,ch);
			end;
		readln(f2);	
		end;
		close(f1);
		close(f2);
	end;		
begin clrscr;
	assign(t1,'file.txt');
	assign(t2,'tmp.txt');
	writeln('The content of file before changes: ');
	writeln;
	Output(t1);
	writeln;
	Delete(t1,t2);
	Change_of_Files(t1,t2);
	Doubling(t1,t2);
	Change_of_Files(t1,t2);
	writeln;
	writeln('The content of file after changes: ');
	writeln;
	Output(t1);
	writeln;
	writeln;
	writeln;
end.