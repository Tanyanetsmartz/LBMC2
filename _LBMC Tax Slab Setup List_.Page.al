page 50010 "LBMC Tax Slab Setup List"
{
    SourceTable = "LBMC Tax Slab Setup";
    PageType = List;
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Charge No."; Rec."Charge No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
            }
        }
    }
}
