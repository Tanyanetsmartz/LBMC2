pageextension 50020 "Recurring General Journal" extends "Recurring General Journal"
{
    actions
    {
        addafter(SetDimFilters)
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
                    UploadPayrollJnl: Report "LBMC Upload Rec. Payroll Jnl.";
                begin
                    Clear(UploadPayrollJnl);
                    UploadPayrollJnl.SetGenJnlTempBatch(Rec."Journal Template Name", Rec."Journal Batch Name", Rec.BssiEntityID);
                    UploadPayrollJnl.RunModal();
                end;
            }
        }
    }
}
