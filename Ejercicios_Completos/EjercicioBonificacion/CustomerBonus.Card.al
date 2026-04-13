page 50301 CustomerBonusCard
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = CustomerBonus;
    Caption = 'Bonificación por Cliente';

    layout
    {
        area(content)
        {
            group(info)
            {

                field(Code; Rec.Code)
                {
                    Caption = 'Código';
                    Editable = false;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    Caption = 'Número de Cliente';
                }
                field("Bonus %"; Rec."Bonus %")
                {
                    Caption = 'Bonificación';
                }
                field("Minimum Amount"; Rec."Minimum Amount")
                {
                    Caption = 'Cantidad Mínima';
                }


            }
            group(fechas)
            {
                Caption = 'Fechas';

                field("Starting Date"; Rec."Starting Date")
                {
                    Caption = 'Fecha de Inicio';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    Caption = 'Fecha de Fin';
                }
            }
            group(estado)
            {
                Caption = 'Estado';

                field(Active; Rec.Active)
                {
                    Caption = 'Activo';
                }
                field(Used; Rec.Used)
                {
                    Caption = 'Usado';
                    Editable = false;
                }
            }
        }

    }
}
