program Dz_5;
type
	T = text;
var
	t1,t2:T;
procedure Output(var tx1:T); // Процедура вывода файлов
var ch:Char;
	begin
		reset(tx1);
		while (not eof(tx1)) do
		begin
			read(tx1,ch);
			write(ch);
		end;
		close(tx1);
	end;
procedure Words_in_Rows(var tx1,tx2:T);
var ch:Char;
	punktuation: set of Char = [' ',',','.'];
	begin
		reset(tx1);
		rewrite(tx2);
		while (not eof(tx1) ) do
		begin
			if ( not eoln(tx1) )  then 
			begin
					read(tx1,ch);
				while (not (ch in punktuation) ) and ( not eoln(tx1) ) do
				begin
					write(tx2,ch);
					read(tx1,ch);
				end;
			if ( not (ch in punktuation) ) then 
				begin
					write(tx2,ch);
				end;
				writeln(tx2);			
	 		end
	 		else
			readln(tx1);
		end;
		close(tx1);
		close(tx2);
	end;	
procedure Alphabet_Sorting(var tx2:T);
var s,s1: String;
	ch: Char;
begin
	s:='';
	reset(tx2);
	while ( not eof(tx2) ) do
	begin
		read(tx2,ch);
		while ( not eoln(tx2) ) do
		begin
			s:= s + ch;
			read(tx2,ch);
		end;
		s:= s + ch;
	end;
	close(tx2);
end;
begin
	assign(t1,'For Dz_5.txt');
	assign(t2,'Alphabet text.txt');
	Output(t1);
	Words_in_Rows(t1,t2);
	writeln;
	writeln;
	Output(t2);

end.