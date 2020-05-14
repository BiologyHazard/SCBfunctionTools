program scbfunctiontools;
var
  e,en,i,j,m,n,p:longint;
  s,s1,fdname,pre:string;
  f1,f2,f3,f4:text;
  sa:array [1..99999] of string;
  t:array [1..99999] of longint;
  tm:array [1..999,1..2] of longint;
  
function stn(n:longint):string;
begin
  str(n,stn);
end;

function vai(st:string):longint;
begin
  val(st,vai);
end;

function upint(n:real):longint;
begin
  if n=trunc(n) then
    upint:=trunc(n)
  else
    upint:=trunc(n)+1;
end;

begin
  assign(f1,'scbfunctiontools.mctxt');
  reset(f1);
  assign(f2,'scbfunctiontools.txt');
  reset(f2);
      
  readln(f2,m);
  readln(f2,fdname);
  readln(f2,pre);
  n:=0;
  while not eof(f1) do
  begin
    inc(n);
    readln(f1,sa[n]);
    p:=pos('`',sa[n]);
    t[n]:=vai(copy(sa[n],1,p-1));
    delete(sa[n],1,p);
  end;
  
  if m=0 then
    m:=upint(sqrt(n));
  e:=upint(n/m);
  en:=n-(m-1)*e;
  
  close(f1);
  close(f2);
  
  
  
  
  assign(f4,'start.mcfunction');
  rewrite(f4);
  writeln(f4,'scoreboard players add @a timer 1');
  
  
  close(f4);
end.