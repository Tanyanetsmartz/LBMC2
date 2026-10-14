page 50000 "LBMC Customer Parents"
{
    SourceTable = "LBMC Customer Parent";
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
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
