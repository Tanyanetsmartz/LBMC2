report 60100 "LBMC Vendor Payment Details"
{
    ApplicationArea = All;
    Caption = 'Vendor Payment Details';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Word;
    WordLayout = 'Layouts/Vendor Payment Details.docx';

    dataset
    {
        dataitem("Detailed Vendor Ledg. Entry"; "Detailed Vendor Ledg. Entry")
        {
            DataItemTableView = where("Document Type"=FILTER('Payment'), "Entry Type"=filter('Application'), "Amount (LCY)"=filter('>0'));
            RequestFilterFields = "Document No.", "Posting Date";

            column(Posting_Date; "Posting Date")
            {
            AutoFormatExpression = '<Year>/<Month>/<Day>';
            }
            column(Transaction_No_; "Transaction No.")
            {
            }
            column(Document_No_; "Document No.")
            {
            }
            column(Amount__LCY_; "Amount (LCY)")
            {
            }
            column(Vendor_No_; "Vendor No.")
            {
            }
            column(CheckAmount; CheckAmount)
            {
            }
            column(CheckNo; CheckNo)
            {
            }
            column(VendorInvoiceNo; VendorInvoiceNo)
            {
            }
            dataitem(Vendor; Vendor)
            {
                DataItemLink = "No."=field("Vendor No.");

                column(Name; Name)
                {
                }
                column(Address; Address)
                {
                }
                column(Address_2; "Address 2")
                {
                }
                column(City; City)
                {
                }
                column(County; County)
                {
                }
                column(Post_Code; "Post Code")
                {
                }
                column(Contact; Contact)
                {
                }
            }
            trigger OnAfterGetRecord()
            var
                CheckLedger: Record "Check Ledger Entry";
                VendLedgEntry: Record "Vendor Ledger Entry";
                AppliedVendorLedgerEntry: Record "Vendor Ledger Entry";
            begin
                CheckLedger.SetRange("Posting Date", "Posting Date");
                CheckLedger.SetRange("Document No.", "Document No.");
                if CheckLedger.FindFirst()then begin
                    CheckAmount:=CheckLedger.Amount;
                    CheckNo:=CheckLedger."Check No.";
                end;
                VendLedgEntry.SetRange("Posting Date", "Posting Date");
                VendLedgEntry.SetRange("Document No.", "Document No.");
                VendLedgEntry.SetRange("Amount (LCY)", "Amount (LCY)");
                if VendLedgEntry.FindFirst()then begin
                    AppliedVendorLedgerEntry.SetRange("Closed by Entry No.", VendLedgEntry."Entry No.");
                    if AppliedVendorLedgerEntry.FindFirst()then VendorInvoiceNo:=AppliedVendorLedgerEntry."External Document No.";
                end end;
        }
    }
    var CheckAmount: Decimal;
    CheckNo: Text;
    VendorInvoiceNo: Text;
}
