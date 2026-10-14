report 50006 "LBMC Upload Payroll Job Jnl."
{
    UseRequestPage = true;
    Caption = 'Upload Payroll Job Journal';
    UsageCategory = Tasks;
    ApplicationArea = all;
    ProcessingOnly = true;

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    field(IsFirstRowHeader; FirstRowHeader)
                    {
                        ApplicationArea = all;
                        Caption = 'First Row is Header?';
                        ToolTip = 'Is the first row the header?';
                    }
                }
            }
        }
    }
    trigger OnPostReport()
    begin
        GeneralLedgerSetup.get();
        UploadIntoStream(LocText0001Txt, '', '', FromFile, InStream);
        if FromFile <> '' then begin
            FileName:=FileManagement.GetFileName(FromFile);
            SheetName:=ExcelBuffer.SelectSheetsNameStream(InStream);
        end
        else
            Error('File not Found');
        ExcelBuffer.Reset();
        ExcelBuffer.DeleteAll();
        ExcelBuffer.OpenBookStream(InStream, SheetName);
        ExcelBuffer.ReadSheet();
        ExcelBuffer.LockTable();
        GenJournalLine.Reset();
        GenJournalLine.SetRange("Journal Template Name", GlbTemplate);
        GenJournalLine.SetRange("Journal Batch Name", GlbBatch);
        if GenJournalLine.FindLast()then LineNo:=GenJournalLine."Line No.";
        GenJournalBatch.Get(GlbTemplate, GlbBatch);
        GenJournalBatch.TestField("No. Series", '');
        //DocumentNo := NoSeriesManagement.GetNextNo(GenJournalBatch."No. Series", Today, true);
        ExcelBuffer.Reset();
        if FirstRowHeader then ExcelBuffer.SetFilter("Row No.", '>%1', 1);
        ExcelBuffer.SetRange("Column No.", 1);
        if ExcelBuffer.FindSet()then repeat ExcelBuffer2.Reset();
                ExcelBuffer2.SetRange("Row No.", ExcelBuffer."Row No.");
                if ExcelBuffer2.FindSet()then repeat if ExcelBuffer2."Column No." = 1 then GlbDim1Code:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 2 then GlbDim2Code:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 3 then if ExcelBuffer2."Cell Value as Text" <> '' then Evaluate(PostingDate, ExcelBuffer2."Cell Value as Text");
                        if ExcelBuffer2."Column No." = 4 then DocumentNo:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 5 then LineDescription:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 6 then DetermineAccType(ExcelBuffer2."Cell Value as Text");
                        if ExcelBuffer2."Column No." = 7 then AccountNo:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 8 then if ExcelBuffer2."Cell Value as Text" <> '' then Evaluate(Amt, ExcelBuffer2."Cell Value as Text");
                        if ExcelBuffer2."Column No." = 9 then DetermineBalAccType(ExcelBuffer2."Cell Value as Text");
                        if ExcelBuffer2."Column No." = 10 then BalAccountNo:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 11 then ShortDim3Code:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 12 then ShortDim4Code:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 13 then ResourceNo:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 14 then JobNo:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 15 then JobTaskNo:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 16 then DetermineJobLineType(ExcelBuffer2."Cell Value as Text");
                        if ExcelBuffer2."Column No." = 17 then if ExcelBuffer2."Cell Value as Text" <> '' then Evaluate(JobQty, ExcelBuffer2."Cell Value as Text");
                    until ExcelBuffer2.Next() = 0;
                if PostingDate = 0D then Error('Posting Date Cannot be Blank');
                if AccountNo = '' then Error('Account No. cannot be Blank');
                if GlbDim1Code = '' then Error('Company Code cannot be Blank');
                if BatchCompany = '' then Error('Bssi Entity ID cannot be Blank');
                PostingDate:=PostingDate + 1;
                //DocumentNo := IncStr(DocumentNo);
                LineNo+=10000;
                GenJournalLine.Init();
                GenJournalLine."Journal Template Name":=GlbTemplate;
                GenJournalLine."Journal Batch Name":=GlbBatch;
                GenJournalLine."Line No.":=LineNo;
                GenJournalLine.Validate(BssiEntityID, BatchCompany);
                GenJournalLine.Validate("Shortcut Dimension 1 Code", GlbDim1Code);
                GenJournalLine.Insert(true);
                GenJournalLine."Document No.":=DocumentNo;
                GenJournalLine.Validate("Document Type", GenJournalLine."Document Type"::" ");
                GenJournalLine."Document No.":=DocumentNo;
                if LineDescription <> '' then GenJournalLine.Description:=LineDescription;
                //GenJournalLine.Validate("External Document No.", ExtDocNo);
                GenJournalLine.Validate("Posting Date", PostingDate);
                GenJournalLine.Validate("Account Type", GenJnlAccType);
                GenJournalLine.Validate("Account No.", AccountNo);
                GenJournalLine.Validate(Amount, Amt);
                GenJournalLine.Validate("Bal. Account Type", GenJnlBalAccType);
                GenJournalLine.Validate("Bal. Account No.", BalAccountNo);
                GenJournalLine.Validate("Shortcut Dimension 2 Code", GlbDim2Code);
                GenJournalLine.Validate("Resource No.", ResourceNo);
                GenJournalLine.Validate("Job No.", JobNo);
                GenJournalLine.Validate("Job Task No.", JobTaskNo);
                GenJournalLine.Validate("Job Line Type", JobLineType);
                GenJournalLine.Validate("Job Quantity", JobQty);
                GenJournalLine.Validate("Shortcut Dimension 1 Code", GlbDim1Code);
                GenJournalLine.Validate("Shortcut Dimension 2 Code", GlbDim2Code);
                GenJournalLine.Modify(true);
                TempDimensionSetEntry.Reset();
                if TempDimensionSetEntry.FindFirst()then TempDimensionSetEntry.DeleteAll(true);
                OldDimSetID:=GenJournalLine."Dimension Set ID";
                DimensionManagement.GetDimensionSet(TempDimensionSetEntry, OldDimSetID);
                if GlbDim1Code <> '' then if not TempDimensionSetEntry.get(OldDimSetID, GeneralLedgerSetup."Global Dimension 1 Code")then begin
                        TempDimensionSetEntry.Init();
                        TempDimensionSetEntry.Validate("Dimension Code", GeneralLedgerSetup."Global Dimension 1 Code");
                        TempDimensionSetEntry.Validate("Dimension Value Code", GlbDim1Code);
                        TempDimensionSetEntry.Insert(true);
                    end;
                if GlbDim2Code <> '' then if not TempDimensionSetEntry.get(OldDimSetID, GeneralLedgerSetup."Global Dimension 2 Code")then begin
                        TempDimensionSetEntry.Init();
                        TempDimensionSetEntry.Validate("Dimension Code", GeneralLedgerSetup."Global Dimension 2 Code");
                        TempDimensionSetEntry.Validate("Dimension Value Code", GlbDim2Code);
                        TempDimensionSetEntry.Insert(true);
                    end;
                if ShortDim3Code <> '' then if not TempDimensionSetEntry.get(OldDimSetID, GeneralLedgerSetup."Shortcut Dimension 3 Code")then begin
                        TempDimensionSetEntry.Init();
                        TempDimensionSetEntry.Validate("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 3 Code");
                        TempDimensionSetEntry.Validate("Dimension Value Code", ShortDim3Code);
                        TempDimensionSetEntry.Insert(true);
                    end;
                if ShortDim4Code <> '' then if not TempDimensionSetEntry.get(OldDimSetID, GeneralLedgerSetup."Shortcut Dimension 4 Code")then begin
                        TempDimensionSetEntry.Init();
                        TempDimensionSetEntry.Validate("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 4 Code");
                        TempDimensionSetEntry.Validate("Dimension Value Code", ShortDim4Code);
                        TempDimensionSetEntry.Insert(true);
                    end;
                NewDimSetID:=DimensionManagement.GetDimensionSetID(TempDimensionSetEntry);
                GenJournalLine.Validate("Dimension Set ID", NewDimSetID);
                GenJournalLine.Modify(true);
                PostingDate:=0D;
                AccountNo:='';
                BalAccountNo:='';
                Amt:=0;
                GlbDim1Code:='';
                GlbDim2Code:='';
                ShortDim3Code:='';
                ShortDim4Code:='';
                AccType:='';
                ResourceNo:='';
                Clear(GenJnlAccType);
                Clear(GenJnlBalAccType);
                Clear(JobLineType);
                ExtDocNo:='';
                JobNo:='';
                JobQty:=0;
                JobTaskNo:='';
                LineDescription:='';
            until ExcelBuffer.Next() = 0;
        ExcelBuffer.Reset();
        ExcelBuffer.DeleteAll();
        Message('Upload Complete');
    end;
    var ExcelBuffer: Record "Excel Buffer";
    ExcelBuffer2: Record "Excel Buffer";
    GenJournalLine: Record "Gen. Journal Line";
    GenJournalBatch: Record "Gen. Journal Batch";
    GeneralLedgerSetup: Record "General Ledger Setup";
    TempDimensionSetEntry: Record "Dimension Set Entry" temporary;
    FileManagement: Codeunit "File Management";
    NoSeriesManagement: Codeunit "No. Series";
    DimensionManagement: Codeunit DimensionManagement;
    InStream: InStream;
    FromFile: Text;
    FileName: Text;
    SheetName: Text;
    LocText0001Txt: TextConst ENU = 'Upload Excel File';
    FirstRowHeader: Boolean;
    GlbDim1Code: Code[20];
    GlbDim2Code: Code[20];
    PostingDate: Date;
    AccountNo: Code[20];
    BalAccountNo: Code[20];
    Amt: Decimal;
    GlbTemplate: Code[20];
    GlbBatch: Code[20];
    DocumentNo: Code[20];
    ExtDocNo: Code[20];
    AccType: Text;
    LineNo: Integer;
    ShortDim3Code: Code[20];
    ShortDim4Code: Code[20];
    OldDimSetID: Integer;
    NewDimSetID: Integer;
    ResourceNo: Code[20];
    JobNo: Code[20];
    JobTaskNo: Code[20];
    LineDescription: Text[100];
    BatchCompany: Code[20];
    JobQty: Decimal;
    GenJnlAccType: Enum "Gen. Journal Account Type";
    GenJnlBalAccType: Enum "Gen. Journal Account Type";
    JobLineType: Enum "Job Line Type";
    procedure SetGenJnlTempBatch(Template: Code[20]; Batch: Code[20]; BssiEntityID: Code[20])
    begin
        GlbTemplate:=Template;
        GlbBatch:=Batch;
        BatchCompany:=BssiEntityID;
    end;
    procedure DetermineAccType(LocAccType: Text)
    begin
        case LocAccType of 'G/L Account': GenJnlAccType:=GenJnlAccType::"G/L Account";
        'Customer': GenJnlAccType:=GenJnlAccType::Customer;
        'Vendor': GenJnlAccType:=GenJnlAccType::Vendor;
        'Bank Account': GenJnlAccType:=GenJnlAccType::"Bank Account";
        'Fixed Asset': GenJnlAccType:=GenJnlAccType::"Fixed Asset";
        'IC Partner': GenJnlAccType:=GenJnlAccType::"IC Partner";
        'Employee': GenJnlAccType:=GenJnlAccType::Employee;
        end;
    end;
    procedure DetermineBalAccType(LocBalAccType: Text)
    begin
        case LocBalAccType of 'G/L Account': GenJnlBalAccType:=GenJnlBalAccType::"G/L Account";
        'Customer': GenJnlBalAccType:=GenJnlBalAccType::Customer;
        'Vendor': GenJnlBalAccType:=GenJnlBalAccType::Vendor;
        'Bank Account': GenJnlBalAccType:=GenJnlBalAccType::"Bank Account";
        'Fixed Asset': GenJnlBalAccType:=GenJnlBalAccType::"Fixed Asset";
        'IC Partner': GenJnlBalAccType:=GenJnlBalAccType::"IC Partner";
        'Employee': GenJnlBalAccType:=GenJnlBalAccType::Employee;
        end;
    end;
    procedure DetermineJobLineType(locJLType: Text)
    begin
        case locJLType of 'Budget': JobLineType:=JobLineType::Budget;
        'Billable': JobLineType:=JobLineType::Billable;
        'Both Budget And Billable': JobLineType:=JobLineType::"Both Budget and Billable";
        end;
    end;
}
