pageextension 50012 "BssiBillingSchSetup" extends BssiBillingSchSetup
{
    actions
    {
        addafter("Billing Schedule Group")
        {
            action("Tax Slab Setup")
            {
                Caption = 'Tax Slab Setup';
                Image = TaxSetup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = all;
                ToolTip = ' ';
                RunObject = page "LBMC Tax Slab Setup List";
            }
        }
    }
}
