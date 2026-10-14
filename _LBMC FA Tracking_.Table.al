table 50018 "LBMC FA Tracking"
{
    Caption = 'Fixed Asset Tracking';
    LookupPageId = "LBMC FA Tracking";
    DrillDownPageId = "LBMC FA Tracking";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Asset Tag Number"; Code[20])
        {
        }
        field(3; "Serial Number"; Code[20])
        {
        }
        field(4; "Item No."; Code[20])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            var
                Item: Record Item;
            begin
                if xRec."Item No." <> "Item No." then if "Item No." = '' then Description:=''
                    else
                    begin
                        Item.Get("Item No.");
                        Description:=Item.Description;
                    end;
            end;
        }
        field(5; Description; Text[100])
        {
            Editable = false;
        }
        field(6; "Job No."; Code[20])
        {
            TableRelation = Job;
        }
        field(7; "Purchase Order No."; Code[20])
        {
            TableRelation = "Purchase Header"."No." where("Document Type"=const(Order));
        }
        field(8; "Exchnage Code"; Code[20])
        {
            TableRelation = "LBMC FA Exchange".Code;
        }
        field(9; "Site / Location"; Code[20])
        {
            TableRelation = "LBMC FA Site".Code;
        }
        field(10; "Final Job No."; Code[20])
        {
            TableRelation = Job;
        }
        field(11; "Send to Accounting"; Boolean)
        {
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
