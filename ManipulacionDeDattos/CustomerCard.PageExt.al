pageextension 50130 CustomerCard extends "Customer Card"
{
    layout
    {
    }
    actions
    {
        addafter("F&unctions")
        {
            action("UpdateCreditLimit")
            {
                ApplicationArea = All;
                Caption = 'Update Credit Limit';
                Image = CalculateCost;
                ToolTip = 'Update the credit limit';

                trigger OnAction()
                begin
                    CallUpdateCreditLimit();
                end;
            }
        }
    }
    var
        AreYouSureQst: Label '¿Esta seguro que desea establecer %1 como %2?';
        CreditLimitRoundedTxt: Label 'El limite de credito se redondeo a %1 para cumplir con las directivas de la empresa.';
        CreditLimitUpToDateTxt: Label ' El limite de credito esta actualizado';

    procedure CallUpdateCreditLimit()
    var
        CreditLimitCalculated: Decimal;
        CreditLimitActual: Decimal;
    begin
        CreditLimitCalculated := Rec.CalculateCreditLimit();
        if CreditLimitCalculated = Rec."Credit Limit (LCY)" then begin
            Message(CreditLimitUpToDateTxt);
            exit;
        end;

        if GuiAllowed() then
            if not Confirm(AreYouSureQst, false, Rec.FieldCaption("Credit Limit (LCY)"), CreditLimitCalculated) then
                exit;

        CreditLimitActual := CreditLimitCalculated;
        Rec.UpdateCreditLimit(CreditLimitActual);
        if CreditLimitActual <> CreditLimitCalculated then
            Message(CreditLimitRoundedTxt, CreditLimitActual);
    end;
}