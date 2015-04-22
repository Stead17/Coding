program Lab_three;
uses crt;
const
	golosn: set of char = ['a','o','i','u','y','e','A','O','I','U','Y','E'];// Множина голосних
type
	F = file of Char;
var
	f1: F;
	prigolos: set of Char;
	k: Integer;
	i,ch,ch1,ch2: Char;
procedure Fill_File(var char_file:F); // Заповнення файлу
var sym:char;	
	begin
		assign(char_file,'Three.dat');
		rewrite(char_file);
		for sym:= 'A' to 'E' do
		begin
			write(char_file,sym);
		end;
		for sym:= 'a' to 'o' do
		begin
			write(char_file,sym);
		end;
		close(char_file);	
	end;
procedure Output_of_File(var char_file:F); // Вивід файлу
var symb:Char;	
	begin
		reset(char_file);
		write('File of symbols {');
		while (not eof(char_file)) do
		begin
			read(char_file,symb);
			write(symb:3);
		end;
		writeln(' }');
		close(char_file);
	end;	
function First_Golosnaia(var char_file:F):Char; // Функція знаходження першої голосної
	begin
		reset (char_file);
			read(char_file,ch);
		while ( not eof (char_file) ) do
		begin
			if (ch in golosn) and (filepos(char_file)-1<>0)  then // Перевірка на першу букву та на голосну 
			begin
				read(char_file,ch1);
				if (ch1 in prigolos) then // Перевірка на наступну приголосну
				begin
					seek(char_file,filepos(char_file)-3); // Cчитування попередньої приголосної
					k:=filepos(char_file);
					seek(char_file,k);
					read(char_file,ch2); 					
					if (ch2 in prigolos) then 
					begin
						First_Golosnaia:=ch;
						k:=filepos(char_file);
						break;	
					end;
				end;
			end;
		read(char_file,ch);		
		end;
		close (char_file);
	end;	
procedure Delete_of_element(var char_file:F); // Переміщення першої голосної
	begin
		reset(char_file);
		if k <> 0 then // Перевірка на останню голосну
		begin	
		seek(char_file,k);
		while (not eof(char_file)) and (k<filesize(char_file)-1) do 
		begin
			seek(char_file,filepos(char_file)+1);
			read(char_file,ch);
			seek(char_file,filepos(char_file)-2);
			write(char_file,ch);
			k:=k+1;
		end;
		truncate(f1); // Видалення останньої букви
		end;
		close(char_file);
	end;	
procedure Pasting_of_Element(var char_file:F); // Вставка першої голосної
begin
	reset(char_file);
	seek(char_file,filesize(char_file));
	write(char_file,i);
	close(char_file);
end;
begin
	prigolos := ['A'..'Z','a'..'z'] - golosn; // Множина приголосних
	Fill_File(f1);
	Output_of_File(f1);
		writeln();
	writeln('Golos = "',First_Golosnaia(f1),'"');
	i:=First_Golosnaia(f1);
		writeln();
	Delete_of_element(f1);
	Pasting_of_Element(f1);
	Output_of_File(f1);
	readkey;
end.