pageextension 50200 customerCardExt extends "Customer Card"
{
    layout
    {

        addafter(general)
        {
            field("Utimo Comentario"; lastComent)
            {
                ApplicationArea = All;
                Caption = 'Último Comentario';
            }
        }
    }



    var
        lastComent: Text[250];
        CustomerFeedback: Record CustomerFeedback;

    trigger OnAfterGetRecord()
    begin
        CustomerFeedback.Reset();
        CustomerFeedback.SetRange("Customer No.", Rec."No.");
        CustomerFeedback.SetCurrentKey(Date); // opcional: por fecha
        if CustomerFeedback.FindLast() then
            lastComent := CustomerFeedback.Comment
        else
            lastComent := '';
    end;
}