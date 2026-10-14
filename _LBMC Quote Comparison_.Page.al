page 50029 "LBMC Quote Comparison"
{
    Caption = 'Quote Comparison';
    PageType = Card;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    SaveValues = true;

    layout
    {
        area(Content)
        {
            group(Filter)
            {
                field(ItemFilter; ItemFilter)
                {
                    Caption = 'Item Filter';
                    ApplicationArea = all;
                    ToolTip = ' ';

                    trigger OnLookup(var Text: Text): Boolean var
                        Item: Record Item;
                        ItemList: Page "Item List";
                    begin
                        ItemList.LookupMode(true);
                        if ItemList.RunModal() = Action::LookupOK then begin
                            ItemList.GetRecord(Item);
                            Text:=ItemList.GetSelectionFilter();
                            exit(true);
                        end;
                        exit(false);
                    end;
                }
                field(VendFilter; VendFilter)
                {
                    Caption = 'Vendor Filter';
                    ApplicationArea = all;
                    ToolTip = ' ';

                    trigger OnLookup(var Text: Text): Boolean var
                        Vendor: Record Vendor;
                        VendorList: Page "Vendor List";
                    begin
                        VendorList.LookupMode(true);
                        if VendorList.RunModal() = Action::LookupOK then begin
                            VendorList.GetRecord(Vendor);
                            Text:=VendorList.GetSelectionFilter();
                            exit(true);
                        end;
                        exit(false);
                    end;
                }
                field(MinQty; MinQty)
                {
                    Caption = 'Minimum Qty.';
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ViewMatrix)
            {
                Caption = 'View Data';
                Image = View;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;
                ToolTip = ' ';

                trigger OnAction()
                begin
                    Clear(LBMCQuoteCompMatrix);
                    LBMCQuoteCompMatrix.LoadPage(ItemFilter, VendFilter, MinQty);
                    LBMCQuoteCompMatrix.RunModal();
                end;
            }
        }
    }
    var LBMCQuoteCompMatrix: Page "LBMC Quote Comparison Matrix";
    VendFilter: Text;
    ItemFilter: Text;
    MinQty: Decimal;
}
