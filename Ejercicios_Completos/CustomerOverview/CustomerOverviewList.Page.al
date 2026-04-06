page 50120 "Customer Overview List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Overview";
    Caption = 'Customer Overview List';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Entry No.';
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Customer No.';
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Customer Name';
                    ApplicationArea = All;
                }
                field("Source Code"; Rec."Source Code")
                {
                    ToolTip = 'Source Code';
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Amount';
                    ApplicationArea = All;
                }
                field(LastRunDate; Rec.LastRunDate)
                {
                    ToolTip = 'Last Run Date';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Import Records")
            {
                Caption = 'Import Records';
                ToolTip = 'Import Records';
                ApplicationArea = All;
                Image = Import;
                trigger OnAction()
                var
                //CustomerOverviewMgmt: Codeunit "Customer Overview Mgmt";
                begin
                    // CustomerOverviewMgmt.Run();
                end;
            }
        }
    }
}