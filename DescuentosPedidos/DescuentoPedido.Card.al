page 50410 "Sales Discount Request Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Sales Discount Request";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = itsEditable;
                }
            }

            group("Document Info")
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Editable = itsEditable;
                }

                field("Sales Document Type"; Rec."Sales Document Type")
                {
                    ApplicationArea = All;
                    Editable = itsEditable;
                }

                field("Sales Document No."; Rec."Sales Document No.")
                {
                    ApplicationArea = All;
                    Editable = itsEditable;
                }
            }

            group(Estado)
            {
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SendForApproval)
            {
                Caption = 'Enviar a aprobación';
                ApplicationArea = All;
                Image = SendApproval;
                Enabled = Rec.Status = Rec.Status::Draft;

                trigger OnAction()
                var
                    RequestMgt: Codeunit "Sales Discount Request Mgt.";
                begin
                    RequestMgt.SendForApproval(Rec);
                    CurrPage.Update();
                end;
            }

            action(Approve)
            {
                Caption = 'Aprobar';
                ApplicationArea = All;
                Image = Approve;
                Enabled = Rec.Status = Rec.Status::PendingApproval;

                trigger OnAction()
                var
                    RequestMgt: Codeunit "Sales Discount Request Mgt.";
                begin
                    RequestMgt.Approve(Rec);
                    CurrPage.Update();
                end;
            }

            action(Reject)
            {
                Caption = 'Rechazar';
                ApplicationArea = All;
                Image = Reject;
                Enabled = Rec.Status = Rec.Status::PendingApproval;

                trigger OnAction()
                var
                    RequestMgt: Codeunit "Sales Discount Request Mgt.";
                begin
                    RequestMgt.Reject(Rec);
                    CurrPage.Update();
                end;
            }
        }
    }

    var
        itsEditable: Boolean;

    trigger OnAfterGetCurrRecord()
    begin
        itsEditable := Rec.Status = Rec.Status::Draft;
    end;
}
