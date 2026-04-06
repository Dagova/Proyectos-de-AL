tableextension 50400 CustomerExtension extends Customer
{
    procedure UpdateCreditLimit(newCreditLimit: Decimal)
    begin
        NewCreditLimit := Round(NewCreditLimit, 10000);
        Rec.Validate("Credit Limit (LCY)", NewCreditLimit);
        Rec.Modify();
    end;

    procedure CalculateCreditLimit(): Decimal
    var
        RegistrarCliente: Record "Customer";
    begin
        RegistrarCliente := Rec;
        RegistrarCliente.SetRange("Date Filter", CalcDate('<-12M>', WorkDate()), WorkDate());
        RegistrarCliente.CalcFields("Sales (LCY)", "Balance (LCY)");
        exit(Round(RegistrarCliente."Sales (LCY)" * 0.5));
    end;
}