codeunit 50002 "LBMC BB General Func."
{
    Permissions = tabledata "Purch. Inv. Header"=rm;

    trigger OnRun()
    begin
    end;
    procedure CalculateTax(DocumentNo: Code[35])
    var
        BssiArcbBillingScheduleHdr: Record BssiArcbBillingScheduleHdr;
        LBMCTaxSlabSetup: Record "LBMC Tax Slab Setup";
        BssiArcbBillingScheduleLine: Record BssiArcbBillingScheduleLine;
        TotalBillAmt: Decimal;
        GlbWindowDialog: Dialog;
        Text00001Txt: TextConst ENU = '@1@@@@@@@@@@\\';
        TotalCnt: Integer;
        LineCnt: Integer;
    begin
        GlbWindowDialog.Open(Text00001Txt);
        BssiArcbBillingScheduleHdr.Reset();
        if DocumentNo <> '' then BssiArcbBillingScheduleHdr.SetRange(BssiArcbBillingScheduleNumber, DocumentNo);
        TotalCnt:=BssiArcbBillingScheduleHdr.Count;
        if BssiArcbBillingScheduleHdr.FindSet()then repeat LineCnt+=1;
                GlbWindowDialog.Update(1, Round(LineCnt / TotalCnt * 10000, 1));
                BssiArcbBillingScheduleLine.Reset();
                BssiArcbBillingScheduleLine.SetRange(BssiArcbBillingScheduleNumber, BssiArcbBillingScheduleHdr.BssiArcbBillingScheduleNumber);
                BssiArcbBillingScheduleLine.SetRange(Bssi_UDF_L1, ''); //Circuit ID
                BssiArcbBillingScheduleLine.ModifyAll("Unit Price", 0, true);
                BssiArcbBillingScheduleLine.Reset();
                BssiArcbBillingScheduleLine.SetRange(BssiArcbBillingScheduleNumber, BssiArcbBillingScheduleHdr.BssiArcbBillingScheduleNumber);
                BssiArcbBillingScheduleLine.SetRange("Tax Item Line", false);
                BssiArcbBillingScheduleLine.SetFilter(Bssi_UDF_L1, '<>%1', ''); //Circuit ID
                if BssiArcbBillingScheduleLine.FindSet()then repeat TotalBillAmt+=BssiArcbBillingScheduleLine.Amount;
                    until BssiArcbBillingScheduleLine.Next() = 0;
                BssiArcbBillingScheduleLine.Reset();
                BssiArcbBillingScheduleLine.SetRange(BssiArcbBillingScheduleNumber, BssiArcbBillingScheduleHdr.BssiArcbBillingScheduleNumber);
                BssiArcbBillingScheduleLine.SetRange(Bssi_UDF_L1, ''); //Circuit ID
                if BssiArcbBillingScheduleLine.FindSet()then repeat LBMCTaxSlabSetup.Reset();
                        LBMCTaxSlabSetup.SetRange("Charge No.", BssiArcbBillingScheduleLine."ItemNo.");
                        if LBMCTaxSlabSetup.FindSet()then repeat if(LBMCTaxSlabSetup."End Date" = 0D) or ((BssiArcbBillingScheduleHdr."BssiNext Invoice Date" >= LBMCTaxSlabSetup."Start Date") and (BssiArcbBillingScheduleHdr."BssiNext Invoice Date" <= LBMCTaxSlabSetup."End Date"))then begin
                                    BssiArcbBillingScheduleLine.validate("Unit Price", BssiArcbBillingScheduleLine."Unit Price" + ((TotalBillAmt * LBMCTaxSlabSetup.Rate) / 100));
                                    BssiArcbBillingScheduleLine.Modify(true);
                                end;
                            until LBMCTaxSlabSetup.Next() = 0;
                    until BssiArcbBillingScheduleLine.Next() = 0;
            until BssiArcbBillingScheduleHdr.Next() = 0;
        GlbWindowDialog.Close();
        Message('Tax has been Calculated');
    end;
    /*
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPurchRcptLineInsert', '', false, false)]
    local procedure OnAfterPurchRcptLineInsert(PurchaseLine: Record "Purchase Line"; var PurchRcptLine: Record "Purch. Rcpt. Line"; ItemLedgShptEntryNo: Integer; WhseShip: Boolean; WhseReceive: Boolean; CommitIsSupressed: Boolean; PurchInvHeader: Record "Purch. Inv. Header"; var TempTrackingSpecification: Record "Tracking Specification"; PurchRcptHeader: Record "Purch. Rcpt. Header"; TempWhseRcptHeader: Record "Warehouse Receipt Header"; xPurchLine: Record "Purchase Line");
    var
        Item: Record Item;
    begin
        if PurchaseLine.Type = PurchaseLine.Type::Item then
            if Item.get(PurchaseLine."No.") then
                if Item."Fixed Asset Item" then
                    CreateFixedAssets(PurchaseLine, PurchRcptLine, PurchInvHeader."Posting Date");
    end;

    procedure CreateFixedAssets(PurchaseLine: Record "Purchase Line"; PurchRcptLine: Record "Purch. Rcpt. Line"; PostingDate: Date)
    var
        FixedAsset: Record "Fixed Asset";
        FADepreciationBook: Record "FA Depreciation Book";
        LBMCFATemplate: Record "LBMC FA Template";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        NoOfAssets: Integer;
    begin
        PurchaseLine.TestField("FA Template Code");
        LBMCFATemplate.Get(PurchaseLine."FA Template Code");
        for NoOfAssets := 1 to PurchRcptLine.Quantity do begin
            FixedAsset.Init();
            if LBMCFATemplate."No. Series" = '' then
                FixedAsset."No." := PurchRcptLine."No." + Format(NoOfAssets)
            else
                FixedAsset."No." := NoSeriesManagement.GetNextNo(LBMCFATemplate."No. Series", Today, true);
            FixedAsset.Insert(true);
            FixedAsset.validate(Description, PurchRcptLine.Description);
            FixedAsset.validate("FA Class Code", LBMCFATemplate."FA Class Code");
            FixedAsset.validate("FA Subclass Code", LBMCFATemplate."FA Subclass Code");
            FixedAsset.validate("Global Dimension 1 Code", PurchRcptLine."Shortcut Dimension 1 Code");
            FixedAsset.validate("Global Dimension 2 Code", PurchRcptLine."Shortcut Dimension 2 Code");
            FixedAsset.validate("FA Posting Group", LBMCFATemplate."Posting Group");
            FixedAsset.validate("Vendor No.", LBMCFATemplate."Vendor No.");
            FixedAsset.validate("Maintenance Vendor No.", LBMCFATemplate."Maintenance Vendor No.");
            FixedAsset.validate("Under Maintenance", LBMCFATemplate."Under Maintenance");
            FixedAsset."Job No." := PurchRcptLine."Job No.";
            FixedAsset."Purch. Receipt No." := PurchRcptLine."Document No.";
            FixedAsset."Purch. Receipt Line No." := PurchRcptLine."Line No.";
            FixedAsset."FA Template Code" := PurchaseLine."FA Template Code";

            FixedAsset.Modify(true);
            FADepreciationBook.Init();
            FADepreciationBook."FA No." := FixedAsset."No.";
            FADepreciationBook."Depreciation Book Code" := 'COMPANY';
            FADepreciationBook.Validate("Depreciation Method", LBMCFATemplate."Depreciation Method");
            FADepreciationBook.Validate("Depreciation Starting Date", PostingDate);
            FADepreciationBook.Validate("FA Posting Group", LBMCFATemplate."Posting Group");
            FADepreciationBook.Insert(true);
        end;
    end;
    
    procedure PostFAAcqCost(var PurchInvHeader: Record "Purch. Inv. Header")
    var
        PurchInvLine: Record "Purch. Inv. Line";
        Item: Record Item;
        FixedAsset: Record "Fixed Asset";
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        GenJournalLine: Record "Gen. Journal Line";
        GenJournalBatch: Record "Gen. Journal Batch";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        DocumentNo: Code[20];
        LineNo: Integer;
    begin
        PurchInvHeader.TestField("Acq. Cost Posted", false);
        PurchasesPayablesSetup.Get();
        PurchasesPayablesSetup.TestField("FA G/L Template");
        PurchasesPayablesSetup.TestField("FA G/L Template");
        PurchasesPayablesSetup.TestField("Stock Adjmt. A/c");

        GenJournalBatch.Get(PurchasesPayablesSetup."FA G/L Template", PurchasesPayablesSetup."FA G/L Batch");
        GenJournalBatch.TestField("No. Series");

        DocumentNo := NoSeriesManagement.GetNextNo(GenJournalBatch."No. Series", Today, true);

        GenJournalLine.Reset();
        GenJournalLine.SetRange("Journal Template Name", PurchasesPayablesSetup."FA G/L Template");
        GenJournalLine.SetRange("Journal Batch Name", PurchasesPayablesSetup."FA G/L Batch");
        if GenJournalLine.FindLast() then
            LineNo := GenJournalLine."Line No.";

        PurchInvLine.Reset();
        PurchInvLine.SetRange("Document No.", PurchInvHeader."No.");
        PurchInvLine.SetRange(Type, PurchInvLine.Type::Item);
        if PurchInvLine.FindSet() then
            repeat
                if Item.Get(PurchInvLine."No.") then
                    if Item."Fixed Asset Item" then begin
                        FixedAsset.Reset();
                        FixedAsset.SetRange("Purch. Receipt No.", PurchInvLine."Receipt No.");
                        FixedAsset.SetRange("Purch. Receipt Line No.", PurchInvLine."Receipt Line No.");
                        if FixedAsset.FindSet() then
                            repeat
                                DocumentNo := IncStr(DocumentNo);
                                LineNo += 10000;
                                GenJournalLine.Init();
                                GenJournalLine."Journal Template Name" := PurchasesPayablesSetup."FA G/L Template";
                                GenJournalLine."Journal Batch Name" := PurchasesPayablesSetup."FA G/L Batch";
                                GenJournalLine."Line No." := LineNo;
                                GenJournalLine.Validate(BssiEntityID, PurchInvLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate("Shortcut Dimension 1 Code", PurchInvLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Insert(true);
                                GenJournalLine.Validate("Posting Date", PurchInvHeader."Posting Date");
                                GenJournalLine.Validate("Document Type", GenJournalLine."Document Type"::" ");
                                GenJournalLine."Document No." := DocumentNo;
                                GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::"Fixed Asset");
                                GenJournalLine.Validate("Account No.", FixedAsset."No.");
                                GenJournalLine.Validate("FA Posting Type", GenJournalLine."FA Posting Type"::"Acquisition Cost");
                                GenJournalLine.Validate(Amount, PurchInvLine."Line Amount" / PurchInvLine.Quantity);
                                GenJournalLine.Validate("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
                                GenJournalLine.Validate("Bal. Account No.", PurchasesPayablesSetup."Stock Adjmt. A/c");
                                GenJournalLine.Validate("Shortcut Dimension 2 Code", PurchInvLine."Shortcut Dimension 2 Code");
                                GenJournalLine.Validate("Dimension Set ID", PurchInvLine."Dimension Set ID");
                                GenJournalLine.Modify(true);
                            until FixedAsset.Next() = 0;
                    end;
            until PurchInvLine.Next() = 0;
        PurchInvHeader."Acq. Cost Posted" := true;
        PurchInvHeader.Modify();
    end;
    */
    procedure AutoCalcAcqCost(Job: Record Job)
    var
        LBMCJobFixedAsset: Record "LBMC Job Fixed Asset";
        JobLedgerEntry: Record "Job Ledger Entry";
        TotalAmt: Decimal;
        TotalNoOfAssets: Integer;
    begin
        JobLedgerEntry.Reset();
        JobLedgerEntry.SetRange("Job No.", Job."No.");
        if JobLedgerEntry.FindSet()then repeat TotalAmt+=JobLedgerEntry."Total Cost (LCY)";
            until JobLedgerEntry.Next() = 0;
        LBMCJobFixedAsset.Reset();
        LBMCJobFixedAsset.SetRange("Job No.", Job."No.");
        if LBMCJobFixedAsset.FindSet()then repeat TotalNoOfAssets+=LBMCJobFixedAsset."No. of Assets";
            until LBMCJobFixedAsset.Next() = 0;
        if TotalNoOfAssets <= 0 then Error('No Assets Found');
        LBMCJobFixedAsset.Reset();
        LBMCJobFixedAsset.SetRange("Job No.", Job."No.");
        if LBMCJobFixedAsset.FindSet()then repeat LBMCJobFixedAsset."Acquisition Cost":=(LBMCJobFixedAsset."No. of Assets" / TotalNoOfAssets) * TotalAmt;
                LBMCJobFixedAsset.Modify(true);
            until LBMCJobFixedAsset.Next() = 0;
        Message('Aacquistion Cost has been calculated.');
    end;
    procedure CreateFixedAssets(Job: Record Job)
    var
        FixedAsset: Record "Fixed Asset";
        FADepreciationBook: Record "FA Depreciation Book";
        LBMCFATemplate: Record "LBMC FA Template";
        LBMCJobFixedAsset: Record "LBMC Job Fixed Asset";
        LBMCJobFixedAssetNo: Record "LBMC Job Fixed Asset No.";
        FAPostingGroup: Record "FA Posting Group";
        NoSeriesManagement: Codeunit "No. Series";
        TotalNoOfAssets: Integer;
        NoOfAssets: Integer;
    begin
        Job.TestField("Assets Created", false);
        Job.TestField("Ending Date");
        LBMCJobFixedAsset.Reset();
        LBMCJobFixedAsset.SetRange("Job No.", Job."No.");
        if LBMCJobFixedAsset.FindSet()then repeat TotalNoOfAssets+=LBMCJobFixedAsset."No. of Assets";
            until LBMCJobFixedAsset.Next() = 0;
        if TotalNoOfAssets <= 0 then Error('No Assets Found');
        LBMCJobFixedAsset.Reset();
        LBMCJobFixedAsset.SetRange("Job No.", Job."No.");
        if LBMCJobFixedAsset.FindSet()then repeat LBMCFATemplate.get(LBMCJobFixedAsset."FA Template Code");
                LBMCFATemplate.TestField("No. Series");
                for NoOfAssets:=1 to LBMCJobFixedAsset."No. of Assets" do begin
                    FixedAsset.Init();
                    FixedAsset."No.":=NoSeriesManagement.GetNextNo(LBMCFATemplate."No. Series", Today, true);
                    FixedAsset.Insert(true);
                    FixedAsset.validate(Description, LBMCJobFixedAsset.Description);
                    FixedAsset.validate("FA Class Code", LBMCFATemplate."FA Class Code");
                    FixedAsset.validate("FA Subclass Code", LBMCFATemplate."FA Subclass Code");
                    if LBMCJobFixedAsset."Shortcut Dimension 1 Code" = '' then FixedAsset.validate("Global Dimension 1 Code", Job."Global Dimension 1 Code")
                    else
                        FixedAsset.validate("Global Dimension 1 Code", LBMCJobFixedAsset."Shortcut Dimension 1 Code");
                    FixedAsset.validate("Global Dimension 2 Code", Job."Global Dimension 2 Code");
                    FixedAsset.validate("FA Posting Group", LBMCFATemplate."Posting Group");
                    FixedAsset.validate("Vendor No.", LBMCFATemplate."Vendor No.");
                    FixedAsset.validate("Maintenance Vendor No.", LBMCFATemplate."Maintenance Vendor No.");
                    FixedAsset.validate("Under Maintenance", LBMCFATemplate."Under Maintenance");
                    FixedAsset."Job No.":=Job."No.";
                    FixedAsset."FA Template Code":=LBMCFATemplate."Template Code";
                    FixedAsset.Modify(true);
                    FADepreciationBook.Init();
                    FADepreciationBook."FA No.":=FixedAsset."No.";
                    FADepreciationBook."Depreciation Book Code":='COMPANY';
                    FADepreciationBook.Validate("Depreciation Method", LBMCFATemplate."Depreciation Method");
                    FADepreciationBook.Validate("Depreciation Starting Date", Job."Ending Date");
                    FADepreciationBook.Validate("FA Posting Group", LBMCFATemplate."Posting Group");
                    if FAPostingGroup.get(FADepreciationBook."FA Posting Group")then if FAPostingGroup."Useful Life" > 0 then FADepreciationBook.Validate("No. of Depreciation Years", FAPostingGroup."Useful Life");
                    FADepreciationBook.Insert(true);
                    LBMCJobFixedAssetNo.Init();
                    LBMCJobFixedAssetNo."Job No.":=LBMCJobFixedAsset."Job No.";
                    LBMCJobFixedAssetNo."Entry No.":=LBMCJobFixedAsset."Entry No.";
                    LBMCJobFixedAssetNo."Asset No.":=FixedAsset."No.";
                    LBMCJobFixedAssetNo.Insert();
                end;
            until LBMCJobFixedAsset.Next() = 0;
        Job."Assets Created":=true;
        Job.Modify();
        Message('Assets have been created');
    end;
    procedure PostFAAcqCost(Job: Record Job)
    var
        JobLedgerEntry: Record "Job Ledger Entry";
        LBMCJobFixedAsset: Record "LBMC Job Fixed Asset";
        LBMCJobFixedAssetNo: Record "LBMC Job Fixed Asset No.";
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        GenJournalLine: Record "Gen. Journal Line";
        GenJournalBatch: Record "Gen. Journal Batch";
        NoSeriesManagement: Codeunit "No. Series";
        TotalAmt: Decimal;
        TotalAcqAmt: Decimal;
        DocumentNo: Code[20];
        LineNo: Integer;
    begin
        Job.TestField("Assets Created", true);
        Job.TestField("Acq. Cost Posted", false);
        Job.TestField("Ending Date");
        JobLedgerEntry.Reset();
        JobLedgerEntry.SetRange("Job No.", Job."No.");
        if JobLedgerEntry.FindSet()then repeat TotalAmt+=JobLedgerEntry."Total Cost (LCY)";
            until JobLedgerEntry.Next() = 0;
        LBMCJobFixedAsset.Reset();
        LBMCJobFixedAsset.SetRange("Job No.", Job."No.");
        if LBMCJobFixedAsset.FindSet()then repeat TotalAcqAmt+=LBMCJobFixedAsset."Acquisition Cost";
            until LBMCJobFixedAsset.Next() = 0;
        if TotalAcqAmt > TotalAmt then Error('Total Acquisition Cost should not be greater than %1', TotalAmt);
        PurchasesPayablesSetup.Get();
        PurchasesPayablesSetup.TestField("FA G/L Template");
        PurchasesPayablesSetup.TestField("FA G/L Template");
        PurchasesPayablesSetup.TestField("Stock Adjmt. A/c");
        GenJournalBatch.Get(PurchasesPayablesSetup."FA G/L Template", PurchasesPayablesSetup."FA G/L Batch");
        GenJournalBatch.TestField("No. Series");
        DocumentNo:=NoSeriesManagement.GetNextNo(GenJournalBatch."No. Series", Today, true);
        GenJournalLine.Reset();
        GenJournalLine.SetRange("Journal Template Name", PurchasesPayablesSetup."FA G/L Template");
        GenJournalLine.SetRange("Journal Batch Name", PurchasesPayablesSetup."FA G/L Batch");
        if GenJournalLine.FindLast()then LineNo:=GenJournalLine."Line No.";
        LBMCJobFixedAsset.Reset();
        LBMCJobFixedAsset.SetRange("Job No.", Job."No.");
        if LBMCJobFixedAsset.FindSet()then repeat LBMCJobFixedAssetNo.Reset();
                LBMCJobFixedAssetNo.SetRange("Job No.", LBMCJobFixedAsset."Job No.");
                LBMCJobFixedAssetNo.SetRange("Entry No.", LBMCJobFixedAsset."Entry No.");
                if LBMCJobFixedAssetNo.FindSet()then repeat DocumentNo:=IncStr(DocumentNo);
                        LineNo+=10000;
                        GenJournalLine.Init();
                        GenJournalLine."Journal Template Name":=PurchasesPayablesSetup."FA G/L Template";
                        GenJournalLine."Journal Batch Name":=PurchasesPayablesSetup."FA G/L Batch";
                        GenJournalLine."Line No.":=LineNo;
                        GenJournalLine.Validate(BssiEntityID, Job."Global Dimension 1 Code");
                        GenJournalLine.Validate("Shortcut Dimension 1 Code", Job."Global Dimension 1 Code");
                        GenJournalLine.Insert(true);
                        GenJournalLine.Validate("Posting Date", Job."Ending Date");
                        GenJournalLine.Validate("Document Type", GenJournalLine."Document Type"::" ");
                        GenJournalLine."Document No.":=DocumentNo;
                        GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::"Fixed Asset");
                        GenJournalLine.Validate("Account No.", LBMCJobFixedAssetNo."Asset No.");
                        GenJournalLine.Validate("FA Posting Type", GenJournalLine."FA Posting Type"::"Acquisition Cost");
                        GenJournalLine.Validate(Amount, LBMCJobFixedAsset."Acquisition Cost" / LBMCJobFixedAsset."No. of Assets");
                        GenJournalLine.Validate("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
                        GenJournalLine.Validate("Bal. Account No.", PurchasesPayablesSetup."Stock Adjmt. A/c");
                        GenJournalLine.Validate("Shortcut Dimension 2 Code", Job."Global Dimension 2 Code");
                        GenJournalLine.Modify(true);
                    until LBMCJobFixedAssetNo.Next() = 0;
            until LBMCJobFixedAsset.Next() = 0;
        Job.validate(Blocked, Job.Blocked::All);
        Job."Acq. Cost Posted":=true;
        Job.Modify();
        Message('Acquisition Cost Posted');
    end;
    [EventSubscriber(ObjectType::Table, Database::"Purch. Rcpt. Line", 'OnAfterInsertInvLineFromRcptLine', '', false, false)]
    local procedure OnAfterInsertInvLineFromRcptLine(var PurchLine: Record "Purchase Line"; PurchOrderLine: Record "Purchase Line"; NextLineNo: Integer; PurchRcptLine: Record "Purch. Rcpt. Line");
    begin
        PurchLine."Order No.":=PurchRcptLine."Order No.";
        PurchLine."Order Line No.":=PurchRcptLine."Order Line No.";
        PurchLine.Modify();
    end;
    var P: Page "Vendor Card";
    cu: Codeunit 42;
    pgggg: Page 23065967;
}
