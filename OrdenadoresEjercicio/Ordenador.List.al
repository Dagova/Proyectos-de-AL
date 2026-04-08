page 50180 ComputerList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Computer;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Id; Rec.Id)
                {
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    Editable = true;
                }
                field(Descripcion; Rec.Descripcion)
                {
                    Editable = true;

                }
                field(Precio; Rec.Precio)
                {
                    Editable = true;

                }
                field(SegundaMano; Rec.SegundaMano)
                {
                    Editable = true;

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(TotalRegistros)
            {
                Caption = 'Registros totales';

                trigger OnAction()
                begin
                    Message('Total de registros: %1', Rec.Count());

                end;
            }
            action(BorrarRegistro)
            {
                Caption = 'Borrar registro';

                trigger OnAction()
                begin

                    if Confirm('¿Está seguro de que desea borrar el registro con ID %1?', false, Rec.Id) then
                        Rec.Delete()
                    else
                        Message('No se ha borrado el registro con ID %1', Rec.Id);
                end;
            }
        }

    }
}