report 50013 "LBMC Cust. Payment Register"
{
    Caption = 'Customer Payment Register';
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/CustPaymentRegister.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = where("Document Type"=const(Payment));
            RequestFilterFields = "Posting Date", "Customer No.";

            column(Posting_Date; format("Posting Date"))
            {
            }
            column(PaymentMethod; "Payment Method Code")
            {
            }
            column(VendorName; CustName)
            {
            }
            column(VendPostingGrp; "Customer Posting Group")
            {
            }
            column(Bal__Account_No_; "Customer No.")
            {
            }
            column(Amount__LCY_; "Amount (LCY)")
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
            trigger OnAfterGetRecord()
            begin
                CustName:='';
                if Customer.get("Cust. Ledger Entry"."Customer No.")then CustName:=Customer.Name;
            end;
        }
    }
    var CheckLedgerEntry: Record "Check Ledger Entry";
    BankAccount: Record "Bank Account";
    Customer: Record Customer;
    BankAccName: Text;
    CheckNo: Text;
    CustName: Text;
}
