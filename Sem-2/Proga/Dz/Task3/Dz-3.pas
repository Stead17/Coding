program Dz_3;
uses crt;
const dot = '.';
type
	T = text;
var
	k:Integer;
	ch:Char;
	t1,t2:T;
procedure Creatong_of_Files(var tx1,tx2:T); // Создание файлов
	begin
		assign(tx1,'For Dz_3.txt');
		assign(tx2,'File Reciever.txt');
		rewrite(tx2);
	end;	
procedure Output(var tx1:T); // Процедура вывода файлов
	begin
		reset(tx1);
		while (not eof(tx1)) do
		begin
			read(tx1,ch);
			write(ch:1);
		end;
		close(tx1);
	end;
procedure Row_Creator(var tx1,tx2:T); // Деление на рядки 
const n = 60;
	  symb: set of Char = ['A'..'z',' ',','];
	begin
	reset(tx1);
		while (not eof(tx1)) do
		begin
			if ( ch in symb ) and (k = n) then // Запись последнего элемента, если в рядке было 60 символов
			write(tx2,ch);
			if ( not eoln(tx1) ) then 
			begin
			read(tx1,ch);

			if (ch <> dot) then // Проверка на точки 
			begin
				for k:= 1 to n do // Цикл разделяющий на рядки по 60 символов
				begin
					if (ch <> dot) and ( not eoln(tx1) ) and ( not eof(tx1) ) then 
					begin
						write(tx2,ch);			
					end		
					else 
					begin
						writeln(tx2,dot); // Выход из цикла, если дошли до точки
						break;
					end;
					read(tx1,ch);
				end;
			end
			
			else
			begin
				writeln(tx2); // Если первый елемент в строке точка
			end;

			end
			else readln(tx1); // Если первая строка пуста
		if (k = n) then // Окончание рядка в новом файле, если у нас 60 елементов 
		begin
			writeln(tx2);
		end;
		end;
	close(tx1);
	close(tx2);
	end;	
begin clrscr; // Главная программа
	Creatong_of_Files(t1,t2);
	writeln('The content of the file: ');
	writeln;
	Output(t1);
	writeln;
	writeln;
	Row_Creator(t1,t2);
	writeln('New file with separated rows: ');
	writeln;
	Output(t2);
	readkey;
end.