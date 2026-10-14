page 50002 "LBMC Job API"
{
    SourceTable = Job;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("SF Work Order No."; Rec."SF Work Order No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    Caption = 'SF Work Order No.';
                }
            }
        }
    }
}
