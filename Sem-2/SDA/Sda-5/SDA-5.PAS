program Sda_5;
uses crt;
type
	Matr1 = array[1..10,1..10] of Real;
	P_Matr1 = ^Matr1; // Вказівники на масив
	P_Matr2 = ^Matr2;
var
	A: ^Matr1; 
	//B: ^Matr2;
	ch: Char;
	mas_name: Integer;
procedure Input(P: pointer ; mas_name: Integer); // Процедура заповнення масиву
var i,j: Integer;
begin
		for i:= 1 to mas_name do 
		begin
			for j:= 1 to mas_name do 
			begin
				P_Matr1(P)^[i,j]:= random(10) -2 ;	
			end;	
		end;
end;
function Sum_count(P: pointer ; mas_name: Integer): Extended; // Обчислення суми над побічною діагоналю
var i,j: Integer;
	Summa: Extended;
begin
	Summa:= 0;
		for i:= 1 to mas_name-1 do 
		begin
			for j:= i+1 to mas_name do 
			begin
				Summa:= Summa + P_Matr1(P)^[i,j];
			end;
		end;
Sum_count:= Summa;
end;
function Dobutok_count(P: pointer ; mas_name: Integer):Extended; // Обчислення добутку під побічною діагоналю
var i,j: Integer;
	Dobutok: Extended;
begin
	Dobutok:= 1;
		for i:= mas_name downto 2 do 
		begin
			for j:= 1 to i-1 do 
			begin
				Dobutok:= Dobutok * P_Matr1(P)^[i,j];	
			end;		
		end;
	Dobutok_count:= Dobutok;
end;
procedure Output(P: pointer ; mas_name: Integer); // Процедура вивіду
var i,j: Integer;
begin
		for i:= 1 to mas_name do
		begin
			for j:= 1 to mas_name do
			begin
				write(P_Matr1(P)^[i,j]:8:2);
			end;
			writeln;
			writeln;
		end;
end;

begin clrscr;

repeat		
	writeln('Enter the size of massive one'); // Вибір масиву для якого буде обчислюватись сума та добуток
	mas_name:= 7;
			new(A);
			Input(A,mas_name);
			Output(A,mas_name);
			writeln;
			writeln('Sum above diagonal = ', Sum_count(A,mas_name):7:2 );
			writeln('Dobutok under diagonal = ', Dobutok_count(A,mas_name):7:2 );
			dispose(A);
			
	mas_name:= 5;
			new(B);
			Input(B,mas_name);
			Output(B,mas_name);
			writeln;
			writeln('Sum above diagonal = ', Sum_count(B,mas_name):7:2 );
			writeln('Dobutok under diagonal = ', Dobutok_count(B,mas_name):7:2 );
			dispose(B);

write('If you want to repeat enter "Y " else "N" ');
readln(ch);
until (ch = 'N') or (ch = 'n');	

end.