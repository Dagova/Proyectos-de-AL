codeunit 50203 CodeUnit2
{
    procedure Ejercicio4(texto: Text[100])
    var
        longitud: Integer;
    begin
        longitud := StrLen(texto);
        if (longitud < 5) then
            Error('El comentario es demasiado corto');
    end;

}