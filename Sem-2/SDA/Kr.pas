program Rec;
var
	varia,m,i:Integer;
	sum,s,mult:Real;
function F1(i,m:Integer; s,mult:real):Real;
	begin
		if i < m then 
			F1:=F1(i+1,m, s + mult , 3*sin( mult + i+1 ) )
		else 
			F1:= s + mult;		
	end;	
function F2(i:Integer):Real;
	begin
		if (i=1) then 
			F2:=2
		else 
		begin
			F2:= ln(i)*F2(i-1);
			sum:=sum + F2;
		end;
	end;	
function F3(i,m:Integer; s,mult:Real):Real;
	begin
		if i < m then
		begin
			mult:=cos( (i+1)*mult );	
			i:=i+1;
			s:= s + mult;
			F3:= F3(i,m,s,mult);	
		end
		else 
		F3:= s ;
	end;	
begin
	readln(m);
	Writeln('Down_First for ',m,' = ',F1(1,m,0,1):5:2);
	readln(i);
	Writeln('Up for ',i,' = ',F2(i):5:2);
	Writeln('Down_First for ',m,' = ',F3(1,m,0,0):5:2);
end.