pageextension 50006 "Sales Journal" extends "Sales Journal"
{
    actions
    {
        addafter("Apply Entries")
        {
            action(UploadLines)
            {
                Caption = 'Upload';
                Image = UpdateXML;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = ' ';

                trigger OnAction()
                var
                    UploadSalesJnl: Report "LBMC Upload Sales Jnl.";
                begin
                    clear(UploadSalesJnl);
                    UploadSalesJnl.SetGenJnlTempBatch(Rec."Journal Template Name", Rec."Journal Batch Name", Rec.BssiEntityID);
                    UploadSalesJnl.RunModal();
                end;
            }
        }
    }
}
