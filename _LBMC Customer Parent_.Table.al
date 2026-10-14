table 50000 "LBMC Customer Parent"
{
    LookupPageId = "LBMC Customer Parents";
    DrillDownPageId = "LBMC Customer Parents";

    fields
    {
        field(1; Code; Code[20])
        {
        }
        field(2; Description; Text[80])
        {
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}
