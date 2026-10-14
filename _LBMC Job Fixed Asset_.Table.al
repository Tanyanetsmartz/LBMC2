table 50014 "LBMC Job Fixed Asset"
{
    fields
    {
        field(1; "Job No."; Code[20])
        {
        }
        field(2; "Entry No."; Integer)
        {
        }
        field(3; "FA Template Code"; Code[20])
        {
            TableRelation = "LBMC FA Template";
        }
        field(4; Description; Text[100])
        {
        }
        field(5; "No. of Assets"; Integer)
        {
        }
        field(6; "Acquisition Cost"; Decimal)
        {
            // trigger OnValidate()
            // var
            //     local_Check: Decimal;
            // begin
            //     local_Check := Abs("Total Cost" - "Acquired Cost");
            //     if "Acquisition Cost" > local_Check then begin
            //         Error('Acquisition Cost should not more than Total Cost - Acquired Cost');
            //     end;
            // end;
        }
        field(7; "Asset Nos"; Integer)
        {
        }
        field(8; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
    }
    keys
    {
        key(PK; "Job No.", "Entry No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        "No. of Assets" := 1;
    end;
}
