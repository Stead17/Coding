unit M3;
interface
	procedure S7;
	procedure S8;
	procedure S9;
implementation
uses
	Common,M2,Merr;
procedure S7;
begin
	writeln(f,'S7 started');
	Err;
	writeln(f,'S7 finished');
end;
procedure S8;
begin
	writeln(f,'S8 started');
	vg_2:=18;
	Err;
	writeln(f,'S8 finished');
end;
procedure S9;
begin
	writeln(f,'S9 started');
	Err;
	vg_2:=19;
	S4;
	writeln(f,'S9 finished');
end;
begin
	writeln(f,'M3 started');
	writeln(f,'M3 finished');
end.