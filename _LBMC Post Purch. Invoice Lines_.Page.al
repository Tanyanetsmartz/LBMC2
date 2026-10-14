page 50034 "LBMC Post Purch. Invoice Lines"
{
    PageType = List;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    SourceTable = "Purch. Inv. Line";
    Caption = 'Posted Purch. Invoice Lines';
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
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
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    Visible = DimVisible1;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    Visible = DimVisible2;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(3), "Dimension Value Type"=CONST(Standard), Blocked=CONST(false));
                    Visible = DimVisible3;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(4), "Dimension Value Type"=CONST(Standard), Blocked=CONST(false));
                    Visible = DimVisible4;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(5), "Dimension Value Type"=CONST(Standard), Blocked=CONST(false));
                    Visible = DimVisible5;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(6), "Dimension Value Type"=CONST(Standard), Blocked=CONST(false));
                    Visible = DimVisible6;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(7), "Dimension Value Type"=CONST(Standard), Blocked=CONST(false));
                    Visible = DimVisible7;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(8), "Dimension Value Type"=CONST(Standard), Blocked=CONST(false));
                    Visible = DimVisible8;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(View)
            {
                Image = View;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = all;
                ToolTip = ' ';
                RunObject = page "Posted Purchase Invoice";
                RunPageLink = "No."=field("Document No.");
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;
    trigger OnOpenPage()
    begin
        SetDimensionsVisibility();
    end;
    local procedure SetDimensionsVisibility()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimVisible1:=false;
        DimVisible2:=false;
        DimVisible3:=false;
        DimVisible4:=false;
        DimVisible5:=false;
        DimVisible6:=false;
        DimVisible7:=false;
        DimVisible8:=false;
        DimMgt.UseShortcutDims(DimVisible1, DimVisible2, DimVisible3, DimVisible4, DimVisible5, DimVisible6, DimVisible7, DimVisible8);
        Clear(DimMgt);
    end;
    var ShortcutDimCode: array[8]of Code[20];
    DimVisible1: Boolean;
    DimVisible2: Boolean;
    DimVisible3: Boolean;
    DimVisible4: Boolean;
    DimVisible5: Boolean;
    DimVisible6: Boolean;
    DimVisible7: Boolean;
    DimVisible8: Boolean;
}
