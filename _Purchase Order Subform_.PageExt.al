pageextension 50018 "Purchase Order Subform" extends "Purchase Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field(State; Rec.State)
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
            field("Posting Group"; Rec."Posting Group")
            {
                ApplicationArea = all;
            }
            field("Posting Group 2"; Rec."Posting Group 2")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
        }
    }
}
