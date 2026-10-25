unit uvector;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;
const
  MAX=1000;
  type

    { TVector }

    TVector=class
      private
        elem:array[1..MAX]of integer;
        dim:integer;
      public
        constructor crear();
        procedure setelem(pos,ele: integer);
        function getelem(pos: integer): integer;
        procedure setdim(dimen: integer);
        function getdim(): integer;
        procedure addelem(ele: integer);
        procedure inselem(pos, ele: integer);
        procedure remelem(pos: integer);
        procedure intercambio(a,b:integer);
        procedure qsort(izq,der:integer);
        function frec(ele:integer):integer;
        //APLICAION 2
        function busqBinaria(ele:integer):integer; //
        procedure ordrinter();//
        procedure invertir();//
        function busqSecu(ele:integer):integer;//
        procedure rotar();//
        procedure ordInsercc();//
        procedure ordselecc();//
        procedure ordBurb();//
        procedure ordqsort();//
        procedure elimR();//
        procedure ordfrec();//
        function comostring():string;//
        //APLICACION 4
        function tosstring():String;
        procedure cargar();
        procedure mostrar();
        procedure dividir(var a,b:TVector);
        procedure purga();
        function canCortes():integer;
        function canELE():string;
        function intercalar(v2:TVector):String;

        //PRACTICAS
        function escapicua():boolean;
        function moda():integer;
        function promedio():real;
        procedure fibonacci(n:integer);
    end;

implementation

{ TVector }

constructor TVector.crear();
var
  pos:integer;
begin
 pos:=1;
  while (pos<=MAX) do
  begin
    elem[pos]:=0;
    pos:=pos+1;
  end;
   dim:=0;
end;

procedure TVector.setelem(pos, ele: integer);
begin
  if(pos>=1)and(pos<=MAX)then
   elem[pos]:=ele
 else
   ShowMessage('posicion fuera de rango');
end;

function TVector.getelem(pos: integer): integer;
begin
 if(pos>=1)and(pos<=dim)then
   result:=elem[pos]
 else
   result:=-999;
end;

procedure TVector.setdim(dimen: integer);
begin
 if(dimen>=0)and(dimen<=MAX)then
   dim:=dimen
 else
   ShowMessage('dimencion fuera de rango');
end;

function TVector.getdim(): integer;
begin
 result:=dim;
end;

procedure TVector.addelem(ele: integer);
begin
 if(dim<MAX)then
   begin
     dim:=dim+1;
     elem[dim]:=ele;
   end
 else
  ShowMessage('alamcenamiento lleno');
end;

procedure TVector.inselem(pos, ele: integer);
var
  d:integer;
begin
 if(dim<=MAX)then
 if(dim>=1)and(pos<=dim)then
  begin
    d:=dim;
    while(d>=pos)do
    begin
      elem[d+1]:=elem[d];
      d:=d-1;
    end;
    elem[pos]:=ele;
    dim:=dim+1;
  end
 else
  ShowMessage('posicion furera de rango')
else
 ShowMessage('alamcenamiento lleno');
end;

procedure TVector.remelem(pos: integer);
var
  d:integer;
begin
 if(pos>=1)and(pos<=dim)then
  begin
    d:=pos;
    while(d<dim)do
    begin
      elem[d]:=elem[d+1];
      d:=d+1;
    end;
    dim:=dim-1;
  end
 else
  ShowMessage('posicion fuera de rango');
end;

function TVector.busqBinaria(ele: integer): integer;
var
ini,fin,medio:integer;
b:boolean;
begin
 ini:=1;
 fin:=dim;
 b:=false;
 while(ini<=fin)and(not b)do
 begin
  medio:=(fin+ini)div 2;
   if(elem[medio]=ele)then
    b:=true
   else
     if(elem[medio]>ele)then
      fin:=medio-1
     else
      ini:=medio+1;
 end;
  if b then
   result:=medio
  else
    result:=-1;
end;

procedure TVector.ordrinter();
var
i,j:integer;
begin
 for i:=1 to dim-1 do
  begin
   for j:=i+1 to dim do
    begin
     if elem[j]<elem[i]then
      intercambio(j,i);
    end;
  end;
end;

procedure TVector.invertir();
var
  i,aux:integer;
begin
 for i:=1 to(dim div 2) do
  begin
    aux:=elem[i];
    elem[i]:=elem[dim-i+1];
    elem[dim-i+1]:=aux;
  end;
end;

procedure TVector.intercambio(a, b: integer);
var
  aux:integer;
begin
  aux:=elem[a];
  elem[a]:=elem[b];
  elem[b]:=aux;
end;

function TVector.busqSecu(ele: integer): integer;
var
  i:integer;
begin
 i:=1;
 while(i<=dim)and(elem[i]<>ele)do
  i:=i+1;
 if(i<=dim)then
  result:=i
 else
 Result:=-1;
end;

procedure TVector.rotar();
var
  i,aux:integer;
begin
 if dim>1 then
  begin
    aux:=elem[dim];
     for i:=dim downto 2 do
      begin
       elem[i]:=elem[i-1];
      end;
    elem[1]:=aux;
  end;

end;

procedure TVector.ordInsercc();
var
  i,j,aux:integer;
begin
 for i:=2 to dim do
  begin
   aux:=elem[i];
   j:=i-1;
   while(j>0)and(elem[j]>aux)do
   begin
    elem[j+1]:=elem[j];
    j:=j-1;
   end;
   elem[j+1]:=aux;
  end;

end;

procedure TVector.ordselecc();
var
  i,j,pm:integer;
begin
 for i:=1 to dim-1 do
  begin
   pm:=i;
   for j:=i+1 to dim do
    begin
     if elem[j]<elem[pm]then
     pm:=j;
    end;
   if pm<>i then
    intercambio(i,pm);
  end;
end;

procedure TVector.ordBurb();
var
  i, j: integer;
begin
  for i:=1 to dim-1 do
  begin
    for j:=1 to dim-i do
    begin
      if elem[j] > elem[j+1] then
        intercambio(j,j+1);
    end;
  end;
end;

procedure TVector.qsort(izq, der: integer);
var
  i, j, pivote: integer;
begin
  i := izq;
  j := der;
  pivote := elem[(izq + der) div 2];
  repeat
    while elem[i] < pivote do
      i := i + 1;
    while pivote < elem[j] do
      j := j - 1;
    if i <= j then
    begin
      intercambio(i, j);
      i := i + 1;
      j := j - 1;
    end;
  until i > j;
  if izq < j then
    qSort(izq, j);
  if i < der then
    qSort(i, der);
end;

procedure TVector.ordqsort();
begin
  if dim > 1 then
    qSort(1, dim);
end;

procedure TVector.elimR();
var
  i,j,k:integer;
begin
  i:=1;
  while i<=dim do
  begin
   j:=i+1;
    while j<=dim do
    begin
     if elem[i]=elem[j]then
     begin
       for k:=j to dim-1 do
       begin
        elem[k]:=elem[k+1];
       end;
       dim:=dim-1;
     end
     else
     begin
      j:=j+1;
     end;
    end;
    i:=i+1;
  end;
end;

function TVector.frec(ele: integer): integer;
var
  k,cant:integer;
begin
  cant:=0;
  for k:=1 to dim do
  begin
    if elem[k]=ele then
      cant:=cant+1;
  end;
  Result:=cant;
end;

procedure TVector.ordfrec();
var
  i,j,freqJ,freqJ1:integer;
begin
  for i:=1 to dim-1 do
  begin
    for j:=1 to dim-i do
    begin
      freqJ:=frec(elem[j]);
      freqJ1:=frec(elem[j+1]);
      if (freqJ<freqJ1)or((freqJ=freqJ1)and(elem[j]>elem[j+1]))then
      begin
        intercambio(j,j+1);
      end;
    end;
  end;
end;

function TVector.comostring(): string;
var
  i:integer;
  s:string;
begin
  s := '[';
  for i:=1 to dim do
  begin
    s:=s+IntToStr(elem[i]);
    if i<dim then
      s:=s+', ';
  end;
  s:=s+']';
  Result:=s;
end;

function TVector.tosstring(): String;
var
  d:integer;
  cad:string;
begin
 cad:='[';
 for d:=1 to dim-1 do
 cad:=cad+IntToStr(elem[d])+',';
 cad:=cad+IntToStr(elem[dim])+']';
 Result:=cad;
end;

procedure TVector.cargar();
var
  p:integer;
begin

 dim:=StrToInt(InputBox('cargar vector','dimencion:',''));
  for p:=1 to dim do
   elem[p]:=StrToInt(InputBox('cargar vector','v['+IntToStr(p)+']=',''));
end;

procedure TVector.mostrar();
begin
 ShowMessage(tosstring());
end;

procedure TVector.dividir(var a, b: TVector);
var
  i:integer;
begin
 i:=1;
 A.setdim(0);
 B.setdim(0);
 while(i<=dim)do
  begin
    if(elem[i] mod 2=0)then
     A.addelem(elem[i])
     else
       B.addelem(elem[i]);
    inc(i);
  end;
end;

procedure TVector.purga();
var
  p,d:integer;
begin
 p:=1;
 while(p<=dim)do
  begin
    d:=p+1;
    while(d<=dim)do
     begin
     if(elem[p]=elem[d])then
      remelem(d)
     else
      inc(d);
     end;
  inc(p);
  end;
end;

function TVector.canCortes(): integer;
var
  p,c:integer;
begin
 c:=0;
 for p:=1 to dim-1 do
 begin
  if elem[p]<>elem[p+1]then
  inc(c);
 end;
 Result:=c;
end;

//[cantidad 1er ele, catidad 2do ele,.....cantidad n ele]
function TVector.canELE(): string;
var
  p,d,c:integer;
  s:string;
  b:boolean;
begin
 s:='[';
 b:=true;
 if dim>0 then
 begin
   d:=1;
   while d<=dim do
    begin
      p:=elem[d];
      c:=0;
      while(d<=dim)and(elem[d]=p)do
       begin
        inc(c);
        inc(d);
       end;
      if not b then
       s:=s+',';
      s:=s+IntToStr(c);
      b:=false;
    end;
 end;
 s:=s+']';
 Result:=s;
end;

function TVector.intercalar(v2: TVector): String;
var
  i:integer;
  s:String;
  b:Boolean;
begin
 s:='[';
 b:=true;
 i:=1;
 while(i<=dim)or(i<=v2.getdim())do
  begin
   if i<=dim then
   begin
     if not b then
      s:=s+',';
     s:=s+IntToStr(elem[i]);
     b:=false;
   end;
   if i<=v2.getdim() then
   begin
     s:=s+',';
     s:=s+IntToStr(v2.getelem(i));
     b:=false;
   end;
   inc(i);
  end;
  s:=s+']';
  Result:=s;
end;

function TVector.escapicua(): boolean;
var
  i:integer;
  b:boolean;
begin
  b:=true;
  i:=1;
  while(i<=dim div 2)and b do
  begin
   if elem[i]<>elem[dim-i+1] then
    b:=false
   else
    inc(i);
  end;
  result:=b;
end;

function TVector.moda(): integer;
var
  i,maxf,elemod,frea:integer;
begin
  if dim>0 then
  begin
    maxf:=0;
    elemod:=elem[1];
    for i:=1 to dim do
    begin
     frea:=frec(elem[i]);
     if frea>maxf then
     begin
       maxf:=frea;
       elemod:=elem[i];
     end;
    end;
    result:=elemod;
  end
  else
  begin
   ShowMessage('vector vacio');
   result:=-1;
  end;
end;

function TVector.promedio(): real;
var
  i:integer;
  s:real;
begin
  if dim>0 then
  begin
    s:=0;
    for i:=1 to dim do
    begin
     s:=s+elem[i];
    end;
    result:=s/dim;
  end
 else
 begin
  ShowMessage('vector vacio');
  result:=-1;
 end;
end;

procedure TVector.fibonacci(n: integer);
var
  i,a,b,c:integer;
begin
 if(n>=1)and(n<=MAX)then
 begin
   dim:=0;
   if n>=1 then
   addelem(0);
   if n>=2 then
   addelem(1);
   a:=0;
   b:=1;
   for i:=3 to n do
   begin
    c:=a+b;
    addelem(c);
    a:=b;
    b:=c;
   end;
 end
 else
  ShowMessage('dimencion fuera de rango');
end;

end.

