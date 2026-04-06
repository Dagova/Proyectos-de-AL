codeunit 50154 Managements
{
    procedure GetCommentCount(): Integer
    var
        ComentEntries: Record "Comment Entry";
        registros: Integer;
    begin
        registros := ComentEntries.Count();
        exit(registros);
    end;
}