unit M1;
interface
	procedure S1;

implementation
uses
	Common,Merr;
procedure S6;
begin
	writeln(f,'S6 started');
	Err;
	if (vg_1 = 20) or ( vg_1 = 21 ) then
	begin
	S1;
	end;
	writeln(f,'S6 finished');
end;
procedure S5;
begin
	writeln(f,'S5 started');
	Err;
	S6;
	writeln(f,'S5 finished');
end;
procedure S1;
begin
	writeln(f,'S1 started');
	Err;
	if (vg_1 = 20) then 
	vg_1:=21
	else 
	vg_1:=22;
	S5;
	writeln(f,'S1 finished');
end;
begin
	writeln(f,'M1 started');
	writeln(f,'M1 finished');
end.