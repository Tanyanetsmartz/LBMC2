report 50001 "LBMC Purchase Order"
{
    Caption = 'Purchase Order';
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/BBNPurchaseOrder.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = where("Document Type"=const(Order));

            column(No_; "No.")
            {
            }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
            {
            }
            column(Order_Date; format("Order Date"))
            {
            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {
            }
            column(Buy_from_Address; "Buy-from Address")
            {
            }
            column(Buy_from_Address_2; "Buy-from Address 2")
            {
            }
            column(Buy_from_City; "Buy-from City")
            {
            }
            column(Buy_from_County; "Buy-from County")
            {
            }
            column(Buy_from_Post_Code; "Buy-from Post Code")
            {
            }
            column(Ship_to_Name; "Ship-to Name")
            {
            }
            column(Ship_to_Address; "Ship-to Address")
            {
            }
            column(Ship_to_Address_2; "Ship-to Address 2")
            {
            }
            column(Ship_to_City; "Ship-to City")
            {
            }
            column(Ship_to_County; "Ship-to County")
            {
            }
            column(Ship_to_Post_Code; "Ship-to Post Code")
            {
            }
            column(CompInfoAddress; CompanyInformation.Address)
            {
            }
            column(CompInfoAddress2; CompanyInformation."Address 2")
            {
            }
            column(CompInfoCity; CompanyInformation.City)
            {
            }
            column(CompInfoState; CompanyInformation.County)
            {
            }
            column(CompInfoPostCode; CompanyInformation."Post Code")
            {
            }
            column(VendAddress1; VendAddress[1])
            {
            }
            column(VendAddress2; VendAddress[2])
            {
            }
            column(VendAddress3; VendAddress[3])
            {
            }
            column(VendAddress4; VendAddress[4])
            {
            }
            column(VendAddress5; VendAddress[5])
            {
            }
            column(VendAddress6; VendAddress[6])
            {
            }
            column(VendAddress7; VendAddress[7])
            {
            }
            column(VendAddress8; VendAddress[8])
            {
            }
            column(ShipToAddress1; ShipToAddress[1])
            {
            }
            column(ShipToAddress2; ShipToAddress[2])
            {
            }
            column(ShipToAddress3; ShipToAddress[3])
            {
            }
            column(ShipToAddress4; ShipToAddress[4])
            {
            }
            column(ShipToAddress5; ShipToAddress[5])
            {
            }
            column(ShipToAddress6; ShipToAddress[6])
            {
            }
            column(ShipToAddress7; ShipToAddress[7])
            {
            }
            column(ShipToAddress8; ShipToAddress[8])
            {
            }
            column(BillToAddress1; BillToAddress[1])
            {
            }
            column(BillToAddress2; BillToAddress[2])
            {
            }
            column(BillToAddress3; BillToAddress[3])
            {
            }
            column(BillToAddress4; BillToAddress[4])
            {
            }
            column(BillToAddress5; BillToAddress[5])
            {
            }
            column(BillToAddress6; BillToAddress[6])
            {
            }
            column(BillToAddress7; BillToAddress[7])
            {
            }
            column(BillToAddress8; BillToAddress[8])
            {
            }
            column(BillToName; BillToName)
            {
            }
            column(Vendor_Order_No_; "Vendor Order No.")
            {
            }
            column(Payment_Terms_Code; PayTermsDesp)
            {
            }
            column(Expected_Receipt_Date; format("Expected Receipt Date"))
            {
            }
            column(Shipment_Method_Code; "Shipment Method Code")
            {
            }
            column(Buy_from_Contact; BuyerName)
            {
            }
            column(CommentText; CommentText)
            {
            }
            column(CompInfoPicture; CompanyInformation.Picture)
            {
            }
            column(LocationName; LocationName)
            {
            }
            column(TotalPOAmt; TotalPOAmt)
            {
            }
            column(Disclaimer; Disclaimer)
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type"=field("Document Type"), "Document No."=field("No.");

                column(SrNo; SrNo)
                {
                }
                column(ItemNo_; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Direct_Unit_Cost; "Direct Unit Cost")
                {
                }
                column(Line_Amount; "Line Amount")
                {
                }
                column(Job_No_; "Job No.")
                {
                }
                trigger OnAfterGetRecord()
                begin
                    SrNo+=1;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                FormatAddress.FormatAddr(VendAddress, "Buy-from Vendor Name", "Buy-from Vendor Name 2", "Buy-from Address", "Buy-from Address 2", "Buy-from City", "Buy-from Post Code", "Buy-from County", "Buy-from Country/Region Code", '');
                FormatAddress.FormatAddr(ShipToAddress, "Ship-to Name", "Ship-to Name 2", "Ship-to Address", "Ship-to Address 2", "Ship-to City", "Ship-to Post Code", "Ship-to County", "Ship-to Country/Region Code", '');
                //FormatAddress.FormatAddr(BillToAddress, "Pay-to Name", "Pay-to Name 2", "Pay-to Address", "Pay-to Address 2", "Pay-to City", "Pay-to Post Code", "Pay-to County", "Pay-to Country/Region Code", '');
                FormatAddress.FormatAddr(BillToAddress, CompanyInformation.Address, CompanyInformation."Address 2", CompanyInformation.City, CompanyInformation."Post Code", CompanyInformation.County, CompanyInformation."Country/Region Code", '', '', '');
                PurchCommentLine.Reset();
                PurchCommentLine.SetRange("Document Type", "Purchase Header"."Document Type");
                PurchCommentLine.SetRange("No.", "Purchase Header"."No.");
                PurchCommentLine.SetRange("Document Line No.", 0);
                if PurchCommentLine.FindSet()then repeat CommentText+=PurchCommentLine.Comment + ' ';
                    until PurchCommentLine.Next() = 0;
                PurchaseLine.Reset();
                PurchaseLine.SetRange("Document Type", "Purchase Header"."Document Type");
                PurchaseLine.SetRange("Document No.", "Purchase Header"."No.");
                if PurchaseLine.FindSet()then repeat TotalPOAmt+=PurchaseLine."Line Amount";
                    until PurchaseLine.Next() = 0;
                if PaymentTerms.get("Purchase Header"."Payment Terms Code")then PayTermsDesp:=PaymentTerms.Description;
                if "Purchase Header"."Purchaser Code" <> '' then if SalespersonPurchaser.get("Purchase Header"."Purchaser Code")then BuyerName:=SalespersonPurchaser.Name;
                if "Purchase Header"."Location Code" <> '' then if Location.get("Purchase Header"."Location Code")then LocationName:=Location.Name;
                if "Purchase Header"."Shortcut Dimension 1 Code" <> '' then if DimensionValue.get(GeneralLedgerSetup."Global Dimension 1 Code", "Purchase Header"."Shortcut Dimension 1 Code")then BillToName:=DimensionValue.Name;
                if "Consturction PO" then begin
                    if LBMCVendorContract.get("Buy-from Vendor No.", "Contract Code")then ContractDate:=LBMCVendorContract.Date;
                    Disclaimer:=StrSubstNo(PurchSetup.GetContructionPODisplaimer(), "Contract Code", ContractDate);
                end;
            end;
        }
    }
    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
        GeneralLedgerSetup.Get();
        PurchSetup.Get();
    end;
    var PurchCommentLine: Record "Purch. Comment Line";
    CompanyInformation: Record "Company Information";
    GeneralLedgerSetup: Record "General Ledger Setup";
    SalespersonPurchaser: Record "Salesperson/Purchaser";
    Location: Record Location;
    PurchaseLine: Record "Purchase Line";
    PaymentTerms: Record "Payment Terms";
    DimensionValue: Record "Dimension Value";
    LBMCVendorContract: Record "LBMC Vendor Contract";
    FormatAddress: Codeunit "Format Address";
    PurchSetup: Record "Purchases & Payables Setup";
    VendAddress: array[8]of Text[100];
    ShipToAddress: array[8]of Text[100];
    BillToAddress: array[8]of Text[100];
    LocationName: Text;
    ContractDate: Date;
    CommentText: Text;
    BillToName: Text;
    SrNo: Integer;
    TotalPOAmt: Decimal;
    PayTermsDesp: Text;
    BuyerName: Text;
    Disclaimer: Text;
}
