page 50401 "Sales Order Approval Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Sales Order Approval";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(DocumentNo; Rec.DocumentNo)
                {
                    Editable = false;

                }
                field(TipoDocumento; Rec.TipoDocumento)
                {
                    Editable = false;

                }
                field(ImportePedido; Rec.ImportePedido)
                {
                    Editable = false;

                }
                field(RequiereAprobacion; Rec.RequiereAprobacion)
                {
                    Editable = false;
                }
                field(EstaAprobado; Rec.EstaAprobado)
                {
                    Editable = false;

                }
                field(UsuarioAprobado; Rec.UsuarioAprobado)
                {
                    Editable = false;

                }
                field(FechaAprobacion; Rec.FechaAprobacion)
                {
                    Editable = false;
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Aprobar)
            {
                Caption = 'Aprobar pedido';
                ApplicationArea = All;
                Image = Approve;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit SalesOrderCodeUnits;
                begin
                    ApprovalMgt.Aprobar(Rec);
                end;
            }
        }
    }
}