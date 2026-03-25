page 50112 StatementsCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Statements Card';

    layout
    {
        area(Content)
        {
            group(Entrada)
            {
                Caption = 'Entrada';
                field(Dificultad; enteroDificultad)
                {
                    Caption = 'Dificultad';
                    ToolTip = 'Nivel de dificultad de la pregunta';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        GetSuggestion();
                    end;
                }
            }
            group(Salida)
            {
                Caption = 'Salida';
                field(Sugerencia; textoSugerencia)
                {
                    Caption = 'Sugerencia';
                    ToolTip = 'Sugerencia para resolver la pregunta';
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Nivel; textoNivel)
                {
                    Caption = 'Nivel';
                    ToolTip = 'Nivel de dificultad de la pregunta';
                    ApplicationArea = All;
                    Editable = false;
                }
            }

        }
    }

    var
        textoNivel: Text[30];
        textoSugerencia: Text[80];
        enteroDificultad: Integer;

    procedure GetSuggestion()
    begin
        case enteroDificultad of
            1:
                begin
                    textoSugerencia := 'Revisa los conceptos básicos y practica con ejercicios simples.';
                    textoNivel := 'Fácil';
                end;
            2:
                begin
                    textoSugerencia := 'Intenta resolver problemas de dificultad media y revisa tus errores.';
                    textoNivel := 'Medio';
                end;
            3:
                begin
                    textoSugerencia := 'Enfócate en problemas avanzados y busca patrones en tus soluciones.';
                    textoNivel := 'Difícil';
                end;
            else begin
                textoSugerencia := 'Selecciona un nivel de dificultad válido (1-3).';
                textoNivel := 'Desconocido';
            end;
        end;
    end;
}