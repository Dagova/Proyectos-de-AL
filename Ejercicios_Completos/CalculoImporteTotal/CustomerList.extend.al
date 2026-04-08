pageextension 50152 CustomerExtend extends "Customer List"
{

    actions
    {
        addlast(Processing)
        {

            action(CalculoImporteTotal)
            {
                Caption = 'Calculo Importe Total';
                Image = Report; // se pone un icono en el boton del actions
                ApplicationArea = All;
                Promoted = true; // se muestra el boton en la barra de acciones

                trigger OnAction()
                begin
                    Message('El importe total de las facturas abiertas del cliente %1 es %2', Rec."No.", CustomerBalanceMgt.GetOpenSalesAmount(Rec."No."));
                end;
            }
        }
    }
    var
        CustomerBalanceMgt: Codeunit CustomerBalanceMgt;

}