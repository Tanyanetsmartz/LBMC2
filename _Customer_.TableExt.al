tableextension 50000 "Customer" extends Customer
{
    fields
    {
        field(50000; "Parent Code"; Code[20])
        {
            TableRelation = "LBMC Customer Parent";
        }
    }
}
