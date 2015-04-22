program laba2_prog;
uses crt;
const i=20;
type
  fl = file of real;
var
  f,fl1:fl;
  n,j:integer;
  s,k:real;


procedure form(var fl1:fl);
begin
assign(fl1,'Text.txt');
rewrite(fl1);
s:=0;
for j:=1 to i do begin
  s:=sqrt(2+s);
  write(fl1,s);
  write(s:5:2);
  end;
  writeln;
close(fl1);
end;

procedure naym(var fl1:fl);
begin
n:=1;
reset(fl1);
   if not eof(fl1) then read(fl1,k);
      while not eof(fl1) do begin
           if (n mod 2 = 0) then begin
            if s>k then
             s:=k;
             read(fl1,k);
             end
            else  read(fl1,k);
      n:=n+1;
      end;
write(s:5:2);
close(fl1);
end;

begin clrscr;
form(f);
naym(f);
readln
end.