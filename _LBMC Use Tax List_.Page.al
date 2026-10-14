page 50020 "LBMC Use Tax List"
{
    SourceTable = "LBMC Use Tax";
    Caption = 'Use Tax';
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(State; Rec.State)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Tax %"; Rec."Tax %")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    DecimalPlaces = 2: 4;
                }
            }
        }
    }
}
