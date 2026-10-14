tableextension 50016 Item extends Item
{
    fields
    {
        field(50000; "Fixed Asset Item"; Boolean)
        {
        }
        field(50001; "Parent Category Code"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Item Category"."Parent Category" where(Code=field("Item Category Code")));
            Editable = false;
            TableRelation = "Item Category" where("Parent Category"=const(''));
        }
        field(50002; "Quote Comp. Qty"; Decimal)
        {
        }
    }
}
