page 50152 CommentCard
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Comment Entry";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Comment"; Rec.Comment)
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Created Date"; Rec."Created Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                Caption = 'Guardar Comentario';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('Comentario guardado: %1', Rec."Comment");

                end;
            }
        }
    }
}