table 50200 CustomerFeedback
{
    DataClassification = ToBeClassified;


    fields
    {
        field(10; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }

        field(20; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(30; Comment; Text[250])
        {
            DataClassification = ToBeClassified;

            //Ejercicio 4: Validar que el comentario tenga al menos 5 caracteres
            trigger OnValidate()
            var
                // Se instancia la codeunit para poder usar la variable y el procedimiento
                CodeUnit2: Codeunit 50203;
            begin
                CodeUnit2.Ejercicio4(Rec.Comment);
            end;

        }

        field(40; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}