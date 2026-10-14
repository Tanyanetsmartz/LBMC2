table 50005 "LBMC Tax Slab Setup"
{
    Caption = 'Tax Slab Setup';

    fields
    {
        field(1; "Charge No."; Code[20])
        {
            TableRelation = Item."No." where(Type=const(Service));
        }
        /*
        field(2; "Applies to Item No."; Code[20])
        {
            TableRelation = Item."No.";
        }
        */
        field(3; Description; Text[100])
        {
        }
        field(4; Rate; Decimal)
        {
        }
        field(5; "Start Date"; Date)
        {
        }
        field(6; "End Date"; Date)
        {
        }
    }
    keys
    {
        key(PK; "Charge No.", "Start Date")
        {
            Clustered = true;
        }
    }
}
