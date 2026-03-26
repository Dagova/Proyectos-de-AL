page 50220 "Customer Feedback Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = CustomerFeedback;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Entry No."; "Entry No.") { ApplicationArea = All; }
                field("Customer No."; "Customer No.") { ApplicationArea = All; }
                field(Comment; Comment) { ApplicationArea = All; }
                field(Date; Date) { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Close; Close)
            {
                ApplicationArea = All;
            }
        }
    }
}
