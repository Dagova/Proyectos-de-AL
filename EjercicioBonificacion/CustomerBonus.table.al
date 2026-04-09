table 50300 CustomerBonus
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Código';
            DataClassification = ToBeClassified;

        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Número de Cliente';
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(3; "Bonus %"; Decimal)
        {
            Caption = 'Bonificación';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if (rec."Bonus %" < 0) or (rec."Bonus %" > 100) then
                    Error('La bonificación no puede ser negativa ni mayor a 100');
            end;
        }
        field(4; "Minimum Amount"; Decimal)
        {
            Caption = 'Cantidad Mínima';
            DataClassification = ToBeClassified;
            NotBlank = true;

        }
        field(5; "Starting Date"; Date)
        {
            Caption = 'Fecha de Inicio';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if rec."Starting Date" > rec."Ending Date" then
                    Error('La fecha de inicio no puede ser mayor que la fecha de fin');
            end;
        }
        field(6; "Ending Date"; Date)
        {
            Caption = 'Fecha de Fin';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if rec."Ending Date" < rec."Starting Date" then
                    Error('La fecha de fin no puede ser menor que la fecha de inicio');
            end;
        }
        field(7; Active; Boolean)
        {
            Caption = 'Activo';
            DataClassification = ToBeClassified;
        }
        field(8; "Used"; Boolean)
        {
            Caption = 'Usado';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Pk; Code)
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
        if Rec.Used then
            Error('No se puede eliminar una bonificación que ya ha sido usada');
    end;

    procedure Valido(): Boolean
    begin
        // Si no está activa, nunca es válida
        if not Rec.Active then
            exit(false);

        // Si hay fecha de inicio y aún no ha llegado, no es válida
        if (Rec."Starting Date" <> 0D) and (Today() < Rec."Starting Date") then
            exit(false);

        // Si hay fecha de fin y ya pasó, no es válida
        if (Rec."Ending Date" <> 0D) and (Today() > Rec."Ending Date") then
            exit(false);

        // Si no falla nada, es válida
        exit(true);
    end;

}