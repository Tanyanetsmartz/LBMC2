table 50003 "LBMC FA Template"
{
    DrillDownPageId = "LBMC FA Template List";
    LookupPageId = "LBMC FA Template List";

    fields
    {
        field(1; "Template Code"; Code[20])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(4; "FA Class Code"; Code[20])
        {
            TableRelation = "FA Class";
        }
        field(5; "FA Subclass Code"; Code[20])
        {
            TableRelation = "FA Subclass";
        }
        field(6; "Posting Group"; Code[20])
        {
            TableRelation = "FA Posting Group";
        }
        field(7; "Depreciation Method";Enum "FA Depreciation Method")
        {
        }
        field(8; "No. of Depreciation Years"; Integer)
        {
        }
        field(9; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
        }
        field(10; "Maintenance Vendor No."; Code[20])
        {
            TableRelation = Vendor;
        }
        field(11; "Under Maintenance"; Boolean)
        {
        }
    }
    keys
    {
        key(PK; "Template Code")
        {
            Clustered = true;
        }
    }
}
