pageextension 50007 "General Journal" extends "General Journal"
{
    actions
    {
        addafter(ImportPayrollTransactions)
        {
            action(UploadPayrollJnl)
            {
                Caption = 'BB - Upload Payroll Entries';
                ApplicationArea = all;
                Image = Payroll;
                ToolTip = ' ';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    UploadPayrollJnl: Report "LBMC Upload Payroll Jnl.";
                begin
                    Clear(UploadPayrollJnl);
                    UploadPayrollJnl.SetGenJnlTempBatch(Rec."Journal Template Name", Rec."Journal Batch Name", Rec.BssiEntityID);
                    UploadPayrollJnl.RunModal();
                end;
            }
        }
    }
}
