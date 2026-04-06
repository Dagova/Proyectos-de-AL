table 50150 "Comment Entry"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Comment"; Text[250])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;


        }
        field(3; "Created Date"; Date)
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

    trigger OnInsert()
    begin
        if ("Created Date" = 0D) then
            "Created Date" := Today();
    end;


}