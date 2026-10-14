tableextension 50003 "Job" extends Job
{
    fields
    {
        field(50000; "SF Work Order No."; Code[20])
        {
        }
        field(50001; "No. of Assets"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Fixed Asset" where("Job No."=field("No.")));
        }
        field(50002; "Assets Created"; Boolean)
        {
            //BLB-19_Shivam_Ag++
            //Editable = true;
            Editable = false;
        //BLB-19_Shivam_Ag--
        }
        field(50003; "Acq. Cost Posted"; Boolean)
        {
            Editable = false;
        }
    }
// trigger OnDelete()
// var
//     LBMCJobFixedAsset: Record "LBMC Job Fixed Asset";
// begin
//     LBMCJobFixedAsset.Reset();
//     LBMCJobFixedAsset.SetRange("Job No.", "No.");
//     LBMCJobFixedAsset.DeleteAll(true);
// end;
}
