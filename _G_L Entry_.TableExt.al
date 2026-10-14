tableextension 50004 "G/L Entry" extends "G/L Entry"
{
    fields
    {
        field(50000; "Resource No."; Code[20])
        {
            TableRelation = Resource;
        }
        field(50001; "Vendor Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No."=field("Source No.")));
            Editable = false;
        }
    }
}
