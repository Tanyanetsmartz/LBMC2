page 50006 "LBMC FA Template Card"
{
    PageType = Card;
    SourceTable = "LBMC FA Template";

    layout
    {
        area(Content)
        {
            group(General)
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
                field("No. Series"; Rec."No. Series")
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
            }
            group("Depreciation Book")
            {
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
            }
            group(Maintenance)
            {
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
