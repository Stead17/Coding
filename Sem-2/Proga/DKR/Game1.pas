program Planes;
uses Graph; 
var 
    p  : pointer; 
  Size : word; 
begin 
  Gd := Detect; 
  InitGraph(Gd, Gm, ''); 
  ig GraphResult <> grOk then 
     Halt(1); 
  Bar(0, 0, GetMaxX, GetMaxY); 
  Size := ImageSize(10,20,30,40); 
  GetMem(p, Size);  { выделить память в динамически распре- 
                       деляемой области } 
  GetImage(10,20,30,40,p^); { считать двоичный образ } 
  PutImage(100,100,p^,NormalPut); { скопировать двоичный образ } 
  Readln; 
  CloseGraph; 
end. 
