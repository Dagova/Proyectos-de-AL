codeunit 50400 SalesOrderCodeUnits
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line",
                     'OnAfterModifyEvent', '', false, false)]
    local procedure SalesLine_AfterModify(var Rec: Record "Sales Line")
    begin
        RecalcularAprobacion(Rec);
    end;

    procedure RecalcularAprobacion(var SalesLine: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        SalesOrderApprovalRec: Record "Sales Order Approval";
        TotalImportePedido: Decimal;
    begin
        // 1. Obtener el pedido (Sales Header) desde la línea
        if not SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.") then
            exit;

        // 2. Obtener el importe total del pedido
        TotalImportePedido := SalesHeader.Amount;

        // 3. Intentar obtener el registro de aprobación
        if not SalesOrderApprovalRec.Get(
            SalesHeader."Document Type",
            SalesHeader."No.")
        then begin
            // NO existe → lo creamos
            SalesOrderApprovalRec.Init();
            SalesOrderApprovalRec.TipoDocumento := SalesHeader."Document Type";
            SalesOrderApprovalRec.DocumentNo := SalesHeader."No.";
            SalesOrderApprovalRec.Insert();
        end;
        // 4. Determinar si se requiere aprobación
        if TotalImportePedido >= 1000 then
            SalesOrderApprovalRec.RequiereAprobacion := true
        else
            SalesOrderApprovalRec.RequiereAprobacion := false;

        // Guardamos también el importe
        SalesOrderApprovalRec.ImportePedido := TotalImportePedido;

        // 5. Guardar cambios
        SalesOrderApprovalRec.Modify();
    end;
}
