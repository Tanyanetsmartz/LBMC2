pageextension 50017 "Item Card" extends "Item Card"
{
    layout
    {
        addafter(Type)
        {
            field("Fixed Asset Item"; Rec."Fixed Asset Item")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
        }
        addbefore("Item Category Code")
        {
            field("Parent Category Code"; Rec."Parent Category Code")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
        }
    }
}
