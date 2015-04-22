program Labtwo;
uses Crt;
const
m = 8;
n = 8;
var
a: array[1..m,1..n] of Real;
i,j: Integer;
tmp:Real;
flag: Boolean;
begin 
	randomize;
	for i:= 1 to m do // Заповнення масиву
		for j:= 1 to n do 
			begin
				a[i,j]:= random(25);	
			end;
	writeln('Невідсортованний заповненний масив');		
	flag:=true;
	for i:=1 to m do // Вивід масиву  
	begin		
		for j:= 1 to n do 
			begin
				if (flag) and (j>1) and ( (1+j) mod 2 <> 0 ) then 
				begin					
                  write(a[i,j]:9:2,'*');
				end
                else	

					write(a[i,j]:9:2);
			end;
		flag:=false;	
		writeln;	
	end;	
	flag:=True; 
	while flag do // Сортування бульбашкою з прапорцем
	begin
 		flag:= false;
 	for i:= 2 to n-2 do
 	if (i mod 2 = 0) and ( (i+2) mod 2 = 0 ) and (i < n)  and (a[1,i] > a[1,i+2])  then
		begin
 		 tmp := a[1,i];
 		 a[1,i] := a[1,i+2];
 		 a[1,i+2] := tmp;
 		 flag :=true;
 		End;	
	end;
writeln;
writeln('Відсортованний заповненний масив');	
	flag:=true;
	for i:=1 to m do // Вивід відсортовоного масиву  
	begin		
		for j:= 1 to n do 
			begin
				if (flag) and (j>1) and ( (1+j) mod 2 <> 0 ) then 
				begin					
                	write(a[i,j]:9:2,'*');
				end
                else	
					write(a[i,j]:9:2);
			end;
		flag:=false;	
		writeln;	
	end;
	readkey;	
end.