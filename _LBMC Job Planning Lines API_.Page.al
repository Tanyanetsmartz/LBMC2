page 50004 "LBMC Job Planning Lines API"
{
    SourceTable = "Job Planning Line";
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
                    Editable = true;
                    ToolTip = ' ';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean begin
        Rec."Line Type":=Rec."Line Type"::Budget;
        Rec.Type:=Rec.Type::"G/L Account";
    //rec.Quantity := 1;
    end;
}
