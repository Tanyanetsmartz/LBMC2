pageextension 50022 "Job List" extends "Job List"
{
    layout
    {
        addafter("No.")
        {
            field("Creation Date"; Rec."Creation Date")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
        }
    }
}
