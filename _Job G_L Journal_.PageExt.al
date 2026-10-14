pageextension 50008 "Job G/L Journal" extends "Job G/L Journal"
{
    actions
    {
        addafter(Reconcile)
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
                    UploadPayrollJnl: Report "LBMC Upload Payroll Job Jnl.";
                begin
                    Clear(UploadPayrollJnl);
                    UploadPayrollJnl.SetGenJnlTempBatch(Rec."Journal Template Name", Rec."Journal Batch Name", Rec.BssiEntityID);
                    UploadPayrollJnl.RunModal();
                end;
            }
        }
    }
}
