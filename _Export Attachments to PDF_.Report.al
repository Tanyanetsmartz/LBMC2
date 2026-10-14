report 50003 "Export Attachments to PDF"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'Export Document Attachments to PDF';

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "No.", "Posting Date", "Shortcut Dimension 1 Code";
            MaxIteration = 1;

            trigger OnAfterGetRecord()
            begin
                if ExportOptions = ExportOptions::"Posted Invoice" then ProcessDocuments(ExportOptions);
            end;
        }
        dataitem("Purchase Header"; "Purchase Header")
        {
            RequestFilterFields = "Document Type", "No.", "Posting Date", "Shortcut Dimension 1 Code";
            MaxIteration = 1;

            trigger OnAfterGetRecord()
            begin
                if ExportOptions <> ExportOptions::"Posted Invoice" then ProcessDocuments(ExportOptions);
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field("Exp. Doc. Type"; ExportOptions)
                    {
                        ApplicationArea = All;
                    }
                    field("User Filter"; UserFilter)
                    {
                        ApplicationArea = All;
                        TableRelation = "User Setup"."User ID";
                    }
                    field("G/L Account Filter"; GLAccountFilter)
                    {
                        ApplicationArea = All;
                        TableRelation = "G/L Account"."No.";
                    }
                    field("Start Date"; StartDate)
                    {
                        ApplicationArea = All;
                    }
                    field("End Date"; EndDate)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
    trigger OnPreReport()
    begin
        DataCompression.CreateZipArchive();
    end;
    trigger OnPostReport()
    begin
        if(StartDate <> 0D) and (EndDate <> 0D)then ZipFilename:='Attachments-' + Format(StartDate) + '-' + Format(EndDate) + '.zip'
        else
            ZipFilename:='Attachments-All.zip';
        FinalTempBlob.CreateOutStream(FinalOutStream);
        DataCompression.SaveZipArchive(FinalOutStream);
        FinalTempBlob.CreateInStream(FinalInStream);
        DownloadFromStream(FinalInStream, '', '', '', ZipFileName);
    end;
    procedure ProcessDocuments(ExportOptions: Enum "Export Purch. Doc. Type")
    var
        PurchaseLine: Record "Purchase Line";
        PurchInvLine: Record "Purch. Inv. Line";
        ProgressDialog: Dialog;
        DocNo: Code[20];
    begin
        //ZipFilename := '-' + Format(StartDate) + '-' + Format(EndDate) + '.zip';
        //PurchaseLine.SetCurrentKey("Job No.", "Document Type", "Document No.");
        //PurchaseLine.SetRange("Job No.", Job."No.");
        ProgressDialog.Open(ProgressDialogLabel, Counter, PurchaseLine."Document No.");
        case ExportOptions of ExportOptions::Quote: begin
            //DataCompression.CreateZipArchive();
            // Export Open Document Attachments
            TempZipFileName:='Quotes' + ZipFilename;
            PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Quote);
            if GLAccountFilter <> '' then PurchaseLine.SetFilter("No.", GLAccountFilter);
            if PurchaseLine.FindSet(false)then begin
                ExportAttachment(38, PurchaseLine."Document No.", StartDate, EndDate, UserFilter, DataCompression);
                Counter+=1;
            end;
        //    repeat
        //        if PurchaseLine."Document No." <> DocNo then
        //            ExportAttachment(38, PurchaseLine."Document No.", StartDate, EndDate, UserFilter, DataCompression);
        //        DocNo := PurchaseLine."Document No.";
        //    until PurchaseLine.Next() = 0;
        //ProgressDialog.Close();
        /*FinalTempBlob.CreateOutStream(FinalOutStream);
                    DataCompression.SaveZipArchive(FinalOutStream);
                    FinalTempBlob.CreateInStream(FinalInStream);
                    if PurchaseLine.Count > 0 then
                        DownloadFromStream(FinalInStream, '', '', '', TempZipFilename);*/
        end;
        ExportOptions::Order: begin
            //DataCompression.CreateZipArchive();
            TempZipFileName:='Orders' + ZipFilename;
            PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);
            if GLAccountFilter <> '' then PurchaseLine.SetFilter("No.", GLAccountFilter);
            if PurchaseLine.FindSet(false)then begin
                ExportAttachment(38, PurchaseLine."Document No.", StartDate, EndDate, UserFilter, DataCompression);
                Counter+=1;
            end;
        //repeat
        //    if PurchaseLine."Document No." <> DocNo then
        //        ExportAttachment(38, PurchaseLine."Document No.", StartDate, EndDate, UserFilter, DataCompression);
        //    DocNo := PurchaseLine."Document No.";
        //until PurchaseLine.Next() = 0;
        //ProgressDialog.Close();
        /*FinalTempBlob.CreateOutStream(FinalOutStream);
                    DataCompression.SaveZipArchive(FinalOutStream);
                    FinalTempBlob.CreateInStream(FinalInStream);
                    if PurchaseLine.Count > 0 then
                        DownloadFromStream(FinalInStream, '', '', '', TempZipFilename);*/
        end;
        ExportOptions::Invoice: begin
            //DataCompression.CreateZipArchive();
            TempZipFileName:='Invoices' + ZipFilename;
            PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Invoice);
            if GLAccountFilter <> '' then PurchaseLine.SetFilter("No.", GLAccountFilter);
            if PurchaseLine.FindSet(false)then begin
                ExportAttachment(38, PurchaseLine."Document No.", StartDate, EndDate, UserFilter, DataCompression);
                Counter+=1;
            end;
        //repeat
        //    if PurchaseLine."Document No." <> DocNo then
        //        ExportAttachment(38, PurchaseLine."Document No.", StartDate, EndDate, UserFilter, DataCompression);
        //    DocNo := PurchaseLine."Document No.";
        //until PurchaseLine.Next() = 0;
        //ProgressDialog.Close();
        /*FinalTempBlob.CreateOutStream(FinalOutStream);
                    DataCompression.SaveZipArchive(FinalOutStream);
                    FinalTempBlob.CreateInStream(FinalInStream);
                    if PurchaseLine.Count > 0 then
                        DownloadFromStream(FinalInStream, '', '', '', TempZipFilename);*/
        end;
        ExportOptions::"Credit Memo": begin
            //DataCompression.CreateZipArchive();
            TempZipFileName:='CrMemos' + ZipFilename;
            PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::"Credit Memo");
            if GLAccountFilter <> '' then PurchaseLine.SetFilter("No.", GLAccountFilter);
            if PurchaseLine.FindSet(false)then begin
                ExportAttachment(38, PurchaseLine."Document No.", StartDate, EndDate, UserFilter, DataCompression);
                Counter+=1;
            end;
        //repeat
        //if PurchaseLine."Document No." <> DocNo then
        //ExportAttachment(38, PurchaseLine."Document No.", StartDate, EndDate, UserFilter, DataCompression);
        //DocNo := PurchaseLine."Document No.";
        //until PurchaseLine.Next() = 0;
        //ProgressDialog.Close();
        /*FinalTempBlob.CreateOutStream(FinalOutStream);
                    DataCompression.SaveZipArchive(FinalOutStream);
                    FinalTempBlob.CreateInStream(FinalInStream);
                    if PurchaseLine.Count > 0 then
                        DownloadFromStream(FinalInStream, '', '', '', TempZipFilename);*/
        end;
        ExportOptions::"Posted Invoice": begin
            // Export posted invoice attachments
            //DataCompression.CreateZipArchive();
            //TempZipFileName := 'PostedInvoices' + ZipFilename;
            TempZipFileName:="Purch. Inv. Header"."No." + '-' + ZipFilename;
            //PurchInvLine.SetCurrentKey("Job No.", "Document No.");
            //PurchInvLine.SetRange("Job No.", Job."No.");
            if GLAccountFilter <> '' then PurchInvLine.SetFilter("No.", GLAccountFilter);
            PurchInvLine.SetRange("Document No.", "Purch. Inv. Header"."No.");
            ProgressDialog.Open(ProgressDialogLabel, Counter, PurchInvLine."Document No.");
            if PurchInvLine.FindSet(false)then begin
                ExportAttachment(122, PurchInvLine."Document No.", StartDate, EndDate, UserFilter, DataCompression);
                Counter+=1;
            end;
        /*repeat
                        Counter += 1;
                        ProgressDialog.Update();
                        if PurchInvLine."Document No." <> DocNo then
                            ExportAttachment(122, PurchInvLine."Document No.", StartDate, EndDate, UserFilter, DataCompression);
                        DocNo := PurchInvLine."Document No.";
                    until PurchInvLine.Next() = 0;
                    ProgressDialog.Close();
                    FinalTempBlob.CreateOutStream(FinalOutStream);
                    DataCompression.SaveZipArchive(FinalOutStream);
                    FinalTempBlob.CreateInStream(FinalInStream);
                    DownloadFromStream(FinalInStream, '', '', '', TempZipFileName);*/
        end;
        end;
        Message('Processed %1 documents and %2 attachments', Counter, AttachmentCounter);
    end;
    procedure ExportAttachment(TableNo: Integer; DocumentNo: Code[20]; StartDateFilter: Date; EndDateFilter: Date; UserFiltertxt: Text; DataComp: codeunit "Data Compression")
    var
        lTempBlob: Codeunit "Temp Blob";
        DocumentAttachment: Record "Document Attachment";
        lInStream: InStream;
        lOutStream: OutStream;
        Filename: Text;
        StartDateTimeFilter: DateTime;
        EndDateTimeFilter: DateTime;
    begin
        StartDateTimeFilter:=CreateDateTime(StartDateFilter, 0T);
        EndDateTimeFilter:=CreateDateTime(EndDateFilter, 0T);
        if(StartDateFilter <> 0D) and (EndDateFilter <> 0D)then DocumentAttachment.SetRange("Attached Date", StartDateTimeFilter, EndDateTimeFilter);
        DocumentAttachment.SetRange("Table ID", TableNo);
        DocumentAttachment.SetRange("No.", DocumentNo);
        if UserFiltertxt <> '' then DocumentAttachment.SetRange(User, UserFiltertxt);
        if DocumentAttachment.FindSet()then begin
            repeat Filename:=DocumentAttachment."File Name" + '.' + DocumentAttachment."File Extension";
                if(DocumentAttachment."Document Reference ID".HasValue) and (FilenameArray.IndexOf(Filename) = 0) and (DocumentAttachment."File Name" <> '')then begin // file has not been exported yet
                    lTempBlob.CreateOutStream(lOutStream);
                    DocumentAttachment."Document Reference ID".ExportStream(lOutStream);
                    lTempBlob.CreateInStream(lInStream);
                    DataComp.AddEntry(lInStream, Filename);
                    AttachmentCounter+=1;
                end;
            until DocumentAttachment.Next() = 0;
        end;
    end;
    var ZipFilename: Text;
    FilenameArray: List of[Text];
    ProgressDialog: Dialog;
    Counter: Integer;
    AttachmentCounter: Integer;
    ProgressDialogLabel: Label 'Processing: ';
    UserFilter: Code[50];
    ExportOptions: Enum "Export Purch. Doc. Type";
    GLAccountFilter: Text;
    StartDate: Date;
    EndDate: Date;
    FinalTempBlob: Codeunit "Temp Blob";
    FinalOutStream: OutStream;
    FinalInStream: InStream;
    DataCompression: Codeunit "Data Compression";
    TempZipFileName: Text;
}
