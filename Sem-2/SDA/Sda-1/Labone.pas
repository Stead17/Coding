program Laba1;
const
	n = 10;
var
	a : array[1..n,1..n] of Real;
	diag : array[1..n] of Real;
	k,i,j,L,R:Integer;
	tmp: Real;
begin
	randomize;	
	for i:= 1 to n do 
		begin
			for j:= 1 to n do 
			A[i,j]:= random (100) - 50;
		end;
	for i:=1 to n do   
	begin		
		for j:= 1 to n do 
			begin
				write(a[i,j]:9:1);
			end;
		writeln;	
	end;
	writeln;
	writeln;
	for i:= 1 to n do 
		begin
			diag[i]:=a[i,n-i+1];
		end;
	write('Побічна діагональ={'); // Вывод диагональных елементов
	for i:= 1 to n-1 do 
		begin
			write(diag[i]:2:1,',')
		end;
	writeln(diag[n]:2:1,'}');	
	for i:= 2 to n do // Сортировка массива
		begin
			tmp:=diag[i];
			j:=i-1;
				while (j>0) and (tmp<diag[j]) do 
					begin
						diag[j+1]:=diag[j];
						j:=j-1;							
					end;
			diag[j+1]:=tmp;
		end;
	write('Відсортована побічна діагональ={'); // Вывод диагональных елементов
	for i:= 1 to n-1 do 
		begin
			write(diag[i]:2:1,',')
		end;
	writeln(diag[n]:2:1,'}');
	writeln;
	writeln;
	L:=1; 
	R:=n;
		while ( L<=R ) do // Поиск икса
			begin
				k:=(L+R) div 2; 
				if  (diag[k] <= 5) and (diag[k] >= 0) then 
				begin
					break;	
				end
				else 
				begin
					if (diag[k] < 0) then 
						begin
							L:= k+1;	
						end
						else 
						begin
							R:=k-1;
						end;	
				end;
			end;
	if (L<=R) then 
				begin
				writeln('Елемент знайденний на позиції [',k,',',k,']');			
				end
				else 
				begin
				writeln('Елемент не знайденний');				
				end;					
end.