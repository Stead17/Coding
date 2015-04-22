program Main;
uses dos,crt;
const 
	p = 10;
type
	Vector = array[1..p] of Integer;
	Ttime = record
		Hours: Word;
		Minutes: Word;
		Seconds: Word;
		HSeconds: Word;
	end;
var
	StartTime, FinishTime: Ttime;
	AlgoritmTime : Longint;
	i,j,k,tmp : Integer; 			
	A: Vector;
function ResTime(const STime, FTime: Ttime): Longint;
var	
	Start: Longint;
	Finish: Longint;
begin
	Finish:= 36000 * Longint(FTime.Hours) +  6000 * Longint(FTime.Minutes) + 100 * Longint(FTime.Seconds) + Longint(FTime.HSeconds)
	Start:=  36000 * Longint(STime.Hours) + 6000 * Longint(STime.Minutes) + 100 * Longint(STime.Seconds) + Longint(STime.HSeconds);
	ResTime:= Finish - Start; 
end;
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
begin clrscr;
	with StartTime do
		GetTime(Hours,Minutes,Seconds,HSeconds);

	Input(A);
	Output(A);
	Sorting_Vstavka(A);
	Output(A);

	with FinishTime do  
		GetTime(Hours,Minutes,Seconds,HSeconds);
	AlgoritmTime:= ResTime(StartTime, FinishTime);
	writeln(' The time of process = ',AlgoritmTime);
end.
