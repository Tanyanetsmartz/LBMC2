pageextension 50019 "FA Posting Group" extends "FA Posting Group Card"
{
    layout
    {
        addafter("Losses Acc. on Disposal")
        {
            field("Useful Life"; Rec."Useful Life")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
        }
    }
}
