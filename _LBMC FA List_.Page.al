page 50007 "LBMC FA List"
{
    PageType = List;
    ApplicationArea = all;
    UsageCategory = Lists;
    SourceTable = "Fixed Asset";
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("FA Part"; Rec."FA Part")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("FA Exchange"; Rec."FA Exchange")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("FA Site"; Rec."FA Site")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
            }
        }
    }
}
