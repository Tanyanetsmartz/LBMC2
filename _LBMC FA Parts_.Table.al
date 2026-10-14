table 50011 "LBMC FA Parts"
{
    LookupPageId = "LBMC FA Parts";
    DrillDownPageId = "LBMC FA Parts";
    Caption = 'FA Asset Tag';

    fields
    {
        field(1; "Part No."; Code[50])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
        }
        field(4; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(1));
        }
    }
    keys
    {
        key(PK; "Global Dimension 1 Code", "Part No.")
        {
            Clustered = true;
        }
    }
}
