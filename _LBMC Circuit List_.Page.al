page 50019 "LBMC Circuit List"
{
    SourceTable = "LBMC Circuit Master";
    PageType = List;
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("BB Circuit ID"; Rec."BB Circuit ID")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Vendor Circuit ID"; Rec."Vendor Circuit ID")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Activation Date"; Rec."Activation Date")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Disconnect Date"; Rec."Disconnect Date")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
            }
        }
    }
}
