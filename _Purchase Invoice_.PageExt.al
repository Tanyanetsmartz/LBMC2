pageextension 50027 "Purchase Invoice" extends "Purchase Invoice"
{
    layout
    {
        addafter(Status)
        {
            field("Consturction PO"; Rec."Consturction PO")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
            field("Contract Code"; Rec."Contract Code")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
        }
    }
    actions
    {
        modify(Preview)
        {
            trigger OnBeforeAction()
            begin
                UpdateDimensions();
            end;
        }
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                UpdateDimensions();
            end;
        }
        modify(PostAndNew)
        {
            trigger OnBeforeAction()
            begin
                UpdateDimensions();
            end;
        }
        modify(PostAndPrint)
        {
            trigger OnBeforeAction()
            begin
                UpdateDimensions();
            end;
        }
    }
    procedure UpdateDimensions()
    var
        PurchLine: Record "Purchase Line";
    begin
        PurchLine.Reset();
        PurchLine.SetRange("Document Type", Rec."Document Type");
        PurchLine.SetRange("Document No.", Rec."No.");
        if PurchLine.FindSet()then repeat if PurchLine."Shortcut Dimension 1 Code" <> '' then PurchLine.Validate("Shortcut Dimension 1 Code");
                PurchLine.Modify(true);
            until PurchLine.Next() = 0;
        Commit();
    end;
}
