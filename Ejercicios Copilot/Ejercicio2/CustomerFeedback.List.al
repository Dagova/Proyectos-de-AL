page 50200 CustomerFeedbackList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CustomerFeedback;

    layout
    {
        area(Content)
        {
            repeater(group)
            {
                field("Entry No."; 1)
                {

                }
                field("Customer No."; 2)
                {
                    Editable = true;

                }
                field(Comment; 3)
                {
                    Editable = true;

                }
                field(Date; 4)
                {
                    Editable = true;

                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(New; New)
            {
                ApplicationArea = All;
                Caption = 'New';
                Promoted = true;
                RunObject = Page::"Customer Feedback Card";
            }
        }
    }
}