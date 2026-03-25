page 50113 ArmstrongCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Ejercicio de Funciones Integradas';
    layout
    {
        area(Content)
        {
            group(Group)
            {

            }
        }
    }



    trigger OnOpenPage()
    //Variables que solo se monstraran en el trigger, no se pueden usar en otros triggers ni funciones son variables "locales"
    var
        Counter1: Integer;
        CounterText: Text[5];
        Counter2: Integer;
        Powernumber: Integer;
        Result: Integer;
        ResultList: List of [Integer];
        Number: Integer;
        ArmstrongNumbers: Text;
        Newline: Text;
        Ch10: Char;
        Ch13: Char;

    begin
        Ch10 := 10;
        Ch13 := 13;
        Newline := Format(Ch10) + Format(Ch13);
        for Counter1 := 0 to 10000 do begin
            CounterText := Format(Counter1);
            Evaluate(PowerNumber, CopyStr(CounterText, StrLen(CounterText), 1));
            for Counter2 := 1 to StrLen(CounterText) do begin
                Evaluate(Number, CopyStr(CounterText, Counter2, 1));
                Result += Power(Number, PowerNumber);
            end;

            if Result = Counter1 then
                ResultList.Add(Result);
            Clear(Result);
        end;

        foreach Counter1 in ResultList do
            ArmstrongNumbers += Newline + Format(Counter1);

        Message(ArmstrongNumbers);
    end;



}