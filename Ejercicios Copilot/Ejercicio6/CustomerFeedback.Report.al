report 50200 "Customer feedback report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(CustomerFeedback; CustomerFeedback)
        {
            DataItemTableView = Sorting("Customer No.", Date) Order(Descending);

            column(CustomerNo; "Customer No.")
            {
                Caption = 'Customer No.';
            }
            column(Comment; Comment)
            {
                Caption = 'Comment';
            }
            column(FeedbackDate; Date)
            {
                Caption = 'Date';
            }

        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Group)
                {
                    Caption = 'Filters';
                    field(CustomerNoFilter; CustomerFeedback."Customer No.")
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = Excel;
            LayoutFile = 'mySpreadsheet.xlsx';
        }
    }

    var
        myInt: Integer;
}