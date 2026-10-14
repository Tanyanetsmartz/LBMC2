pageextension 50010 "BssiBillingSchList" extends BssiBillingSchList
{
    actions
    {
        addafter(BssiRefreshAPIData)
        {
            action("Calc. Taxes")
            {
                Caption = 'Calc. Taxes';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = ' ';

                trigger OnAction()
                var
                    BTSalesTaxMngt: Codeunit "LBMC BB General Func.";
                begin
                    Clear(BTSalesTaxMngt);
                    BTSalesTaxMngt.CalculateTax('');
                end;
            }
        }
    }
}
