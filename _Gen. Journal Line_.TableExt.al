tableextension 50005 "Gen. Journal Line" extends "Gen. Journal Line"
{

    fields
    {
        field(50000; "Resource No."; Code[20])
        {
            TableRelation = Resource;
        }
    }
}
