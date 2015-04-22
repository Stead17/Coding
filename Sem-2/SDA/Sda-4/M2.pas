unit M2;
interface
	procedure S2;
	procedure S3;
	procedure S4;	

implementation
uses
	Common,M1,M3,Merr;
procedure S2;
begin
	writeln(f,'S2 started');
	Err;
	S7;
	writeln(f,'S2 finished');
end;
procedure S3;
begin
	writeln(f,'S3 started');
	Err;
	S7;
	S8;
	S9;
	writeln(f,'S3 finished');
end;
procedure S4;
begin
	writeln(f,'S4 started');
	Err;
	if vg_2 = 18 then 
	begin
		S9;
	end;
	S8;
	writeln(f,'S4 finished');
end;
begin
	writeln(f,'M2 started');
	writeln(f,'M2 finished');
end.