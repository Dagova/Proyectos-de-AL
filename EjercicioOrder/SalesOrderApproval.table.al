table 50400 "Sales Order Approval"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; DocumentNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Número de documento';
        }
        field(2; TipoDocumento; Enum "Sales Document Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Tipo de documento';

        }
        field(3; ImportePedido; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Importe del pedido';
        }
        field(4; RequiereAprobacion; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Requiere aprobación';
            Editable = false;
        }
        field(5; EstaAprobado; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Está aprobado';
        }
        field(6; UsuarioAprobado; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Usuario que aprobó';
            Editable = false;
        }

        field(7; FechaAprobacion; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Fecha de aprobación';
            Editable = false;
        }
    }

    keys
    {
        key(PK; TipoDocumento, DocumentNo)
        {
            Clustered = true;
        }
    }


}