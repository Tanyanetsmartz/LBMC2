table 50019 "LBMC Vendor Contract"
{
    DrillDownPageId = "LBMC Vendor Contracts";
    LookupPageId = "LBMC Vendor Contracts";
    Caption = 'Vendor Contract';

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
        }
        field(2; Code; Code[20])
        {
        }
        field(3; Description; Text[250])
        {
        }
        field(4; Date; Date)
        {
        }
    }
    keys
    {
        key(PK; "Vendor No.", Code)
        {
            Clustered = true;
        }
    }
}
