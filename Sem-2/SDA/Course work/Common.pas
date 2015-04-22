unit Common;

interface
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
	
end.
