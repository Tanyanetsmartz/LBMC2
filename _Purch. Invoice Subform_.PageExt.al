pageextension 50025 "Purch. Invoice Subform" extends "Purch. Invoice Subform"
{
    layout
    {
        addafter("Direct Unit Cost")
        {
            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
            field("Order Line No."; Rec."Order Line No.")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
        /*
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ApplicationArea = all;
                ToolTip = ' ';
                Visible = DimVisible3;
                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                end;
            }
            field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
            {
                ApplicationArea = all;
                ToolTip = ' ';
                Visible = DimVisible4;
                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
                end;
            }
            field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
            {
                ApplicationArea = all;
                ToolTip = ' ';
                Visible = DimVisible5;
                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(5, Rec."Shortcut Dimension 5 Code");
                end;
            }
            field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
            {
                ApplicationArea = all;
                ToolTip = ' ';
                Visible = DimVisible6;
                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(6, Rec."Shortcut Dimension 6 Code");
                end;
            }
            field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
            {
                ApplicationArea = all;
                ToolTip = ' ';
                Visible = DimVisible7;
                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(7, Rec."Shortcut Dimension 7 Code");
                end;
            }
            field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
            {
                ApplicationArea = all;
                ToolTip = ' ';
                Visible = DimVisible8;
                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(8, Rec."Shortcut Dimension 8 Code");
                end;
            }
            */
        }
    }
}
