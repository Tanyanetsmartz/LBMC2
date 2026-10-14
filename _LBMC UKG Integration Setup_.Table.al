table 50004 "LBMC UKG Integration Setup"
{
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; "Def. Base Unit of Measure"; Code[20])
        {
            TableRelation = "Resource Unit of Measure".Code;
        }
        field(3; "Use Time Sheet"; Boolean)
        {
        }
        field(4; "Def. Tax Group Code"; Code[20])
        {
            TableRelation = "Tax Group";
        }
        field(5; "Def. Gen. Prod. Posting Group"; Code[20])
        {
            TableRelation = "Gen. Product Posting Group";
        }
        field(6; "Def. VAT Prod. Posting Group"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";
        }
        field(7; "Gen. Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template" where(Type=const(General));
        }
        field(8; "Gen. Journal Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name"=field("Gen. Journal Template"));
        }
        field(9; "Job Journal Template"; Code[20])
        {
            TableRelation = "Job Journal Template";
        }
        field(10; "Job Journal Batch"; Code[20])
        {
            TableRelation = "Job Journal Batch".Name where("Journal Template Name"=field("Job Journal Template"));
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
