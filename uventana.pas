unit uventana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,uvector;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
   v:TVector;
   procedure updateSG();
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
 v.setdim(StrToInt(Edit1.Text));
  updateSG();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 Edit1.Text:=IntToStr(v.getdim());
  updateSG();
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 v.setelem(StrToInt(Edit1.Text),StrToInt(Edit2.Text));
  updateSG();
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 Edit2.Text:=IntToStr(v.getelem(StrToInt(Edit1.Text)));
  updateSG();
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  v.addelem(StrToInt(Edit2.Text));
   updateSG();
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  v.inselem(StrToInt(Edit1.Text),StrToInt(Edit2.Text));
   updateSG();
  Edit1.Text:='';
   Edit2.Text:='';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  v.remelem(StrToInt(Edit1.Text));
  updateSG();
  Edit1.Text:='';
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  p:integer;
begin
 p:=v.busqBinaria(StrToInt(Edit2.Text));
 Edit1.Text:=IntToStr(p);
  Edit2.Text:='';
  StringGrid1.Col:=p;
  StringGrid1.SetFocus;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 v:=Tvector.crear();
  updateSG();
  ShowMessage('vector inicializado');
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  if Assigned(v) then
    ShowMessage('Contenido del vector: ' + v.ComoString())
  else
    ShowMessage('El vector no ha sido creado.');
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  v.ordrinter();
  updateSG();
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  v.invertir();
  updateSG();
end;

procedure TForm1.Button12Click(Sender: TObject);
var
  p:integer;
begin
 p:=v.busqSecu(StrToInt(Edit2.Text));
 Edit1.Text:=IntToStr(p);
  Edit2.Text:='';
  StringGrid1.Col:=p;
  StringGrid1.SetFocus;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  v.rotar();
  updateSG();
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  v.ordselecc();
  updateSG();
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
 v.ordInsercc();
  updateSG();
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  v.ordBurb();
  updateSG();
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
 v.ordqsort();
  updateSG();
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
 v.elimR();
  updateSG();
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
 v.ordfrec();
  updateSG();
end;

procedure TForm1.updateSG();
var
  des:integer;
begin
StringGrid1.ColCount:=v.getdim();
  for des:=1 to v.getdim() do
   StringGrid1.Cells[des-1,0]:=IntToStr(v.getelem(des));
end;

end.

