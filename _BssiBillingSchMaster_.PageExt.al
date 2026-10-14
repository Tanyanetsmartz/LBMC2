pageextension 50011 "BssiBillingSchMaster" extends BssiBillingSchMaster
{
    layout
    {
        addafter(Bssi_UDF_H6)
        {
        /*
            field("Circuit ID"; Rec."Circuit ID")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
            field("Purchase Order No."; Rec."Purchase Order No.")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
            */
        }
    }
    actions
    {
        addafter("Invoice Preview")
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
                    BTSalesTaxMngt.CalculateTax(Rec.BssiArcbBillingScheduleNumber);
                end;
            }
        }
    }
}
