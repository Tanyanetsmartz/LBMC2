page 50030 "LBMC Quote Comparison Matrix"
{
    Editable = true;
    PageType = List;
    InsertAllowed = false;
    ModifyAllowed = true;
    DeleteAllowed = false;
    SourceTable = Item;
    ShowFilter = true;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("Quote Comp. Qty"; Rec."Quote Comp. Qty")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';

                    trigger OnValidate()
                    var
                        i: Integer;
                    begin
                        for i:=1 to ArrayLen(UnitCost)do UnitCost[i]:=GetUnitCost(i);
                    end;
                }
                field(UnitCost1; UnitCost[1])
                {
                    ApplicationArea = all;
                    Visible = Field1Visible;
                    CaptionClass = ColumnCaptions[1];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost2; UnitCost[2])
                {
                    ApplicationArea = all;
                    Visible = Field2Visible;
                    CaptionClass = ColumnCaptions[2];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost3; UnitCost[3])
                {
                    ApplicationArea = all;
                    Visible = Field3Visible;
                    CaptionClass = ColumnCaptions[3];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost4; UnitCost[4])
                {
                    ApplicationArea = all;
                    Visible = Field4Visible;
                    CaptionClass = ColumnCaptions[4];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost5; UnitCost[5])
                {
                    ApplicationArea = all;
                    Visible = Field5Visible;
                    CaptionClass = ColumnCaptions[5];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost6; UnitCost[6])
                {
                    ApplicationArea = all;
                    Visible = Field6Visible;
                    CaptionClass = ColumnCaptions[6];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost7; UnitCost[7])
                {
                    ApplicationArea = all;
                    Visible = Field7Visible;
                    CaptionClass = ColumnCaptions[7];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost8; UnitCost[8])
                {
                    ApplicationArea = all;
                    Visible = Field8Visible;
                    CaptionClass = ColumnCaptions[8];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost9; UnitCost[9])
                {
                    ApplicationArea = all;
                    Visible = Field9Visible;
                    CaptionClass = ColumnCaptions[9];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost10; UnitCost[10])
                {
                    ApplicationArea = all;
                    Visible = Field10Visible;
                    CaptionClass = ColumnCaptions[10];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost11; UnitCost[11])
                {
                    ApplicationArea = all;
                    Visible = Field11Visible;
                    CaptionClass = ColumnCaptions[11];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost12; UnitCost[12])
                {
                    ApplicationArea = all;
                    Visible = Field12Visible;
                    CaptionClass = ColumnCaptions[12];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost13; UnitCost[13])
                {
                    ApplicationArea = all;
                    Visible = Field13Visible;
                    CaptionClass = ColumnCaptions[13];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost14; UnitCost[14])
                {
                    ApplicationArea = all;
                    Visible = Field14Visible;
                    CaptionClass = ColumnCaptions[14];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost15; UnitCost[15])
                {
                    ApplicationArea = all;
                    Visible = Field15Visible;
                    CaptionClass = ColumnCaptions[15];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost16; UnitCost[16])
                {
                    ApplicationArea = all;
                    Visible = Field16Visible;
                    CaptionClass = ColumnCaptions[16];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost17; UnitCost[17])
                {
                    ApplicationArea = all;
                    Visible = Field17Visible;
                    CaptionClass = ColumnCaptions[17];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost18; UnitCost[18])
                {
                    ApplicationArea = all;
                    Visible = Field18Visible;
                    CaptionClass = ColumnCaptions[18];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost19; UnitCost[19])
                {
                    ApplicationArea = all;
                    Visible = Field19Visible;
                    CaptionClass = ColumnCaptions[19];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(UnitCost20; UnitCost[20])
                {
                    ApplicationArea = all;
                    Visible = Field20Visible;
                    CaptionClass = ColumnCaptions[20];
                    Style = Strong;
                    ToolTip = ' ';
                    Editable = false;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if ItemFilter <> '' then Rec.SetFilter("No.", ItemFilter);
        SetColCaptions();
        SetVisible();
    end;
    trigger OnAfterGetRecord()
    var
        i: Integer;
    begin
        for i:=1 to ArrayLen(UnitCost)do UnitCost[i]:=GetUnitCost(i);
    end;
    procedure LoadPage(_ItemFilter: text; _VendorFilter: Text; _MinQty: Decimal)
    begin
        VendorFilter:=_VendorFilter;
        ItemFilter:=_ItemFilter;
        MinQty:=_MinQty;
    end;
    procedure SetColCaptions()
    var
        i: Integer;
    begin
        Vendor.Reset();
        if VendorFilter <> '' then Vendor.SetFilter("No.", VendorFilter);
        if Vendor.FindSet()then repeat i+=1;
                ColumnCaptions[i]:=Vendor.Name;
                VendorNo[i]:=Vendor."No.";
            until(Vendor.Next() = 0) or (i = 20);
    end;
    procedure SetVisible()
    begin
        Field1Visible:=ColumnCaptions[1] <> '';
        Field2Visible:=ColumnCaptions[2] <> '';
        Field3Visible:=ColumnCaptions[3] <> '';
        Field4Visible:=ColumnCaptions[4] <> '';
        Field5Visible:=ColumnCaptions[5] <> '';
        Field6Visible:=ColumnCaptions[6] <> '';
        Field7Visible:=ColumnCaptions[7] <> '';
        Field8Visible:=ColumnCaptions[8] <> '';
        Field9Visible:=ColumnCaptions[9] <> '';
        Field10Visible:=ColumnCaptions[10] <> '';
        Field11Visible:=ColumnCaptions[11] <> '';
        Field12Visible:=ColumnCaptions[12] <> '';
        Field13Visible:=ColumnCaptions[13] <> '';
        Field14Visible:=ColumnCaptions[14] <> '';
        Field15Visible:=ColumnCaptions[15] <> '';
        Field16Visible:=ColumnCaptions[16] <> '';
        Field17Visible:=ColumnCaptions[17] <> '';
        Field18Visible:=ColumnCaptions[18] <> '';
        Field19Visible:=ColumnCaptions[19] <> '';
        Field20Visible:=ColumnCaptions[20] <> '';
    end;
    procedure GetUnitCost(index: Integer): Decimal var
        // PurchasePrice: Record "Purchase Price"; //BLB-136.Dk.1.0 31March 2026
        PurchasePrice: Record "Price List Line"; //BLB-136.Dk.1.0 31March 2026
        Stop: Boolean;
        RetVal: Decimal;
    begin
        PurchasePrice.Reset();
        //BLB-136.Dk.1.0 31March 2026 Start
        //PurchasePrice.SetRange("Item No.", Rec."No.");
        PurchasePrice.SetRange("Asset No.", Rec."No.");
        //PurchasePrice.SetRange("Vendor No.", VendorNo[index]);
        PurchasePrice.SetRange("Source No.", VendorNo[index]);
        //BLB-136.Dk.1.0 31March 2026 End
        PurchasePrice.setfilter("Starting Date", '..' + Format(WorkDate()));
        //PurchasePrice.SetRange("Ending Date", 0D, WorkDate());
        if MinQty > 0 then PurchasePrice.setrange("Minimum Quantity", 0, MinQty);
        if PurchasePrice.FindLast()then if Rec."Quote Comp. Qty" > 0 then exit(PurchasePrice."Direct Unit Cost" * Rec."Quote Comp. Qty")
            else
                exit(PurchasePrice."Direct Unit Cost");
        PurchasePrice.Reset();
        //BLB-136.Dk.1.0 31March 2026 Start
        // PurchasePrice.SetRange("Item No.", Rec."No.");
        // PurchasePrice.SetRange("Vendor No.", VendorNo[index]);
        PurchasePrice.SetRange("Asset No.", Rec."No.");
        PurchasePrice.SetRange("Source No.", VendorNo[index]);
        //BLB-136.Dk.1.0 31March 2026 End
        PurchasePrice.SetRange("Ending Date", 0D);
        if MinQty > 0 then PurchasePrice.setrange("Minimum Quantity", 0, MinQty);
        if PurchasePrice.FindSet()then repeat if(PurchasePrice."Starting Date" >= WorkDate()) and (PurchasePrice."Ending Date" <= WorkDate())then begin
                    if Rec."Quote Comp. Qty" > 0 then RetVal:=(PurchasePrice."Direct Unit Cost" * Rec."Quote Comp. Qty")
                    else
                        RetVal:=(PurchasePrice."Direct Unit Cost");
                    Stop:=true;
                end;
            until(PurchasePrice.Next() = 0) or Stop;
        exit(RetVal);
    end;
    var Vendor: Record Vendor;
    UnitCost: array[20]of Decimal;
    VendorNo: array[20]of Code[20];
    MinQty: Decimal;
    VendorFilter: Text;
    ItemFilter: Text;
    Field1Visible: Boolean;
    Field2Visible: Boolean;
    Field3Visible: Boolean;
    Field4Visible: Boolean;
    Field5Visible: Boolean;
    Field6Visible: Boolean;
    Field7Visible: Boolean;
    Field8Visible: Boolean;
    Field9Visible: Boolean;
    Field10Visible: Boolean;
    Field11Visible: Boolean;
    Field12Visible: Boolean;
    Field13Visible: Boolean;
    Field14Visible: Boolean;
    Field15Visible: Boolean;
    Field16Visible: Boolean;
    Field17Visible: Boolean;
    Field18Visible: Boolean;
    Field19Visible: Boolean;
    Field20Visible: Boolean;
    ColumnCaptions: array[20]of Text;
}
