codeunit 50200 MyCodeunit
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    procedure GetCustomerFeedbackCount(CustomerNo: Code[20]): Integer
    var
        Feedback: Record CustomerFeedback;
    begin
        Feedback.setRange("Customer No.", CustomerNo);
        exit(Feedback.Count());
    end;
}