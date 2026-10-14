pageextension 50001 "Job Card" extends "Job Card"
{
    layout
    {
        addafter("Project Manager")
        {
            field("SF Work Order No."; Rec."SF Work Order No.")
            {
                ApplicationArea = all;
                Editable = false;
                ToolTip = ' ';
                Caption = 'SF Work Order No.';
            }
        }
        addafter("Last Date Modified")
        {
            field("No. of Assets"; Rec."No. of Assets")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
        }
    }
    actions
    {
        addafter("W&IP")
        {
            action(CloseJob)
            {
                Caption = 'Close';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = ' ';

                trigger OnAction()
                var
                    LocText0001Txt: TextConst ENU = 'Do you wish to close this job?';
                begin
                    Rec.TestField("Ending Date");
                    if not Confirm(LocText0001Txt, true)then Error('');
                    Rec.Status:=Rec.Status::Completed;
                    Rec.Modify(true);
                    Message('Job has been set to Completed');
                end;
            }
            action(Assets)
            {
                Caption = 'Assets';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                ToolTip = ' ';
                RunObject = page "LBMC Job Asset List";
                RunPageMode = Edit;
                RunPageLink = "Job No."=field("No.");
            }
        }
    }
//BLB-19_Shivam_Ag++
// trigger OnAfterGetRecord()
// var
//     myInt: Integer;
//     JobTask: Record "Job Task";
// begin
//     if rec.Status = Rec.Status::Completed then begin
//         rec.Blocked := rec.Blocked::All;
//     end;
//     //Total Acquired Cost
//     JobTask.Reset();
//     JobTask.SetRange("Job No.", Rec."No.");
//     if JobTask.FindFirst() then begin
//         repeat begin
//             JobTask.CalcFields("Capitalized Amount");
//             rec."Total Acquired Cost" += JobTask."Capitalized Amount";
//         end until JobTask.Next() = 0;
//     end;
// end;
//BLB-19_Shivam_Ag--
}
