table 50012 "LBMC FA Exchange"
{
    DrillDownPageId = "LBMC FA Exchange";
    LookupPageId = "LBMC FA Exchange";

    fields
    {
        field(1; Code; Code[20])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(1));
        }
    }
    keys
    {
        key(PK; "Global Dimension 1 Code", Code)
        {
            Clustered = true;
        }
    }
}
