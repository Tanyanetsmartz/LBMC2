pageextension 50005 "Posted Sales Invoice" extends "Posted Sales Invoice"
{
    actions
    {
        addafter(AttachAsPDF)
        {
            action(SalesInvReportBB)
            {
                Caption = 'Sales Invoice';
                ApplicationArea = all;
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                ToolTip = ' ';

                trigger OnAction()
                var
                    SalesInvHdr: Record "Sales Invoice Header";
                    SalesInvReport: Report "LBMC Sales Invoice";
                begin
                    SalesInvHdr.Reset();
                    SalesInvHdr.SetRange("No.", Rec."No.");
                    Clear(SalesInvReport);
                    SalesInvReport.SetTableView(SalesInvHdr);
                    SalesInvReport.RunModal();
                end;
            }
        }
    }
}
