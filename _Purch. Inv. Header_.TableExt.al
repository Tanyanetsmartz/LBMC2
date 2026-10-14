tableextension 50008 "Purch. Inv. Header" extends "Purch. Inv. Header"
{
    fields
    {
        field(50000; "Acq. Cost Posted"; Boolean)
        {
            ObsoleteState = Removed;
            ObsoleteReason = 'Version Update';
        }
        field(60001; "Consturction PO"; Boolean)
        {
        }
        field(60002; "Contract Code"; Code[20])
        {
            TableRelation = "LBMC Vendor Contract".Code where("Vendor No."=field("Buy-from Vendor No."));
        }
    }
}
