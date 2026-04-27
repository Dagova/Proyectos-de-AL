page 50400 "Sales Order Approval List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sales Order Approval";
    Caption = 'Aprobación de pedidos de venta';

    InsertAllowed = false;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(DocumentNo; Rec.DocumentNo)
                {

                }

                field(TipoDocumento; Rec.TipoDocumento)
                {

                }
                field(ImportePedido; Rec.ImportePedido)
                {

                }
                field(RequiereAprobacion; Rec.RequiereAprobacion)
                {
                }
                field(EstaAprobado; Rec.EstaAprobado)
                {

                }
                field(UsuarioAprobado; Rec.UsuarioAprobado)
                {
                }
                field(FechaAprobacion; Rec.FechaAprobacion)
                {

                }

            }
        }
    }
}