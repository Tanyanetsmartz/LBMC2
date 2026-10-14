report 50016 "LBMC Upload Purch. Price"
{
    UseRequestPage = true;
    Caption = 'Upload Purchase Prices';
    UsageCategory = Tasks;
    ApplicationArea = all;
    ProcessingOnly = true;

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
        ExcelBuffer.Setrange("Row No.", 1);
        if ExcelBuffer.FindSet()then repeat if ExcelBuffer."Column No." = 2 then VendorNo:=ExcelBuffer."Cell Value as Text";
            until ExcelBuffer.Next() = 0;
        ExcelBuffer.Reset();
        ExcelBuffer.Setrange("Row No.", 2);
        if ExcelBuffer.FindSet()then repeat if ExcelBuffer."Column No." = 2 then if ExcelBuffer."Cell Value as Text" <> '' then Evaluate(StartDate, ExcelBuffer."Cell Value as Text");
            until ExcelBuffer.Next() = 0;
        ExcelBuffer.Reset();
        ExcelBuffer.Setrange("Row No.", 3);
        if ExcelBuffer.FindSet()then repeat if ExcelBuffer."Column No." = 2 then if ExcelBuffer."Cell Value as Text" <> '' then Evaluate(EndDate, ExcelBuffer."Cell Value as Text");
            until ExcelBuffer.Next() = 0;
        if StartDate <> 0D then StartDate:=StartDate + 1;
        if EndDate <> 0D then EndDate:=EndDate + 1;
        ExcelBuffer.Reset();
        ExcelBuffer.Setrange("Row No.", 5);
        ExcelBuffer.setfilter("Column No.", '>%1', 3);
        if ExcelBuffer.FindSet()then repeat if ExcelBuffer."Cell Value as Text" <> '' then begin
                    i+=1;
                    Evaluate(MinQty[i], ExcelBuffer."Cell Value as Text");
                END;
            until ExcelBuffer.Next() = 0;
        ExcelBuffer.Reset();
        ExcelBuffer.setfilter("Row No.", '>%1', 5);
        ExcelBuffer.SetRange("Column No.", 1);
        if ExcelBuffer.FindSet()then repeat i:=0;
                ExcelBuffer2.Reset();
                ExcelBuffer2.SetRange("Row No.", ExcelBuffer."Row No.");
                if ExcelBuffer2.FindSet()then repeat if ExcelBuffer2."Column No." = 1 then ItemNo:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." = 3 then UOM:=ExcelBuffer2."Cell Value as Text";
                        if ExcelBuffer2."Column No." > 3 then begin
                            i+=1;
                            if ExcelBuffer2."Cell Value as Text" <> '' then Evaluate(UnitCost[i], ExcelBuffer2."Cell Value as Text");
                        end;
                    until ExcelBuffer2.Next() = 0;
                for i:=1 to ArrayLen(UnitCost)do if UnitCost[i] > 0 then begin
                        PurchasePrice.Init();
                        //BLB-136.DK.1.0 31March2026 Start
                        //PurchasePrice."Item No." := ItemNo; 
                        PurchasePrice."Asset No.":=ItemNo;
                        //PurchasePrice."Vendor No." := VendorNo;
                        PurchasePrice."Source No.":=VendorNo;
                        //BLB-136.DK.1.0 31March2026 End
                        PurchasePrice."Unit of Measure Code":=UOM;
                        if StartDate = 0D then PurchasePrice."Starting Date":=WorkDate()
                        else
                            PurchasePrice."Starting Date":=StartDate;
                        if EndDate <> 0D then PurchasePrice."Ending Date":=EndDate;
                        PurchasePrice."Minimum Quantity":=MinQty[i];
                        PurchasePrice."Direct Unit Cost":=UnitCost[i];
                        PurchasePrice.Insert(true);
                    end;
                ItemNo:='';
                UOM:='';
                //Clear(MinQty);
                Clear(UnitCost);
            until ExcelBuffer.Next() = 0;
        ExcelBuffer.Reset();
        ExcelBuffer.DeleteAll();
        Message('Upload Complete');
    end;
    var ExcelBuffer: Record "Excel Buffer";
    ExcelBuffer2: Record "Excel Buffer";
    //PurchasePrice: Record "Purchase Price"; //BLB-136.DK.1.0 31March2026
    PurchasePrice: Record "Price List Line"; //BLB-136.DK.1.0 31March2026
    FileManagement: Codeunit "File Management";
    InStream: InStream;
    FromFile: Text;
    FileName: Text;
    SheetName: Text;
    LocText0001Txt: TextConst ENU = 'Upload Excel File';
    FirstRowHeader: Boolean;
    ItemNo: Code[20];
    VendorNo: Code[20];
    MinQty: array[100]of Decimal;
    UnitCost: array[100]of Decimal;
    UOM: Code[10];
    StartDate: Date;
    EndDate: Date;
    i: Integer;
}
