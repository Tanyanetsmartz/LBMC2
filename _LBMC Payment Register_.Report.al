report 50011 "LBMC Payment Register"
{
    Caption = 'Vendor Payment Register';
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/PaymentRegister.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            DataItemTableView = where("Document Type"=const(Payment));
            RequestFilterFields = "Posting Date", "Vendor No.";

            column(Posting_Date; format("Posting Date"))
            {
            }
            column(PaymentMethod; "Payment Method Code")
            {
            }
            column(VendorName; "Vendor Name")
            {
            }
            column(VendPostingGrp; "Vendor Posting Group")
            {
            }
            column(Amount__LCY_; "Amount (LCY)")
            {
            }
            column(Bal__Account_No_; "Vendor No.")
            {
            }
            column(External_Document_No_; "External Document No.")
            {
            }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemTableView = where("Document Type"=const(Payment));
                RequestFilterFields = "Bank Account No.";
                DataItemLink = "Document No."=field("Document No.");

                column(CheckNo; CheckNo)
                {
                }
                column(Bank_Account_No_; "Bank Account No.")
                {
                }
                column(BankAccName; BankAccName)
                {
                }
                trigger OnAfterGetRecord()
                begin
                    CheckNo:='';
                    BankAccName:='';
                    BankAccount.get("Bank Account Ledger Entry"."Bank Account No.");
                    BankAccName:=BankAccount.Name;
                    CheckLedgerEntry.Reset();
                    CheckLedgerEntry.SetRange("Document No.", "Bank Account Ledger Entry"."Document No.");
                    if CheckLedgerEntry.FindFirst()then CheckNo:=CheckLedgerEntry."Check No.";
                end;
            }
        }
    }
    var CheckLedgerEntry: Record "Check Ledger Entry";
    BankAccount: Record "Bank Account";
    BankAccName: Text;
    CheckNo: Text;
}
