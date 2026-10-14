pageextension 50029 "Vendor Card" extends "Vendor Card"
{
    actions
    {
        addafter("Item References")
        {
            action(Contracts)
            {
                ApplicationArea = all;
                Caption = 'Contracts';
                Image = ContractPayment;
                Promoted = true;
                PromotedCategory = Category9;
                RunObject = Page "LBMC Vendor Contracts";
                RunPageLink = "Vendor No."=field("No.");
                ToolTip = ' ';
            }
        }
    }
}
