table 50015 "LBMC Job Fixed Asset No."
{
    fields
    {
        field(1; "Job No."; Code[20])
        {
        }
        field(2; "Entry No."; Integer)
        {
        }
        field(3; "Asset No."; Code[20])
        {
        }
        field(4; "Project Task No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Job No.", "Entry No.", "Asset No.")
        {
            Clustered = true;
        }
    }
}
