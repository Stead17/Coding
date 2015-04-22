unit unit_name;
interface
	procedure Input;
	procedure Sorting_Vstavka;
	procedure Ouptput;
	function ResTime;
uses
	Dos,Common,crt;

implementation
	procedure Input(var Vec: Vector);
	begin
		for i:= 1 to p do 
		begin
			Vec[i]:= random(20);
		end;
	end;
procedure Sorting_Vstavka(var Vec: Vector);
begin
	for i:= 2 to p do 
	begin
		tmp:= Vec[i];
		j:= i;
		while (j>1) and (tmp < Vec[j-1]) do 
		begin 
			Vec[j]:=Vec[j-1];
			j:=j-1;
		end;
		Vec[j]:= tmp;
	end;
end;
procedure Output(Vec: Vector);
begin
	write('Vector A { ');
	for i:= 1 to p-1 do 
	begin 
		write (Vec[i],', ');
	end;
	writeln(Vec[p],' }');
end;
function ResTime(const STime, FTime: Ttime): Longint;
var	
	Start1,Start2: Longint;
	Finish1,Finish2: Longint;
begin
	Finish1:= 36000 * Longint(FTime.Hours) +  6000 * Longint(FTime.Minutes);
	Finish2:= 100 * Longint(FTime.Seconds) + Longint(FTime.HSeconds);
	Start1:=  36000 * Longint(STime.Hours) + 6000 * Longint(STime.Minutes);
	Start2:= + 100 * Longint(STime.Seconds) + Longint(STime.HSeconds);
	ResTime:= Finish1 + Finish2 - ( Start1 + Start2) ; 
end;

end.
