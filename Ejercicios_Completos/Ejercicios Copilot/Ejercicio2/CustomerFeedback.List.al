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
                field("Entry No."; 'Entry No.')
                {

                }
                field("Customer No."; 'Customer No.')
                {
                    Editable = true;
                }
                field(Comment; 'Comment')
                {
                    Editable = true;

                }
                field(Date; 'Date')
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
            action(NewFeedback)
            {
                ApplicationArea = All;
                Caption = 'New';
                Promoted = true;
                RunObject = Page 50220;
            }
        }
    }
}