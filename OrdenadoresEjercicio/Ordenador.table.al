table 50180 Computer
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Id; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
            DataClassification = ToBeClassified;

        }
        field(2; Date; Date)
        {
            Caption = 'Fecha';
            DataClassification = ToBeClassified;

        }
        field(3; Descripcion; Text[50])
        {
            Caption = 'Descripción';
            DataClassification = ToBeClassified;

        }
        field(4; Precio; Decimal)
        {
            Caption = 'Precio';
            DataClassification = ToBeClassified;

        }
        field(5; SegundaMano; Boolean)
        {
            Caption = 'Segunda Mano';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if rec.Precio < 0 then
            Error('El precio no puede ser negativo');
    end;

    trigger OnModify()
    begin
        if rec.Precio < 0 then
            Error('El precio no puede ser negativo');
    end;


}