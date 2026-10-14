pageextension 50000 "Customer Card" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field("Parent Code"; Rec."Parent Code")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
        }
    }
}
