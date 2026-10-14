page 50003 "LBMC Job Task Lines API"
{
    SourceTable = "Job Task";
    PageType = List;
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = all;
                    Editable = true;
                    ToolTip = ' ';
                }
                field("Job Task No."; Rec."Job Task No.")
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
