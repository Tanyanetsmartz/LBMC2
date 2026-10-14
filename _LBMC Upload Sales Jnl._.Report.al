report 50002 "LBMC Upload Sales Jnl."
{
    UseRequestPage = true;
    Caption = 'Upload Sales Journal';
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
                        ToolTip = ' ';
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
        //DocumentNo := NoSerMngt.GetNextNo(GenJnlBatch."No. Series", Today, true);
        ExcelBuffer.Reset();
        if FirstRowHeader then ExcelBuffer.SetFilter("Row No.", '>%1', 1);
        ExcelBuffer.SetRange("Column No.", 1);
        if ExcelBuffer.FindSet()then repeat ExcelBuffer2.Reset();
                ExcelBuffer2.SetRange("Row No.", ExcelBuffer."Row No.");
                if ExcelBuffer2.FindSet()then repeat if ExcelBuffer2."Column No." = 1 then GlbDim1Code:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 2 then GlbDim2Code:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 3 then DocumentNo:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 4 then if ExcelBuffer2."Cell Value as Text" <> '' then Evaluate(PostingDate, ExcelBuffer2."Cell Value as Text");
                        if ExcelBuffer2."Column No." = 5 then AccType:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 6 then CustomerNo:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 7 then LineDescription:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 8 then if ExcelBuffer2."Cell Value as Text" <> '' then Evaluate(Amt, ExcelBuffer2."Cell Value as Text");
                        if ExcelBuffer2."Column No." = 9 then ShortDim3Code:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 10 then ShortDim4Code:=ExcelBuffer2."Cell Value as Text";
                    until ExcelBuffer2.Next() = 0;
                if PostingDate = 0D then Error('Posting Date Cannot be Blank');
                if CustomerNo = '' then Error('Customer No. cannot be Blank');
                //if Amt <= 0 then Error('Amount cannot be less than or equal 0');
                if GlbDim1Code = '' then Error('Company Code cannot be Blank');
                if(UpperCase(AccType) <> 'CUSTOMER') AND (UpperCase(AccType) <> 'G/L ACCOUNT')then Error('Account Type must be either Customer or G/L Account');
                if BatchCompany = '' then Error('Bssi Entity ID cannot be Blank');
                PostingDate:=PostingDate + 1;
                LineNo+=10000;
                GenJournalLine.Init();
                GenJournalLine."Journal Template Name":=GlbTemplate;
                GenJournalLine."Journal Batch Name":=GlbBatch;
                GenJournalLine."Line No.":=LineNo;
                GenJournalLine.Validate(BssiEntityID, BatchCompany);
                GenJournalLine.Validate("Shortcut Dimension 1 Code", GlbDim1Code);
                GenJournalLine.Insert(true);
                GenJournalLine."Document No.":=DocumentNo;
                GenJournalLine.Validate("Document Type", GenJournalLine."Document Type"::Invoice);
                GenJournalLine.Validate("Posting Date", PostingDate);
                if UpperCase(AccType) = 'CUSTOMER' then GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::Customer)
                ELSE
                    GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::"G/L Account");
                GenJournalLine.Validate("Account No.", CustomerNo);
                //if LineDescription <> '' then
                GenJournalLine.Description:=LineDescription;
                GenJournalLine.Validate(Amount, Amt);
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
                        TempDimensionSetEntry.Validate("Dimension Value Code", GlbDim1Code);
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
                CustomerNo:='';
                Amt:=0;
                GlbDim1Code:='';
                GlbDim2Code:='';
                ShortDim3Code:='';
                ShortDim4Code:='';
                AccType:='';
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
    TempDimensionSetEntry: Record "Dimension Set Entry" temporary;
    GeneralLedgerSetup: Record "General Ledger Setup";
    FileManagement: Codeunit "File Management";
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
    CustomerNo: Code[20];
    Amt: Decimal;
    GlbTemplate: Code[20];
    GlbBatch: Code[20];
    DocumentNo: Code[20];
    AccType: Text;
    LineNo: Integer;
    ShortDim3Code: Code[20];
    ShortDim4Code: Code[20];
    BatchCompany: Code[20];
    OldDimSetID: Integer;
    NewDimSetID: Integer;
    LineDescription: Text[100];
    procedure SetGenJnlTempBatch(Template: Code[20]; Batch: Code[20]; BssiEntityID: Code[20])
    begin
        GlbTemplate:=Template;
        GlbBatch:=Batch;
        BatchCompany:=BssiEntityID;
    end;
}
