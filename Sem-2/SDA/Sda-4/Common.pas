unit Common;
interface
type
	tg_1 = array[1..10] of Integer;
	tg_2 = file of Char;
	tg_3 = set of Byte;
	tg_4 = file of Byte;
const
	cg_1 = 28;
	cg_2 = 16;
var
	vg_1:Integer;
	vg_2:Byte;
	a:tg_1;
	b:tg_2;
	c:tg_3;
	d:tg_4;
	f:text;
implementation
	
Initialization
	begin
		assign(f,'Good.txt');
		rewrite(f);
		Writeln(f,'Common Started');
		vg_1:= 20;
		vg_2:= 18;
		Writeln(f,'Common Finished');
    end;

Finalization 
  begin
    close(f);
  end;

end.