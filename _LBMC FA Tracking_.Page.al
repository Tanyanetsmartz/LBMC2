page 50025 "LBMC FA Tracking"
{
    Caption = 'Fixed Asset Tracking';
    SourceTable = "LBMC FA Tracking";
    ApplicationArea = all;
    UsageCategory = Lists;
    PageType = List;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Asset Tag Number"; Rec."Asset Tag Number")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Serial Number"; Rec."Serial Number")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Exchnage Code"; Rec."Exchnage Code")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Site / Location"; Rec."Site / Location")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Final Job No."; Rec."Final Job No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Send to Accounting"; Rec."Send to Accounting")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
            }
        }
    }
}
