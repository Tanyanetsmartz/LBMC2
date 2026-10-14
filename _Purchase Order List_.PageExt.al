pageextension 50023 "Purchase Order List" extends "Purchase Order List"
{
    actions
    {
        addafter(Print)
        {
            action(UseTax)
            {
                Caption = 'Print Use Tax';
                Image = Report2;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = ' ';

                trigger OnAction()
                begin
                    Report.RunModal(Report::"Use Tax");
                end;
            }
        }
    }
}
