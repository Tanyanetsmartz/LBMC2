page 50026 "LBMC Purch. Order Lines"
{
    SourceTable = "Purchase Line";
    SourceTableView = where("Document Type"=const(Order), Type=const(Item));
    Editable = false;
    PageType = List;
    ApplicationArea = all;
    UsageCategory = Lists;
    Caption = 'Purchase Order Lines';

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Comments; Comments)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    Caption = 'Comments';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Card)
            {
                Image = Order;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;
                ToolTip = ' ';
                RunObject = page "Purchase Order";
                RunPageLink = "Document Type"=field("Document Type"), "No."=field("Document No.");
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Comments:='';
        PurchaseHeader.get(Rec."Document Type", Rec."Document No.");
        PurchCommentLine.Reset();
        PurchCommentLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchCommentLine.SetRange("No.", PurchaseHeader."No.");
        PurchCommentLine.SetRange("Document Line No.", 0);
        if PurchCommentLine.FindSet()then repeat Comments+=PurchCommentLine.Comment + ' ';
            until PurchCommentLine.Next() = 0;
    end;
    var PurchCommentLine: Record "Purch. Comment Line";
    PurchaseHeader: Record "Purchase Header";
    Comments: Text;
}
