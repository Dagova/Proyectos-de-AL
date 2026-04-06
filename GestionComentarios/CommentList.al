page 50151 CommentList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Comment Entry";
    InsertAllowed = false; // sirve para quitar el nuevo que viene predeterminado en la barra de acciones

    layout
    {
        area(Content)
        {
            repeater("Comments")
            {
                field("Entry No."; Rec."Entry No.")
                {
                    Editable = false;
                    ApplicationArea = All;

                }
                field("Comment"; Rec.Comment)
                {
                    Editable = false;
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
            action(NewComment)
            {
                Caption = 'Nuevo Comentario';
                RunObject = Page 50152;
                Promoted = true;
            }

            action(CommentCount)
            {
                Caption = 'Contar Comentarios';
                ApplicationArea = All;
                Promoted = true;
                trigger OnAction()
                var
                    Managements: Codeunit 50154;
                    CommentEntries: Record "Comment Entry";
                begin
                    CommentEntries.FindSet();
                    Message('Total de comentarios: %1', Managements.GetCommentCount());
                end;
            }
        }
    }
}