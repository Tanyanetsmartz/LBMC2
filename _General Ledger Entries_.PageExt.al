pageextension 50026 "General Ledger Entries" extends "General Ledger Entries"
{
    layout
    {
        addafter("Source Code")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
        }
    }
}
