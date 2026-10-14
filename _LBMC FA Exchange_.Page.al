page 50016 "LBMC FA Exchange"
{
    SourceTable = "LBMC FA Exchange";
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = all;

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
