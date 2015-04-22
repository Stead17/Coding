program Laba1;
uses  crt;	
type 
	tet =  set of 'a'..'z' ;
const
	gol: tet =  ['a','o','y','e','i','u'];
	prig: tet =  ['a'..'z'];	
var
	a,b,c,d,e,res,m,l,f: set of Char;
	i,ch: Char;
	s:String;
	j,k,p:Integer;
begin
	a:=[];
	b:=['a','g','k'];
	c:=[];
	d:=[];
	e:=[];
	
	writeln('Make a set a');
	writeln('To finish enter "n"');
	while (ch <> 'n') do
	begin		
		readln(ch);
		if ch <> 'n' then 
		a:= a + [ch];
	end;
	ch:='0';

    writeln('Make a set c');
	writeln('To finish enter "n"');
	while (ch <> 'n') do
	begin		
		readln(ch);
		if ch <> 'n' then 
		c:= c + [ch]; 		
	end;
	ch:='0';
	 	
	writeln('Make a set d');
	writeln('To finish enter "n"');
	while (ch <> 'n') do
	begin		
		readln(ch);
		if ch <> 'n' then 
		d:= d + [ch]; 		
	end;	
	ch:='0';

	writeln('Make a set e');
	writeln('To finish enter "n"');
	while (ch <> 'n') do
	begin		
		readln(ch);
		if ch <> 'n' then 
		e:= e + [ch]; 		
	end;
	ch:='0';

		m:= b+c - b*c;
		l:= d+e - d*e;
		f:= a+b - a*b;
	if ( a=e ) or ( c=d ) then 
		res:= a*(m+l - m*l)
	else 
		res:= f+(c+d+e) - f*(c+d+e);
	write('Result set =[');	
	for i:= '0' to 'z' do 
		begin	
		if i in res then  
			write(i,',');
		end;
	write(']');
	writeln();	
	readkey;		
end.