report 50018 "LBMC Draft Sales Invoice"
{
    Caption = 'BBN Draft Sales Invoice';
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/BBNDraftSalesInvoice.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = where("Document Type"=const(Invoice));

            column(CompInfoPicture; CompanyInformation.Picture)
            {
            }
            column(Posting_Date; format("Posting Date"))
            {
            }
            column(No_; "No.")
            {
            }
            column(Payment_Terms_Code; PayTermsDescription)
            {
            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {
            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {
            }
            column(Sell_to_Address; "Sell-to Address")
            {
            }
            column(Sell_to_Address_2; "Sell-to Address 2")
            {
            }
            column(Sell_to_City; "Sell-to City")
            {
            }
            column(Sell_to_County; "Sell-to County")
            {
            }
            column(Sell_to_Post_Code; "Sell-to Post Code")
            {
            }
            column(CustAddress1; CustAddress[1])
            {
            }
            column(CustAddress2; CustAddress[2])
            {
            }
            column(CustAddress3; CustAddress[3])
            {
            }
            column(CustAddress4; CustAddress[4])
            {
            }
            column(CustAddress5; CustAddress[5])
            {
            }
            column(CustAddress6; CustAddress[6])
            {
            }
            column(CustAddress7; CustAddress[7])
            {
            }
            column(CustAddress8; CustAddress[8])
            {
            }
            column(CompAddress1; CompAddress[1])
            {
            }
            column(CompAddress2; CompAddress[2])
            {
            }
            column(CompAddress3; CompAddress[3])
            {
            }
            column(CompAddress4; CompAddress[4])
            {
            }
            column(CompAddress5; CompAddress[5])
            {
            }
            column(CompAddress6; CompAddress[6])
            {
            }
            column(CompAddress7; CompAddress[7])
            {
            }
            column(CompAddress8; CompAddress[8])
            {
            }
            column(DimAddress1; DimAddress[1])
            {
            }
            column(DimAddress2; DimAddress[2])
            {
            }
            column(DimAddress3; DimAddress[3])
            {
            }
            column(DimAddress4; DimAddress[4])
            {
            }
            column(DimAddress5; DimAddress[5])
            {
            }
            column(DimAddress6; DimAddress[6])
            {
            }
            column(DimAddress7; DimAddress[7])
            {
            }
            column(DimAddress8; DimAddress[8])
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
            column(PrevBal; PrevBal)
            {
            }
            column(PayRcvd; PayRcvd)
            {
            }
            column(ServDt; ServDt)
            {
            }
            column(Amount_Including_VAT; "Amount Including VAT")
            {
            }
            column(NonRecurring; NonRecurring)
            {
            }
            column(Credits; Credits)
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No."=field("No.");

                column(ItemNo_; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Unit_Cost; "Unit Cost")
                {
                }
                column(Unit_Price; "Unit Price")
                {
                }
                column(Line_Amount; "Line Amount")
                {
                }
                column(CircuitID; Bssi_UDF_L3)
                {
                }
                column(ALOC; Bssi_UDF_L1)
                {
                }
                column(ZLOC; Bssi_UDF_L2)
                {
                }
                column(PONO; Bssi_UDF_L4)
                {
                }
                column(ActivationDt; format(Bssi_UDF_L6))
                {
                }
            }
            trigger OnAfterGetRecord()
            begin
                FormatAddress.FormatAddr(CustAddress, "Sales Header"."Sell-to Customer Name", "Sales Header"."Sell-to Customer Name 2", "Sales Header"."Sell-to Address", "Sales Header"."Sell-to Address 2", "Sales Header"."Sell-to City", '', '', '', '');
                FormatAddress.FormatAddr(CompAddress, CompanyInformation.Name, '', '', CompanyInformation.Address, CompanyInformation."Address 2", CompanyInformation.City, CompanyInformation."Post Code", CompanyInformation.County, '');
                CustLedgerEntry.Reset();
                CustLedgerEntry.SetRange("Customer No.", "Sales Header"."Sell-to Customer No.");
                CustLedgerEntry.SetRange(Open, true);
                if CustLedgerEntry.FindSet()then repeat CustLedgerEntry.CalcFields("Remaining Amt. (LCY)");
                        if CustLedgerEntry."Document Type" = CustLedgerEntry."Document Type"::Invoice then PrevBal+=CustLedgerEntry."Remaining Amt. (LCY)";
                        if CustLedgerEntry."Document Type" = CustLedgerEntry."Document Type"::Payment then PayRcvd+=CustLedgerEntry."Remaining Amt. (LCY)";
                    until CustLedgerEntry.Next() = 0;
                ServDt:=GetMonthName(Date2DMY("Posting Date", 02)) + ' ' + Format(Date2DMY("Posting Date", 03));
                if PaymentTerms.get("Sales Header"."Payment Terms Code")then PayTermsDescription:=PaymentTerms.Description;
                DimensionValue.Reset();
                DimensionValue.SetRange("Dimension Code", 'COMPANY');
                DimensionValue.SetRange(Code, "Shortcut Dimension 1 Code");
                //if DimensionValue.FindFirst()then FormatAddress.FormatAddr(DimAddress, DimensionValue.Name, '', '', DimensionValue.BssiBillingAddress, DimensionValue.BssiBillingAddress2, DimensionValue.BssiBillingCity, DimensionValue.BssiBillingState, DimensionValue.BssiBillingZipCode, DimensionValue.BssiBillingCountry); //BLB-136.Dk.1.0 31March 2026
                if DimensionValue.FindFirst()then FormatAddress.FormatAddr(DimAddress, DimensionValue.Name, '', '', DimensionValue.BssiBillingAddr1, DimensionValue.BssiBillingAddress2, DimensionValue.BssiBillingCity, DimensionValue.BssiBillingState, DimensionValue.BssiBillingZipCode, DimensionValue.BssiBillingCountry); //BLB-136.Dk.1.0 31March 2026
            end;
        }
    }
    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
    end;
    procedure GetMonthName(MonthInt: Integer)MthName: Text;
    begin
        if MonthInt = 1 then exit('JAN');
        if MonthInt = 2 then exit('FEB');
        if MonthInt = 3 then exit('MAR');
        if MonthInt = 4 then exit('APR');
        if MonthInt = 5 then exit('MAY');
        if MonthInt = 6 then exit('JUN');
        if MonthInt = 7 then exit('JUL');
        if MonthInt = 8 then exit('AUG');
        if MonthInt = 9 then exit('SEPT');
        if MonthInt = 10 then exit('OCT');
        if MonthInt = 11 then exit('NOV');
        if MonthInt = 12 then exit('DEC');
    end;
    var CompanyInformation: Record "Company Information";
    CustLedgerEntry: Record "Cust. Ledger Entry";
    PaymentTerms: Record "Payment Terms";
    FormatAddress: Codeunit "Format Address";
    DimensionValue: Record "Dimension Value";
    CustAddress: array[8]of Text[100];
    CompAddress: array[8]of Text[100];
    DimAddress: array[8]of Text[100];
    PrevBal: Decimal;
    PayRcvd: Decimal;
    ServDt: Text;
    PayTermsDescription: Text;
    NonRecurring: Decimal;
    Credits: Decimal;
}
