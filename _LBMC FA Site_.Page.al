page 50017 "LBMC FA Site"
{
    SourceTable = "LBMC FA Site";
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = all;
    Caption = 'FA Sites';

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Global Dimension 1 Code"; rec."Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
            }
        }
    }
}
