program Dz_4;
uses crt;
type
	T = text;
var
	s,s1:String;
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
procedure Often_Words(var tx1,tx2:T);
const
	n = 100	;
	punktuation: set of Char = [' ',',','.'];
var k,i:Integer;
	ch: Char;
	fl_enter:Boolean;
	mas_counter: array[1..n] of Integer;	
	mas_words: array[1..n] of String;
	begin
	writeln;
	for i:= 1 to n do 
	begin
		mas_counter[i]:=0;
		mas_words[i]:='';
	end;
	reset(tx1);
		while ( not eof(tx1) ) do
		begin
			k:=0;	
			s:= '';
			fl_enter:=false;
			read(tx1,ch);
			while ( not eoln(tx1) ) and (not ( ch in punktuation )) do
			begin
				s:= s + ch;
				read(tx1,ch);
				fl_enter:=true;
			end;	
			if ( not ( ch in punktuation ) ) then 
				s:= s + ch;
			reset(tx2);
			while ( not eof(tx2) ) and ( fl_enter ) do
			begin
				s1:='';
				read(tx2,ch);
				while ( not eoln(tx2) ) and (not ( ch in punktuation )) do
				begin
					s1:= s1 + ch;
					read(tx2,ch);
				end;
				if ( not ( ch in punktuation ) ) then 
				begin
					s1:= s1 + ch;
				end;
				if (s = s1) then 
				begin
					k:= k + 1;
				end;
			if ( eoln(tx2) ) then 
				begin	
					readln(tx2);	
				end;
			end;
			close(tx2);
			for i:= n downto 1 do 
				begin
					if (k > mas_counter[i]) then 
					begin
						mas_counter[i]:=k;
						mas_words[i]:=s;
						break;
					end;
				end;
		if ( eoln(tx1) ) then 	
			readln(tx1);		
		end;
	close(tx1);
	writeln;
	for i:= 1 to n do 
	begin
		write('Word: "',mas_words[i],'" repeats: ');
		writeln(mas_counter[i],' ');	
	end;
	end;
begin
	assign(t1,'For Dz-4.txt');
	assign(t2,'COpy of first.txt');
	Output(t1);
	writeln();
	Often_Words(t1,t2);
	writeln;
end.