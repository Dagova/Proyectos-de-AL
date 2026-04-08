codeunit 50220 CustomerBalanceMgt
{
    procedure GetOpenSalesAmount(CustomerNo: Code[20]) Result: Decimal
    var
        CustomerLedgerEntry: Record "Cust. Ledger Entry";
        total: Decimal;
    begin
        CustomerLedgerEntry.SetRange("Customer No.", CustomerNo);
        CustomerLedgerEntry.SetRange("Open", true);
        if CustomerLedgerEntry.FindSet() then
            repeat
                total += CustomerLedgerEntry."Remaining Amount";
            until CustomerLedgerEntry.Next() = 0;
        exit(total);
    end;
}