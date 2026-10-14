page 50015 "LBMC FA Parts"
{
    SourceTable = "LBMC FA Parts";
    PageType = List;
    ApplicationArea = all;
    UsageCategory = Lists;
    Caption = 'FA Asset Tags';

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
                field("Part No."; Rec."Part No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
            }
        }
    }
}
