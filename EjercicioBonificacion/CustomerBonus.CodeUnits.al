codeunit 50300 "Customer Bonus Management"
{
    /* CodeUnit creada para aplicar el descuento de bonificación a los clientes
       en función de las condiciones establecidas en la tabla CustomerBonus.*/

    procedure SeAplicaBonificacion(var SalesLine: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        CustomerBonusRec: Record CustomerBonus;
        CustomerNo: Code[20];
    begin
        // el flujo que se realiza es de validacion de la bonificación en función de la línea de pedido, para ello se siguen los siguientes pasos:

        // 1. Obtener el pedido (Sales Header) desde la línea
        if not SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.") then
            exit;

        // 2. Obtener el cliente desde el pedido
        CustomerNo := SalesHeader."Sell-to Customer No.";

        //Limpiamos los filtros de la tabla de bonificaciones para buscar una nueva bonificación para el cliente
        CustomerBonusRec.Reset();
        // 3. Buscar una bonificación para ese cliente
        CustomerBonusRec.SetRange("Customer No.", CustomerNo);

        // 4. Buscar la primera bonificación
        if not CustomerBonusRec.FindFirst() then
            exit;

        // 5. Comprobar si la bonificación es válida hoy
        if not CustomerBonusRec.Valido() then
            exit;

        // 6. revisamos si el importe de la línea cumple con el mínimo
        if SalesLine."Line Amount" < CustomerBonusRec."Minimum Amount" then
            exit;

        // Si se cumplen todas las condiciones, se aplica la bonificación a la línea de pedido
        // 7. Aplicar la bonificación a la línea de pedido
        SalesLine.Validate("Line Discount %", CustomerBonusRec."Bonus %");

    end;

    // Evento que se dispara al insertar una nueva línea de pedido, para comprobar si se le puede aplicar una bonificación

    //el primer trozo de codigo es el evento que va a escuchar 
    [EventSubscriber(ObjectType::Table, Database::"Sales Line",
                    'OnAfterInsertEvent', '', false, false)]

    //el segundo trozo de código es el procedimiento que se va a ejecutar cuando se dispare el evento
    local procedure disparador(var Rec: Record "Sales Line")
    begin
        SeAplicaBonificacion(Rec);
    end;
}