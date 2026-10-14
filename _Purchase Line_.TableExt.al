tableextension 50006 "Purchase Line" extends "Purchase Line"
{
    fields
    {
        field(50000; "FA Template Code"; Code[20])
        {
            TableRelation = "LBMC FA Template";
            ObsoleteState = Removed;
            ObsoleteReason = 'Version Update';
        }
        field(50001; "State"; Code[20])
        {
            TableRelation = "LBMC Use Tax";
            Caption = 'Use Tax';
        }
        field(50002; "Posting Group 2"; Code[20])
        {
            TableRelation = IF(Type=CONST(Item))"Inventory Posting Group"
            ELSE IF(Type=CONST("Fixed Asset"))"FA Posting Group";
            Caption = 'LBMC Posting Group';

            trigger OnValidate()
            begin
                "Posting Group":="Posting Group 2";
            end;
        }
        field(50003; "Shortcut Dimension 3 Code"; Code[20])
        {
            //CaptionClass = '1,2,3';
            CaptionClass = GetCustomCaption(3);
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(3), "Dimension Value Type"=CONST(Standard), Blocked=CONST(false));
        }
        field(50004; "Shortcut Dimension 4 Code"; Code[20])
        {
            //CaptionClass = '1,2,4';
            CaptionClass = GetCustomCaption(4);
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(4), "Dimension Value Type"=CONST(Standard), Blocked=CONST(false));
        }
        field(50005; "Shortcut Dimension 5 Code"; Code[20])
        {
            //CaptionClass = '1,2,5';
            CaptionClass = GetCustomCaption(5);
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(5), "Dimension Value Type"=CONST(Standard), Blocked=CONST(false));
        }
        field(50006; "Shortcut Dimension 6 Code"; Code[20])
        {
            //CaptionClass = '1,2,6';
            CaptionClass = GetCustomCaption(6);
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(6), "Dimension Value Type"=CONST(Standard), Blocked=CONST(false));
        }
        field(50007; "Shortcut Dimension 7 Code"; Code[20])
        {
            //CaptionClass = '1,2,7';
            CaptionClass = GetCustomCaption(7);
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(7), "Dimension Value Type"=CONST(Standard), Blocked=CONST(false));
        }
        field(50008; "Shortcut Dimension 8 Code"; Code[20])
        {
            //CaptionClass = '1,2,8';
            CaptionClass = GetCustomCaption(8);
            Caption = 'Shortcut Dimension 8 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(8), "Dimension Value Type"=CONST(Standard), Blocked=CONST(false));
        }
    }
    procedure GetCustomCaption(i: Integer): Text var
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get();
        if i = 1 then if GLSetup."Shortcut Dimension 1 Code" <> '' then exit(GLSetup."Shortcut Dimension 1 Code" + ' New');
        if i = 2 then if GLSetup."Shortcut Dimension 2 Code" <> '' then exit(GLSetup."Shortcut Dimension 2 Code" + ' New');
        if i = 3 then if GLSetup."Shortcut Dimension 3 Code" <> '' then exit(GLSetup."Shortcut Dimension 3 Code" + ' New');
        if i = 4 then if GLSetup."Shortcut Dimension 4 Code" <> '' then exit(GLSetup."Shortcut Dimension 4 Code" + ' New');
        if i = 5 then if GLSetup."Shortcut Dimension 5 Code" <> '' then exit(GLSetup."Shortcut Dimension 5 Code" + ' New');
        if i = 6 then if GLSetup."Shortcut Dimension 6 Code" <> '' then exit(GLSetup."Shortcut Dimension 6 Code" + ' New');
        if i = 7 then if GLSetup."Shortcut Dimension 7 Code" <> '' then exit(GLSetup."Shortcut Dimension 7 Code" + ' New');
        if i = 8 then if GLSetup."Shortcut Dimension 8 Code" <> '' then exit(GLSetup."Shortcut Dimension 8 Code" + ' New');
    end;
}
