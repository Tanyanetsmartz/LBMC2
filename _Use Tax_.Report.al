report 50012 "Use Tax"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/UseTax.rdl';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = where("Document Type"=const(Order));
            RequestFilterFields = "No.", "Order Date", "Posting Date";

            column(Posting_Date; format("Posting Date"))
            {
            }
            column(Order_Date; format("Order Date"))
            {
            }
            column(No_; "No.")
            {
            }
            column(Vendor_Order_No_; "Vendor Order No.")
            {
            }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type"=field("Document Type"), "Document No."=field("No.");
                DataItemTableView = where(Type=const(Item), "No."=filter(<>''));
                RequestFilterFields = "No.";

                column(State; State)
                {
                }
                column(UseTaxPct; UseTaxPct)
                {
                }
                column(UseTaxAmt; UseTaxAmt)
                {
                }
                column(Location_Code; "Location Code")
                {
                }
                column(ItemNo_; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
                {
                }
                column(Line_Amount; "Line Amount")
                {
                }
                trigger OnAfterGetRecord()
                begin
                    UseTaxAmt:=0;
                    UseTaxPct:=0;
                    if "Purchase Line".State <> '' then if UseTax.get("Purchase Line".State)then begin
                            UseTaxPct:=UseTax."Tax %";
                            UseTaxAmt:=(UseTax."Tax %" * "Purchase Line"."Line Amount") / 100;
                        end;
                end;
            }
        }
    }
    var UseTax: Record "LBMC Use Tax";
    UseTaxPct: Decimal;
    UseTaxAmt: Decimal;
}
