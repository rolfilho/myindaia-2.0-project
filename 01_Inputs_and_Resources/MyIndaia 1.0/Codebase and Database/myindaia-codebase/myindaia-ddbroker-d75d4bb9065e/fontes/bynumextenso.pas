unit ByNumExtenso;

Interface

  Function DoTriplet (TheNumber : Integer) : String;
  Function NumberInWords (TheNumber : Integer) : String;
	Function IMoneyInWords ( Number:Double; BigSing, BigPlural, SmallSing, SmallPlural: String ) : String;

Implementation

Uses
  SysUtils;

Const
  Digits : Array [1..9]Of String= (
    'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'
    );

  Teens : Array [1..9]Of String= (
    'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eightteen', 'nineteen'
    );

  TenTimes : Array [1..9]Of String= (
    'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'   // Corrigido o quarenta (forty), pois estava escrito errado (fourty).     Eric 26/07/2012 16:02h
    );


Function DoTriplet (TheNumber : Integer) : String;
Var
  Digit, Num : Integer;
Begin
  Result:='';
  Num:=TheNumber Mod 100;
  If (Num>10)And (Num<20)Then Begin
    Result:=Teens [Num-10];
    Num:=TheNumber Div 100;
  End
  Else Begin
    Num:=TheNumber;
    Digit:=Num Mod 10;
    Num:=Num Div 10;
    If Digit>0 Then Result:=Digits [Digit];
    Digit:=Num Mod 10;
    Num:=Num Div 10;
    If Digit>0 Then Result:=TenTimes [Digit]+' '+Result;
    Result:=Trim (Result);
  End;
  Digit:=Num Mod 10;
  If (Result<>'')And (Digit>0)Then Result:='and '+Result;
  If Digit>0 Then Result:=Digits [Digit]+' hundred '+Result;
  Result:=Trim (Result);
End;

Function NumberInWords (TheNumber : Integer) : String;
Var
  Num, Triplet, Pass : Integer;
Begin
  If TheNumber<0 Then Result:='Minus '+NumberInWords (-TheNumber)
  Else Begin
    Result:='';
    Num:=TheNumber;
    If Num>999999999 Then
      Raise Exception.Create ('Can''t express more than 999,999,999 in words');
    For Pass:=1 To 3 Do Begin
      Triplet:=Num Mod 1000;
      Num:=Num Div 1000;
      If Triplet>0 Then Begin
        If (Pass>1)And (Result<>'')Then Result:=', '+Result;
        Case Pass Of
          2 : Result:=' thousand'+Result;
          3 : Result:=' million'+Result;
        End;
        Result:=Trim (DoTriplet (Triplet)+Result);
      End;
    End;
  End;
End;

Function IMoneyInWords ( Number:Double; BigSing, BigPlural, SmallSing, SmallPlural: String ) : String;
var Major, Minor: Integer;
Begin
  Major:= Trunc( Number );
  Minor:= Round( ( Number - Major ) * 100 );
  If Major=0 Then Result:='no' Else Result:=NumberInWords (Major);
  If Major=1 Then Result:=Result+' '+BigSing Else Result:=Result+' '+BigPlural;
  If Minor=0 Then Result:=Result+' only'
  Else Begin
    Result:=Result+' and '+DoTriplet (Minor);
    If Minor=1 Then Result:=Result+' '+SmallSing Else Result:=Result+' '+SmallPlural;
  End;
End;

End.
