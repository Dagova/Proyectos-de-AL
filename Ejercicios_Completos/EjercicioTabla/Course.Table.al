table 50100 CRONUSCourse
{
    DataClassification = CustomerContent;
    Caption = 'Course';

    fields
    {
        field(10; Código; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(20; Nombre; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(30; Descripción; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(40; Tipo; Option)
        {
            Caption = 'Tipo de curso';
            DataClassification = CustomerContent;
            OptionMembers = "Dirigido por instructor","e-learning","Formacion Remota";
            OptionCaption = 'Dirigido por instructor, e-learning, Formacion Remota';


        }

        field(50; duracion; Decimal)
        {
            Caption = 'Duración (horas)';
            DataClassification = CustomerContent;
        }

        field(60; Precio; Decimal)
        {
            Caption = 'Precio';
            DataClassification = CustomerContent;
        }

        field(70; Activo; Boolean)
        {
            Caption = 'Activo';
            DataClassification = CustomerContent;
        }

        field(80; Dificultad; Integer)
        {
            Caption = 'Dificultad';
            DataClassification = CustomerContent;
        }

        field(90; TasaDeAprobacion; Integer)
        {
            Caption = 'Tasa de Aprobación';
            DataClassification = CustomerContent;
        }

        field(100; CodigoDeInstructor; Code[20])
        {
            Caption = 'Código de Instructor';
            DataClassification = CustomerContent;
            TableRelation = Resource where(Type = const(Person));

        }

        field(120; NombreDeInstructor; Text[100])
        {
            Caption = 'Nombre de Instructor';
            editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Resource.Name where("No." = field("CodigoDeInstructor")));
        }
    }

    keys
    {
        key(PK; Código)
        {
            Clustered = true;
        }

        key(Key1; CodigoDeInstructor)
        {
            Clustered = false;
        }

        key(Key2; Tipo)
        {
            Clustered = false;
        }
    }

}