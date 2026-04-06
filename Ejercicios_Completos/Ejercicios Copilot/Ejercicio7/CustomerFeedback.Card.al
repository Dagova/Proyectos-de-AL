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
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("Customer No."; Rec."Customer No.") { ApplicationArea = All; }
                field(Comment; Rec.Comment) { ApplicationArea = All; }
                field(Date; Rec.Date) { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(CloseFeedBack)
            {
                ApplicationArea = All;
                Caption = 'Close';
                RunObject = Page 50200;
            }
        }
    }
}
