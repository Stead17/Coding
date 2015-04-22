unit Merr;
interface
	procedure Err;

implementation
uses Common;
procedure Err;
begin
	writeln(f,'Err started');
	writeln(f,'Err finished');
end;
begin
	writeln(f,'Merr started');
	writeln(f,'Merr finished');
end.