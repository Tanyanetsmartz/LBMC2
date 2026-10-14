report 50014 "LBMC Change Costing Method"
{
    UseRequestPage = true;
    Caption = 'Change Costing Method';
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
        ExcelBuffer.Reset();
        if FirstRowHeader then ExcelBuffer.SetFilter("Row No.", '>%1', 1);
        ExcelBuffer.SetRange("Column No.", 1);
        if ExcelBuffer.FindSet()then repeat ExcelBuffer2.Reset();
                ExcelBuffer2.SetRange("Row No.", ExcelBuffer."Row No.");
                if ExcelBuffer2.FindSet()then repeat if ExcelBuffer2."Column No." = 1 then ItemNo:=ExcelBuffer2."Cell Value as Text";
                    until ExcelBuffer2.Next() = 0;
                if ItemNo <> '' then if Item.get(ItemNo)then begin
                        Item."Costing Method":=Item."Costing Method"::FIFO;
                        Item.Modify();
                    end;
                Clear(ItemNo);
            until ExcelBuffer.Next() = 0;
        ExcelBuffer.Reset();
        ExcelBuffer.DeleteAll();
        Message('Modification Complete');
    end;
    var ExcelBuffer: Record "Excel Buffer";
    ExcelBuffer2: Record "Excel Buffer";
    Item: Record Item;
    FileManagement: Codeunit "File Management";
    InStream: InStream;
    FromFile: Text;
    FileName: Text;
    SheetName: Text;
    LocText0001Txt: TextConst ENU = 'Upload Excel File';
    FirstRowHeader: Boolean;
    ItemNo: Code[20];
}
