codeunit 50420 "Sales Discount Request Mgt."
{
    Subtype = Normal;

    procedure SendForApproval(var Request: Record "Sales Discount Request")
    begin
        // 1. Validar estado
        if Request.Status <> Request.Status::Draft then
            Error('Solo se pueden enviar a aprobación solicitudes en estado Borrador.');

        // 2. Validar datos obligatorios
        Request.TestField("Customer No.");
        Request.TestField("Sales Document Type");
        Request.TestField("Sales Document No.");

        // 3. Validar que el documento de venta existe
        ValidateSalesDocument(Request);

        // 4. Cambiar estado
        Request.Status := Request.Status::PendingApproval;

        // 5. Guardar cambios
        Request.Modify(true);
    end;

    procedure Approve(var Request: Record "Sales Discount Request")
    begin
        // 1. Validar estado
        if Request.Status <> Request.Status::PendingApproval then
            Error('Solo se pueden aprobar solicitudes en estado Pendiente de aprobación.');

        // 2. Cambiar estado
        Request.Status := Request.Status::Approved;

        // 3. Guardar cambios
        Request.Modify(true);
    end;

    procedure Reject(var Request: Record "Sales Discount Request")
    begin
        // 1. Validar estado
        if Request.Status <> Request.Status::PendingApproval then
            Error('Solo se pueden rechazar solicitudes en estado Pendiente de aprobación.');

        // 2. Cambiar estado
        Request.Status := Request.Status::Rejected;

        // 3. Guardar cambios
        Request.Modify(true);
    end;

    local procedure ValidateSalesDocument(Request: Record "Sales Discount Request")
    var
        SalesHeader: Record "Sales Header";
    begin
        // Validar que el documento existe
        if not SalesHeader.Get(
            Request."Sales Document Type",
            Request."Sales Document No.")
        then
            Error(
                'El documento de venta %1 %2 no existe.',
                Request."Sales Document Type",
                Request."Sales Document No."
            );

        // Validar que pertenece al mismo cliente
        if SalesHeader."Sell-to Customer No." <> Request."Customer No." then
            Error(
                'El documento de venta pertenece al cliente %1 y no al cliente indicado en la solicitud.',
                SalesHeader."Sell-to Customer No."
            );
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    local procedure ValidateDiscountBeforePost(SalesHeader: Record "Sales Header"; PreviewMode: Boolean; SuppressCommit: Boolean)
    var
        DiscountRequest: Record "Sales Discount Request";
    begin
        // Solo aplicamos lógica a Pedidos de Venta
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Order then
            exit;

        // Buscar si hay solicitud de descuento para este pedido
        DiscountRequest.Reset();
        DiscountRequest.SetRange("Sales Document Type", SalesHeader."Document Type");
        DiscountRequest.SetRange("Sales Document No.", SalesHeader."No.");

        if not DiscountRequest.FindLast() then
            exit; // no hay solicitud → no validamos nada (regla de negocio)

        // Si hay solicitud, debe estar aprobada
        if DiscountRequest.Status <> DiscountRequest.Status::Approved then
            Error(
                'El pedido %1 tiene una solicitud de descuento no aprobada. Estado actual: %2.',
                SalesHeader."No.",
                DiscountRequest.Status
            );
    end;
}
