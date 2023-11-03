unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    GridLayout1: TGridLayout;
    btn0: TButton;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    addBtn: TButton;
    minusBtn: TButton;
    multiplyBtn: TButton;
    divideBtn: TButton;
    resultBtn: TButton;
    resultText: TLabel;
    procedure btn0Click(Sender: TObject);
    procedure addBtnClick(Sender: TObject);
    procedure resultBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure addToQuery(Sender: TObject);
    procedure setresultText();
    var query:String;
    function checkOperator():boolean;
    function checkLastChar():boolean;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.addBtnClick(Sender: TObject);
begin
if not checkOperator then  begin
 if sender is TButton then  begin
   query:= query+Tbutton(sender).Text;
   setresultText;
 end;
end;
end;

procedure TForm2.addToQuery(Sender: TObject);
begin
if sender is TButton then
  begin
  query:= query+ IntToStr(Tbutton(sender).Tag);
  setresultText;
  end;
end;

procedure TForm2.btn0Click(Sender: TObject);
begin
if(query.Contains('=')) then query:='';
addToQuery(sender);
end;


function TForm2.checkLastChar: boolean;
begin
result:= query.EndsWith('+') OR query.EndsWith('-') OR query.EndsWith('x') OR query.EndsWith('/');
end;

function TForm2.checkOperator: boolean;
begin
result:= query.Contains('+') OR query.Contains('-') OR query.Contains('x') OR query.Contains('/');
end;

procedure TForm2.resultBtnClick(Sender: TObject);
var num1,num2,operationResult:double;operatorIndex:integer;
begin
if checkOperator then
  begin
    if (not checkLastChar) and (not query.Contains('=')) then
    begin
    if query.Contains('+') then begin
    operatorIndex:= query.IndexOf('+');
    num1:= query.Substring(0,operatorIndex).ToDouble();
    num2:= query.Substring(operatorIndex+1,query.Length).ToDouble();
    operationResult:= num1+num2;
    end
    else if query.Contains('-') then begin
    operatorIndex:= query.IndexOf('-');
    num1:= query.Substring(0,operatorIndex).ToDouble();
    num2:= query.Substring(operatorIndex+1,query.Length).ToDouble();
    operationResult:= num1-num2;
    end
    else if query.Contains('x') then  begin
    operatorIndex:= query.IndexOf('x');
    num1:= query.Substring(0,operatorIndex).ToDouble();
    num2:= query.Substring(operatorIndex+1,query.Length).ToDouble();
    operationResult:= num1*num2;
    end else if query.Contains('/') then  begin
    operatorIndex:= query.IndexOf('/');
    num1:= query.Substring(0,operatorIndex).ToDouble();
    num2:= query.Substring(operatorIndex+1,query.Length).ToDouble();
    operationResult:= num1/num2;
    end;
   query:= query+'='+operationResult.ToString;
   setresultText;
  end;
end;
end;

procedure TForm2.setresultText;
begin
resultText.Text:= query;
end;

end.
