page 50114 FibonacciCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Ejercicio de Fibonacci';
    layout
    {
        area(Content)
        {

        }
    }

    trigger OnOpenPage()
    var
        FibonacciNumbers: Text;
        a: Integer;
        b: Integer;
        counter: Integer;
        Resultado: Text[100];

    begin
        a := 0;
        b := 1;
        while (a <= 100) and (b <= 100) do begin
            Resultado := 'El numero de la suma ' + Format(a) + ' y ' + Format(b) + ' es ' + Format(a + b);
            Message(Resultado);

            a := a + b;
            Resultado := 'El numero de la suma ' + Format(b) + ' y ' + Format(a) + ' es ' + Format(a + b);
            Message(Resultado);
            b := a + b;
        end;
    end;


}