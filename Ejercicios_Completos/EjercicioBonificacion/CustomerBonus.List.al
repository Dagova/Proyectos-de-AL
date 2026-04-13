page 50300 CustomerBonusList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CustomerBonus;
    Caption = 'Bonificaciones por Cliente';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    Caption = 'Código';
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
                field("Starting Date"; Rec."Starting Date")
                {
                    Caption = 'Fecha de Inicio';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    Caption = 'Fecha de Fin';
                }
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