enum 50411 "Sales Discount Status"
{
    Extensible = true;

    value(0; Draft)
    {
        Caption = 'Borrador';
    }
    value(1; PendingApproval)
    {
        Caption = 'Pendiente de Aprobación';
    }
    value(2; Approved)
    {
        Caption = 'Aprobado';
    }
    value(3; Rejected)
    {
        Caption = 'Rechazado';
    }
}