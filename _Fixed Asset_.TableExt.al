tableextension 50015 "Fixed Asset" extends "Fixed Asset"
{
    fields
    {
        field(50000; "FA Part"; code[50])
        {
            Caption = 'FA Asset Tag';
            TableRelation = "LBMC FA Parts"."Part No." where("Global Dimension 1 Code"=field("Global Dimension 1 Code"));
        }
        field(50001; "FA Exchange"; Code[20])
        {
            TableRelation = "LBMC FA Exchange".Code where("Global Dimension 1 Code"=field("Global Dimension 1 Code"));
        }
        field(50002; "FA Site"; Code[20])
        {
            Caption = 'FA Site Code';
            TableRelation = "LBMC FA Site".Code where("Global Dimension 1 Code"=field("Global Dimension 1 Code"));
        }
        field(50003; "Job No."; Code[20])
        {
            TableRelation = Job;
            Editable = false;
        }
        field(50004; "FA Template Code"; Code[20])
        {
            Editable = false;
            TableRelation = "LBMC FA Template";
        }
        field(50005; "Purch. Receipt No."; Code[20])
        {
            Editable = false;
        }
        field(50006; "Purch. Receipt Line No."; Integer)
        {
            Editable = false;
        }
    }
}
