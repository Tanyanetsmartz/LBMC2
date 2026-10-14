pageextension 50028 "Posted Purchase Invoice" extends "Posted Purchase Invoice"
{
    layout
    {
        addafter("Order No.")
        {
            field("Consturction PO"; Rec."Consturction PO")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
        }
    }
}
