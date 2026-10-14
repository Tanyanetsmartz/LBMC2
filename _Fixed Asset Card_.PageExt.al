pageextension 50015 "Fixed Asset Card" extends "Fixed Asset Card"
{
    layout
    {
        addafter("Last Date Modified")
        {
            field("FA PArt"; Rec."FA Part")
            {
                ApplicationArea = all;
                ToolTip = ' ';
                Caption = 'FA Part';
            }
            field("FA Exchange"; Rec."FA Exchange")
            {
                ApplicationArea = all;
                ToolTip = ' ';
                Caption = 'FA Exchange';
            }
            field("FA Site"; Rec."FA Site")
            {
                ApplicationArea = all;
                ToolTip = ' ';
                Caption = 'FA Site';
            }
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
            field("FA Template Code"; Rec."FA Template Code")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
            field("Purch. Receipt No."; Rec."Purch. Receipt No.")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
            field("Purch. Receipt Line No."; Rec."Purch. Receipt Line No.")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
        }
    }
}
