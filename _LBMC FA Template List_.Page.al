page 50005 "LBMC FA Template List"
{
    PageType = List;
    ApplicationArea = all;
    UsageCategory = Lists;
    SourceTable = "LBMC FA Template";
    CardPageId = "LBMC FA Template Card";

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Template Code"; Rec."Template Code")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("FA Class Code"; Rec."FA Class Code")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("FA Subclass Code"; Rec."FA Subclass Code")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Depreciation Method"; Rec."Depreciation Method")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("No. of Depreciation Years"; Rec."No. of Depreciation Years")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Under Maintenance"; Rec."Under Maintenance")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
            }
        }
    }
}
