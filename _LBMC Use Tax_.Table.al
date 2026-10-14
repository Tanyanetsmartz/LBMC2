table 50017 "LBMC Use Tax"
{
    DrillDownPageId = "LBMC Use Tax List";
    LookupPageId = "LBMC Use Tax List";

    fields
    {
        field(1; State; Code[20])
        {
        }
        field(2; "Tax %"; Decimal)
        {
        }
    }
    keys
    {
        key(PK; State)
        {
            Clustered = true;
        }
    }
}
