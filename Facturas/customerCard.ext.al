pageextension 50250 MyExtension extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(Processing)
        {
            action(Calculos)
            {
                Caption = 'Numero de facturas';
                Image = Report; // se pone un icono en el boton del actions
                ApplicationArea = All;
                trigger OnAction()
                begin
                    CuentaFacturas();
                end;
            }
        }

    }
    local procedure CuentaFacturas()
    var
        Facturas: Integer;
        salesinvoiceHeader: Record "Sales Invoice Header";
    begin
        Facturas := 0;
        salesinvoiceHeader.SetRange("Sell-to Customer No.", Rec."No.");
        if salesinvoiceHeader.FindSet() then
            repeat
                Facturas += 1;
            until salesinvoiceHeader.Next() = 0;
        Message('El cliente %1 tiene %2 facturas.', Rec."No.", Facturas);


    end;
}