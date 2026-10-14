page 50018 "LBMC Job Asset List"
{
    SourceTable = "LBMC Job Fixed Asset";
    Caption = 'Job Asset List';
    PageType = List;
    Editable = true;
    AutoSplitKey = true;
    DelayedInsert = false;
    ModifyAllowed = true;
    SaveValues = true;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                // field(JobTaskNo; Rec.JobTaskNo)
                // {
                //     ApplicationArea = All;
                // }
                field("FA Template Code"; Rec."FA Template Code")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("No. of Assets"; Rec."No. of Assets")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                // field("Fixed Assets"; rec."Fixed Assets")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Select Fixed Assets';
                //     trigger OnLookup(var Text: Text): Boolean
                //     var
                //         Fixed_Asset_Page: Page "Fixed Asset List";
                //         Fixed_Asset_Tab: Record "Fixed Asset";
                //     begin
                //         Clear(rec."Fixed Assets");
                //         Fixed_Asset_Tab.Reset();
                //         Fixed_Asset_Tab.SetRange("Job No.", rec."Job No.");
                //         Fixed_Asset_Tab.SetRange("Project Task No.", rec.JobTaskNo);
                //         if Fixed_Asset_Tab.FindFirst() then;
                //         Fixed_Asset_Page.SetTableView(Fixed_Asset_Tab);
                //         Fixed_Asset_Page.LookupMode(true);
                //         if Fixed_Asset_Page.RunModal() = Action::LookupOK then begin
                //             Fixed_Asset_Page.SetSelectionFilter(Fixed_Asset_Tab);
                //             text := '';
                //             if Fixed_Asset_Tab.FindFirst() then begin
                //                 repeat
                //                     text := text + Format(Fixed_Asset_Tab."No.") + '|';
                //                 until Fixed_Asset_Tab.Next() = 0;
                //                 text := CopyStr(text, 1, StrLen(text) - 1);
                //             end;
                //             exit(true);
                //         end else
                //             exit(false);
                //     end;
                //     trigger OnValidate()
                //     var
                //         myInt: Integer;
                //     begin
                //         if xRec."Fixed Assets" <> Rec."Fixed Assets" then
                //             //Message('demo');
                //         rec."Fixed Assets" := rec."Fixed Assets";
                //     end;
                // }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Acquisition Cost"; Rec."Acquisition Cost")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    Editable = true;
                }
            // field("Total Cost"; Rec."Total Cost")
            // {
            //     ApplicationArea = all;
            //     Editable = false;
            // }
            // field("Acquired Cost"; Rec."Acquired Cost")
            // {
            //     ApplicationArea = all;
            //     Editable = false;
            // }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(AutoCalc)
            {
                Caption = 'Auto Calc. Acq. Cost';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Calculate;
                ToolTip = ' ';

                trigger OnAction()
                var
                    Job: Record Job;
                    LBMCBBGeneralFunc: Codeunit "LBMC BB General Func.";
                begin
                    Job.get(Rec."Job No.");
                    LBMCBBGeneralFunc.AutoCalcAcqCost(Job);
                    CurrPage.Update();
                end;
            }
            action(Create)
            {
                Caption = 'Create Assets';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = FixedAssets;
                ToolTip = ' ';

                trigger OnAction()
                var
                    Job: Record Job;
                    LBMCBBGeneralFunc: Codeunit "LBMC BB General Func.";
                    LBMCJobFixedAsset: Record "LBMC Job Fixed Asset";
                begin
                    Job.get(Rec."Job No.");
                    //CurrPage.SetSelectionFilter(LBMCJobFixedAsset);
                    //CurrPage.SetSelectionFilter(Rec);
                    // if Rec.FindSet() then begin
                    //     repeat
                    //         Message('%1 %2', Rec.JobTaskNo, rec."FA Template Code");
                    //     until Rec.Next() = 0;
                    // end;
                    LBMCBBGeneralFunc.CreateFixedAssets(Job);
                    //LBMCBBGeneralFunc.CreateFixedAssets(Job, Rec);
                    CurrPage.Update();
                end;
            }
            action(AcqCost)
            {
                Caption = 'Pass Acq. Cost';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Cost;
                ToolTip = ' ';

                trigger OnAction()
                var
                    Job: Record Job;
                    LBMCBBGeneralFunc: Codeunit "LBMC BB General Func.";
                    LBMC_Job_Fixed_asset: Record "LBMC Job Fixed Asset";
                begin
                    Job.get(Rec."Job No.");
                    // CurrPage.SetSelectionFilter(Rec);
                    // if rec.FindSet() then begin
                    //     repeat begin
                    //         if rec."Fixed Assets" = '' then begin
                    //             Error('Select Fixed Assets for that Project task No.');
                    //         end else begin
                    LBMCBBGeneralFunc.PostFAAcqCost(Job);
                    //LBMCBBGeneralFunc.PostFAAcqCost(Job, Rec);
                    //         end;
                    //     end until rec.Next() = 0;
                    // end;
                    // LBMC_Job_Fixed_asset.Reset();
                    // LBMC_Job_Fixed_asset.SetRange("Job No.", Rec."Job No.");
                    // CurrPage.SetTableView(LBMC_Job_Fixed_asset);
                    CurrPage.Update();
                //CurrPage.Update();
                end;
            }
        // action("Fixed Asset G/L Journals")
        // {
        //     Caption = 'Fixed Asset G/L Journals';
        //     Promoted = true;
        //     PromotedCategory = Process;
        //     PromotedIsBig = true;
        //     Image = Journals;
        //     ApplicationArea = all;
        //     RunObject = page "Fixed Asset G/L Journal";
        //     RunPageMode = Edit;
        //     //RunPageLink = "Journal Template Name" = field();
        // }
        }
    }
//BLB-19_Shivam_Ag++
// trigger OnOpenPage()
// var
//     myInt: Integer;
//     FA_LedgerEntries: Record "FA Ledger Entry";
//     LBMC_JobFixedAsset: Record "LBMC Job Fixed Asset";
//     Job_Task: Record "Job Task";
// begin
//     // FA_LedgerEntries.Reset();
//     // FA_LedgerEntries.SetRange("Project No.", Rec."Job No.");
//     // FA_LedgerEntries.SetRange("Project Task No.", rec.JobTaskNo);
//     // FA_LedgerEntries.SetRange(EntryNo_JobAssetList, rec."Entry No.");
//     // if FA_LedgerEntries.FindFirst() then begin
//     //     repeat begin
//     //         rec."Acquired Cost" += FA_LedgerEntries.Amount;
//     //     end until FA_LedgerEntries.next = 0;
//     //     rec."Acquisition Cost" := rec."Total Cost" - rec."Acquired Cost";
//     // end;
//     LBMC_JobFixedAsset.Reset();
//     LBMC_JobFixedAsset.SetRange("Job No.", Rec."Job No.");
//     if LBMC_JobFixedAsset.FindSet() then begin
//         repeat begin
//             Job_Task.Reset();
//             Job_Task.SetRange("Job No.", LBMC_JobFixedAsset."Job No.");
//             Job_Task.SetRange("Job Task No.", LBMC_JobFixedAsset.JobTaskNo);
//             if Job_Task.FindFirst() then begin
//                 Job_Task.CalcFields("Capitalized Amount");
//                 LBMC_JobFixedAsset."Acquired Cost" := Job_Task."Capitalized Amount";
//                 //LBMC_JobFixedAsset."Acquisition Cost" := LBMC_JobFixedAsset."Total Cost" - LBMC_JobFixedAsset."Acquired Cost";
//                 LBMC_JobFixedAsset.Modify();
//             end;
//         end until LBMC_JobFixedAsset.Next() = 0;
//     end;
// end;
//BLB-19_Shivam_Ag--
}
