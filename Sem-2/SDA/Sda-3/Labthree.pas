program Lab3;
uses crt;
var
	ch: Char;
	i,m,a:Integer;
	Element,mult,s:Extended;
	
function F1(i:Integer;var mult:Extended; var s:Extended):Extended; // Знаходження елментів та суми за поверненням 
	begin
		if (i=1) then 
		begin
			mult:=1;
			s:= 1;
		end
		else 
		begin
			F1(i-1,mult,s);
			mult:=sqrt(mult*i) / ln (i+1);
			s:= s + mult;
		end;
		F1:=s;
	end;
procedure REC;
	begin
		REC;
	end;	
function F2(s:Extended; mult:Extended; i,m:Integer):Extended; // Знаходження елментів та суми за спуском
	begin
		if i < m then 
			F2:=F2( s+mult, sqrt(mult*(i+1))/ln(i+2), i+1, m )
		else 
			F2:= s + mult;
	end;	
function F3(i,m:Integer; mult:Extended;var s:Extended):Extended;
	begin
		if i < m then 
		begin
			mult:= sqrt(mult*(i+1))/ln(i+2);
			F3:= F3(i+1,m,mult,s);
			s:= s + mult;
		end
		else s:=1;
		F3:= s;
	end;	
begin clrscr; // Головна программа 
	repeat
	begin 	
	REC;	
	writeln('Choose thne method of calculation 1, 2 or 3');
	readln(a);
	case (a) of
		1:  begin
			s:=0;
			write('Enter a number of made recursion ');
			readln(a);
	//		writeln('Element number ',a,' =',F1(a,s):4:2);
	//		writeln('Summa of ',a,' elemnets=',S:4:2);

			end;
		2:  begin
			s:=0;
			i:=1;
			mult:=1;
			write('Enter a number of made recursion ');
			readln(m);
			writeln('Summa of ',m,' elemnets=',F2(s,mult,i,m):5:2);
			end;
		3:  begin	
			mult:=1;
			s:=0;		
			write('Enter a number of made recursion ');
			readln(m);
			writeln('Summa of ',m,' elemnets=',F3(1,m,mult,s):5:2);
			end;
		end;
	writeln('If you wanna repeat a program then enter "y" else enter "n" ');
	read(ch);	
	end;	
	until (ch = 'n') or (ch = 'N');
end.