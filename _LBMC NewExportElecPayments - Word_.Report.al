report 50017 "LBMCExportElecPayments-WordNew"
{
    ApplicationArea = All;
    Caption = 'LBMC Export Electronic Payments';
    WordMergeDataItem = "Gen. Journal Line";
    DefaultRenderingLayout = Attachments;

    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            DataItemTableView = sorting("ACH No.", "Journal Template Name", "Journal Batch Name", "Line No.") where("Document Type" = filter(Payment | Refund | Invoice));
            RequestFilterFields = "Journal Template Name", "Journal Batch Name";

            column(Gen__Journal_Line_Journal_Template_Name; "Journal Template Name")
            {
            }
            column(Gen__Journal_Line_Journal_Batch_Name; "Journal Batch Name")
            {
            }
            column(Gen__Journal_Line_Line_No_; "Line No.")
            {
            }
            column(Gen__Journal_Line_Applies_to_ID; "Applies-to ID")
            {
            }


            dataitem(LetterText; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));

                column(GreetingText; GreetingLbl)
                {
                }
                column(ClosingText; ClosingLbl)
                {
                }
                column(BodyText; BodyLbl)
                {
                }
                column(CompanyAddress_1; CompanyAddress[1])
                {
                }
                column(CompanyAddress_2; CompanyAddress[2])
                {
                }
                column(CompanyAddress_3; CompanyAddress[3])
                {
                }
                column(CompanyAddress_4; CompanyAddress[4])
                {
                }
                column(CompanyAddress_5; CompanyAddress[5])
                {
                }
                column(CompanyAddress_6; CompanyAddress[6])
                {
                }
                column(CompanyAddress_7; CompanyAddress[7])
                {
                }
                column(CompanyAddress_8; CompanyAddress[8])
                {
                }
                column(CompanyLegalOffice; '')
                {
                }
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = sorting(Number);

                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));

                    // column(CopyTxt; CopyTxt)
                    // {
                    // }
                    column(PayeeAddress_1_; PayeeAddress[1])
                    {
                    }
                    column(PayeeAddress_2_; PayeeAddress[2])
                    {
                    }
                    column(PayeeAddress_3_; PayeeAddress[3])
                    {
                    }
                    column(PayeeAddress_4_; PayeeAddress[4])
                    {
                    }
                    column(PayeeAddress_5_; PayeeAddress[5])
                    {
                    }
                    column(PayeeAddress_6_; PayeeAddress[6])
                    {
                    }
                    column(PayeeAddress_7_; PayeeAddress[7])
                    {
                    }
                    column(PayeeAddress_8_; PayeeAddress[8])
                    {
                    }
                    column(PayeeType; Format(PayeeType))
                    {
                    }
                    column(PayeeNo; PayeeNo)
                    {
                    }
                    column(Gen__Journal_Line___Document_No__; "Gen. Journal Line"."Document No.")
                    {
                    }
                    column(SettleDate; FormatRemittanceDate("Gen. Journal Line"."Document Date"))
                    {
                    }
                    column(ExportAmount; Format(-ExportAmount))
                    {
                    }
                    column(PayeeBankTransitNo; PayeeBankTransitNo)
                    {
                    }
                    column(PayeeBankAccountNo; PayeeBankAccountNo)
                    {
                    }
                    column(myNumber; CopyLoop.Number)
                    {
                    }
                    column(myBal; "Gen. Journal Line"."Bal. Account No.")
                    {
                    }
                    column(mypostingdate; "Gen. Journal Line"."Posting Date")
                    {
                    }
                    column(Gen__Journal_Line___Applies_to_Doc__No__; "Gen. Journal Line"."Applies-to Doc. No.")
                    {
                    }
                    column(myType; myType)
                    {
                    }
                    column(AmountPaid; AmountPaid)
                    {
                    }
                    column(DiscountTaken; DiscountTaken)
                    {
                    }
                    column(VendLedgEntry__Remaining_Amt___LCY__; -VendLedgEntry."Remaining Amt. (LCY)")
                    {
                    }
                    column(VendLedgEntry__Document_Date_; FormatRemittanceDate(VendLedgEntry."Document Date"))
                    {
                    }
                    column(VendLedgEntry__External_Document_No__; VendLedgEntry."External Document No.")
                    {
                    }
                    column(VendLedgEntry__Document_Type_; VendLedgEntry."Document Type")
                    {
                    }
                    column(AmountPaid_Control57; AmountPaid)
                    {
                    }
                    column(DiscountTaken_Control58; DiscountTaken)
                    {
                    }
                    column(CustLedgEntry__Remaining_Amt___LCY__; -CustLedgEntry."Remaining Amt. (LCY)")
                    {
                    }
                    column(CustLedgEntry__Document_Date_; CustLedgEntry."Document Date")
                    {
                    }
                    column(CustLedgEntry__Document_No__; CustLedgEntry."Document No.")
                    {
                    }
                    column(CustLedgEntry__Document_Type_; CustLedgEntry."Document Type")
                    {
                    }
                    column(PageLoop_Number; Number)
                    {
                    }
                    column(REMITTANCE_ADVICECaption; REMITTANCE_ADVICECaptionLbl)
                    {
                    }
                    column(To_Caption; To_CaptionLbl)
                    {
                    }
                    column(Remittance_Advice_Number_Caption; Remittance_Advice_Number_CaptionLbl)
                    {
                    }
                    column(Settlement_Date_Caption; Settlement_Date_CaptionLbl)
                    {
                    }

                    column(RequestNoLbl; 'ACH No.')
                    {

                    }

                    column(ACHNo; "Gen. Journal Line"."ACH No.")
                    {

                    }
                    column(Page_Caption; Page_CaptionLbl)
                    {
                    }
                    column(ExportAmountCaption; ExportAmountCaptionLbl)
                    {
                    }
                    column(PayeeBankTransitNoCaption; PayeeBankTransitNoCaptionLbl)
                    {
                    }
                    column(Deposited_In_Caption; Deposited_In_CaptionLbl)
                    {
                    }
                    column(PayeeBankAccountNoCaption; PayeeBankAccountNoCaptionLbl)
                    {
                    }
                    column(Vendor_Ledger_Entry__Document_Type_Caption; "Vendor Ledger Entry".FieldCaption("Document Type"))
                    {
                    }
                    column(Cust__Ledger_Entry__Document_No__Caption; "Cust. Ledger Entry".FieldCaption("Document No."))
                    {
                    }
                    column(Vendor_Ledger_Entry__Document_Date_Caption; "Vendor Ledger Entry".FieldCaption("Document Date"))
                    {
                    }
                    column(Remaining_Amt___LCY___Control36Caption; Remaining_Amt___LCY___Control36CaptionLbl)
                    {
                    }
                    column(DiscountTaken_Control38Caption; DiscountTaken_Control38CaptionLbl)
                    {
                    }
                    column(AmountPaid_Control43Caption; AmountPaid_Control43CaptionLbl)
                    {
                    }
                    dataitem(PrintCompanyAddress; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));

                        column(CompanyPicture; CompanyInfo.Picture)
                        {
                        }
                        column(CompanyAddress_1_; CompanyAddress[1])
                        {
                        }
                        column(CompanyAddress_2_; CompanyAddress[2])
                        {
                        }
                        column(CompanyAddress_3_; CompanyAddress[3])
                        {
                        }
                        column(CompanyAddress_4_; CompanyAddress[4])
                        {
                        }
                        column(CompanyAddress_5_; CompanyAddress[5])
                        {
                        }
                        column(CompanyAddress_6_; CompanyAddress[6])
                        {
                        }
                        column(CompanyAddress_7_; CompanyAddress[7])
                        {
                        }
                        column(CompanyAddress_8_; CompanyAddress[8])
                        {
                        }
                        trigger OnAfterGetRecord()
                        begin
                            CompanyInfo.Get();
                            CompanyInfo.CalcFields(Picture);
                            FormatCompanyAddress(CompanyInfo);
                            // FormatAddress.Company(CompanyAddress, CompanyInfo);
                            // if CompanyAddress[5] <> '' then CompanyAddress[5] := StrSubstNo(', %1', CompanyAddress[5]);
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not PrintCompany then
                                CurrReport.Break();
                        end;
                    }
                    dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
                    {
                        DataItemLink = "Applies-to ID" = field("Applies-to ID");
                        DataItemLinkReference = "Gen. Journal Line";
                        DataItemTableView = sorting("Customer No.", Open, Positive, "Due Date", "Currency Code") ORDER(Descending) where(Open = const(true));

                        column(Cust__Ledger_Entry__Document_Type_; "Document Type")
                        {
                        }
                        column(Cust__Ledger_Entry__Document_No__; "Document No.")
                        {
                        }
                        column(Cust__Ledger_Entry__Document_Date_; FormatRemittanceDate("Document Date"))
                        {
                        }
                        column(Remaining_Amt___LCY__; -"Remaining Amt. (LCY)")
                        {
                        }
                        column(DiscountTaken_Control49; DiscountTaken)
                        {
                        }
                        column(AmountPaid_Control50; AmountPaid)
                        {
                        }
                        column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
                        {
                        }
                        column(Cust__Ledger_Entry_Applies_to_ID; "Applies-to ID")
                        {
                        }
                        trigger OnAfterGetRecord()
                        begin
                            CalcFields("Remaining Amt. (LCY)");
                            if ("Pmt. Discount Date" >= "Gen. Journal Line"."Document Date") and ("Remaining Pmt. Disc. Possible" <> 0) and ((-ExportAmount - TotalAmountPaid) - "Remaining Pmt. Disc. Possible" >= -"Amount to Apply") then begin
                                DiscountTaken := -"Remaining Pmt. Disc. Possible";
                                AmountPaid := -("Amount to Apply" - "Remaining Pmt. Disc. Possible");
                            end
                            else begin
                                DiscountTaken := 0;
                                if (-ExportAmount - TotalAmountPaid) > -"Amount to Apply" then
                                    AmountPaid := -"Amount to Apply"
                                else
                                    AmountPaid := -ExportAmount - TotalAmountPaid;
                            end;
                            if AmountPaid = 0 then begin
                                CurrReport.Skip();
                                exit;
                            end;
                            TotalAmountPaid := TotalAmountPaid + AmountPaid;
                            IsSummary := true;
                        end;

                        trigger OnPreDataItem()
                        begin
                            // if "Gen. Journal Line"."Applies-to ID" = '' then CurrReport.Break();
                            // if BankAccountIs = BankAccountIs::Acnt then begin
                            //     if "Gen. Journal Line"."Bal. Account Type" <> "Gen. Journal Line"."Bal. Account Type"::Customer then CurrReport.Break();
                            //     SetRange("Customer No.", "Gen. Journal Line"."Bal. Account No.");
                            // end
                            // else begin
                            //     if "Gen. Journal Line"."Account Type" <> "Gen. Journal Line"."Account Type"::Customer then CurrReport.Break();
                            //     SetRange("Customer No.", "Gen. Journal Line"."Account No.");
                            // end;


                            // No ledger rows may print outside the journal-line buffer.
                            SetRange("Entry No.", 0);
                            CurrReport.Break();
                        end;
                    }
                    dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
                    {
                        DataItemLink = "Applies-to ID" = field("Applies-to ID");
                        DataItemLinkReference = "Gen. Journal Line";
                        DataItemTableView = sorting("Vendor No.", Open, Positive, "Due Date", "Currency Code") ORDER(Descending) where(Open = const(true));

                        column(Vendor_Ledger_Entry__Document_Type_; "Document Type")
                        {
                        }
                        column(Vendor_Ledger_Entry__External_Document_No__; "External Document No.")
                        {
                        }
                        column(Vendor_Ledger_Entry__Document_Date_; FormatRemittanceDate("Document Date"))
                        {
                        }
                        column(Remaining_Amt___LCY___Control36; -"Remaining Amt. (LCY)")
                        {
                        }
                        column(DiscountTaken_Control38; DiscountTaken)
                        {
                        }
                        column(AmountPaid_Control43; AmountPaid)
                        {
                        }
                        column(Vendor_Ledger_Entry_Entry_No_; "Entry No.")
                        {
                        }
                        column(Vendor_Ledger_Entry_Applies_to_ID; "Applies-to ID")
                        {
                        }
                        trigger OnAfterGetRecord()
                        begin
                            CalcFields("Remaining Amt. (LCY)");
                            if ("Pmt. Discount Date" >= "Gen. Journal Line"."Document Date") and ("Remaining Pmt. Disc. Possible" <> 0) and ((-ExportAmount - TotalAmountPaid) - "Remaining Pmt. Disc. Possible" >= -"Amount to Apply") then begin
                                DiscountTaken := -"Remaining Pmt. Disc. Possible";
                                AmountPaid := -("Amount to Apply" - "Remaining Pmt. Disc. Possible");
                            end
                            else begin
                                DiscountTaken := 0;
                                if (-ExportAmount - TotalAmountPaid) > -"Amount to Apply" then
                                    AmountPaid := -"Amount to Apply"
                                else
                                    AmountPaid := -ExportAmount - TotalAmountPaid;
                            end;
                            if AmountPaid = 0 then begin
                                CurrReport.Skip();
                                exit;
                            end;
                            TotalAmountPaid := TotalAmountPaid + AmountPaid;
                            IsSummary := true;
                        end;

                        trigger OnPreDataItem()
                        begin
                            // if "Gen. Journal Line"."Applies-to ID" = '' then CurrReport.Break();
                            // if BankAccountIs = BankAccountIs::Acnt then begin
                            //     if "Gen. Journal Line"."Bal. Account Type" <> "Gen. Journal Line"."Bal. Account Type"::Vendor then CurrReport.Break();
                            //     SetRange("Vendor No.", "Gen. Journal Line"."Bal. Account No.");
                            // end
                            // else begin
                            //     if "Gen. Journal Line"."Account Type" <> "Gen. Journal Line"."Account Type"::Vendor then CurrReport.Break();
                            //     SetRange("Vendor No.", "Gen. Journal Line"."Account No.");
                            // end;
                            // No ledger rows may print outside the journal-line buffer.
                            SetRange("Entry No.", 0);
                            CurrReport.Break();
                        end;


                    }
                    dataitem(CustomerInfo; "Integer")
                    {
                        DataItemTableView = sorting(Number) ORDER(Ascending);

                        column(AmountPaid_Customer; DetailAmountPaid)
                        {
                        }
                        column(DiscountTaken_Customer; DetailDiscountTaken)
                        {
                        }
                        column(Cust_Remaining_Amt_LCY; DetailAmountDue)
                        {
                        }
                        column(Cust_Document_Date; FormatRemittanceDate(DetailDocumentDate))
                        {
                        }
                        column(Cust_Document_No; DetailDocumentNo)
                        {
                        }
                        column(Cust_Document_Type; DetailDocumentType)
                        {
                        }
                        column(PostingDate_Customer; FormatRemittanceDate(DetailPostingDate))
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            LoadGroupDetail(Number);
                            if DetailAmountPaid = 0 then begin
                                CurrReport.Skip();
                                exit;
                            end;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if (PayeeType <> PayeeType::Customer) or (DetailAmountsPaid.Count() = 0) then begin
                                CurrReport.Break();
                                exit;
                            end;
                            SetRange(Number, 1, DetailAmountsPaid.Count());
                        end;
                    }
                    dataitem(VendorInfo; "Integer")
                    {
                        DataItemTableView = sorting(Number) ORDER(Ascending);

                        column(Vend_Remaining_Amt_LCY; DetailAmountDue)
                        {
                        }
                        column(Vend_Document_Date; FormatRemittanceDate(DetailDocumentDate))
                        {
                        }
                        column(Vend_External_Document_No; DetailDocumentNo)
                        {
                        }
                        column(Vend_Document_Type; DetailDocumentType)
                        {
                        }
                        column(AmountPaid_Vendor; DetailAmountPaid)
                        {
                        }
                        column(DiscountTaken_Vendor; DetailDiscountTaken)
                        {
                        }
                        column(PostingDate_Vendor; FormatRemittanceDate(DetailPostingDate))
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            LoadGroupDetail(Number);
                            if DetailAmountPaid = 0 then begin
                                CurrReport.Skip();
                                exit;
                            end;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if (PayeeType <> PayeeType::Vendor) or (DetailAmountsPaid.Count() = 0) then begin
                                CurrReport.Break();
                                exit;
                            end;
                            SetRange(Number, 1, DetailAmountsPaid.Count());
                        end;
                    }
                    dataitem(Unapplied; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));

                        column(Text004; Text004Lbl)
                        {
                        }
                        column(AmountPaid_Control65; AmountPaid)
                        {
                        }
                        column(Unapplied_Number; Number)
                        {
                        }
                        trigger OnAfterGetRecord()
                        begin
                            AmountPaid := -ExportAmount - TotalAmountPaid;
                            if AmountPaid = 0 then begin
                                CurrReport.Skip();
                                exit;
                            end;
                        end;

                        trigger OnPreDataItem()
                        begin
                            CurrReport.Break();
                        end;
                    }
                    trigger OnPreDataItem()
                    begin
                        myType := PayeeType; // an Integer variable refer to  option type
                    end;
                }
                trigger OnAfterGetRecord()
                begin
                    AmountPaid := SaveAmountPaid;
                    // if Number = 1 then // Original
                    //     Clear(CopyTxt)
                    // else
                    //     CopyTxt := CopyLoopLbl;
                    if "Gen. Journal Line"."Applies-to Doc. No." = '' then
                        Clear(TotalAmountPaid);
                end;

                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, 1);
                    //SetRange(Number, 1, NoCopies + 1);
                    SaveAmountPaid := AmountPaid;
                end;
            }
            trigger OnAfterGetRecord()

            begin
                if ("Amount (LCY)" = 0) or not IsLineForSelectedBank("Gen. Journal Line") then begin
                    CurrReport.Skip();
                    exit;
                end;
                if "ACH No." <> '' then begin
                    if PrintedACHNumbers.Contains(GetACHGroupKey("Gen. Journal Line")) then begin
                        CurrReport.Skip();
                        exit;
                    end;
                    PrintedACHNumbers.Add(GetACHGroupKey("Gen. Journal Line"));
                end;
                IsSummary := false;
                Clear(VendLedgEntry);
                Clear(CustLedgEntry);
                if "Account Type" = "Account Type"::"Bank Account" then begin
                    BankAccountIs := BankAccountIs::Acnt;
                    if "Account No." <> BankAccount."No." then
                        CurrReport.Skip();
                end
                else
                    if "Bal. Account Type" = "Bal. Account Type"::"Bank Account" then begin
                        BankAccountIs := BankAccountIs::BalAcnt;
                        if "Bal. Account No." <> BankAccount."No." then
                            CurrReport.Skip();
                    end
                    else
                        CurrReport.Skip();
                if BankAccountIs = BankAccountIs::Acnt then begin
                    ExportAmount := "Amount (LCY)";
                    PayeeNo := "Bal. Account No.";
                    if "Bal. Account Type" = "Bal. Account Type"::Vendor then begin
                        PayeeType := PayeeType::Vendor;
                        Vendor.Get("Bal. Account No.");
                    end
                    else
                        if "Bal. Account Type" = "Bal. Account Type"::Customer then begin
                            PayeeType := PayeeType::Customer;
                            Customer.Get("Bal. Account No.");
                        end
                        else
                            Error(AccountTypeErr, FieldCaption("Bal. Account Type"), Customer.TableCaption(), Vendor.TableCaption());
                end
                else begin
                    ExportAmount := -"Amount (LCY)";
                    PayeeNo := "Account No.";
                    if "Account Type" = "Account Type"::Vendor then begin
                        PayeeType := PayeeType::Vendor;
                        Vendor.Get("Account No.");
                    end
                    else
                        if "Account Type" = "Account Type"::Customer then begin
                            PayeeType := PayeeType::Customer;
                            Customer.Get("Account No.");
                        end
                        else
                            Error(AccountTypeErr, FieldCaption("Account Type"), Customer.TableCaption(), Vendor.TableCaption());
                end;
                BuildGroupDetails("Gen. Journal Line");
                if PayeeAddress[5] <> '' then
                    PayeeAddress[5] := StrSubstNo(', %1', PayeeAddress[5]);
            end;

            trigger OnPreDataItem()
            begin
            end;
        }
    }
    requestpage
    {
        Caption = 'Export Electronic Payments';
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(BankAccountNo; BankAccount."No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Bank Account No.';
                        TableRelation = "Bank Account";
                        ToolTip = 'Specifies the bank account that the payment is transmitted to.';
                    }
                    // field(NumberOfCopies; NoCopies)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Number of Copies';
                    //     MaxValue = 9;
                    //     MinValue = 0;
                    //     ToolTip = 'Specifies the number of copies of each document (in addition to the original) that you want to print.';
                    // }
                    field(PrintCompanyAddress; PrintCompany)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print Company Address';
                        ToolTip = 'Specifies if your company address is printed at the top of the sheet, because you do not use pre-printed paper. Leave this check box blank to omit your company''s address.';
                    }
                    group(OutputOptions)
                    {
                        Caption = 'Output Options';

                        field(OutputMethod; SupportedOutputMethod)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Output Method';
                            OptionCaption = 'Print,Preview,PDF,Email,Word,XML - RDLC layouts only', Comment = 'Verbs - to print, to preview, to export to PDF, to email, to export to word, to export to XML (with note that it''s for RDLC layouts only)';
                            ToolTip = 'Specifies how the electronic payment is exported.';

                            trigger OnValidate()
                            begin
                                MapOutputMethod();
                            end;
                        }
                        field(ChosenOutputMethod; ChosenOutputMethod)
                        {
                            ApplicationArea = All;
                            Visible = false;
                        }
                    }
                    group(EmailOptions)
                    {
                        Caption = 'Email Options';
                        Visible = ShowPrintIfEmailIsMissing;

                        field(PrintMissingAddresses; PrintIfEmailIsMissing)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Print remaining statements';
                            ToolTip = 'Specifies that amounts remaining to be paid will be included.';
                        }
                    }
                }
            }
        }
        actions
        {
        }
        trigger OnOpenPage()
        begin
            MapOutputMethod();
        end;
    }
    rendering
    {
        layout(Attachments)
        {
            Type = Word;

            LayoutFile = './Layouts/BBN-11383-AttachmentLayout - Copy.docx';
        }
        layout(EmailBody)
        {
            Type = Word;
            LayoutFile = './Layouts/EmailBody - Copy.docx';
        }
    }
    trigger OnInitReport()

    begin
        // Supply a default when an email run has no request-page options.
        if not PrintCompanyOverrideSet then
            PrintCompany := true;
    end;

    trigger OnPreReport()
    var
        GenJournalBatch: Record "Gen. Journal Batch";
        GenJournalLine: Record "Gen. Journal Line";
    begin
        // An explicit email caller choice takes precedence over serialized options.
        if PrintCompanyOverrideSet then
            PrintCompany := PrintCompanyOverrideValue;
        CompanyInformation.Get();
        GenJournalLine.Copy("Gen. Journal Line");
        if GenJournalLine.FindFirst() then begin
            GenJournalTemplate.Get(GenJournalLine."Journal Template Name");
            if not GenJournalTemplate."Force Doc. Balance" then
                if not Confirm(CannotVoidQst, true) then
                    Error(UserCancelledErr);
            if not UseRequestPage() then
                if GenJournalBatch.Get(GenJournalLine."Journal Template Name", GenJournalLine."Journal Batch Name") then begin
                    GenJournalBatch.TestField("Bal. Account Type", GenJournalBatch."Bal. Account Type"::"Bank Account");
                    GenJournalBatch.TestField(GenJournalBatch."Bal. Account No.");
                    BankAccount."No." := GenJournalBatch."Bal. Account No.";
                end;
            BankAccount.Get(BankAccount."No.");
            BankAccount.TestField(Blocked, false);
            BankAccount.TestField("Export Format");
            BankAccount.TestField("Last Remittance Advice No.");
        end;
        FormatCompanyAddress(CompanyInformation);

        // JournalLineScope.Copy("Gen. Journal Line");
        // JournalLineScope.FilterGroup(2);
        // JournalLineScope.SetFilter("Bank Payment Type", '%1|%2',
        //     JournalLineScope."Bank Payment Type"::"Electronic Payment",
        //     JournalLineScope."Bank Payment Type"::"Electronic Payment-IAT");
        // JournalLineScope.SetFilter("Document Type", '%1|%2|%3',
        //     JournalLineScope."Document Type"::Payment,
        //     JournalLineScope."Document Type"::Refund,
        //     JournalLineScope."Document Type"::Invoice);
        // JournalLineScope.FilterGroup(0);
        Clear(PrintedACHNumbers);
    end;

    var

        // JournalLineScope: Record "Gen. Journal Line";
        PrintedACHNumbers: List of [Text];
        DetailPostingDates: List of [Date];
        DetailDocumentDates: List of [Date];
        DetailDocumentNumbers: List of [Text];
        DetailDocumentTypes: List of [Text];
        DetailAmountsDue: List of [Decimal];
        DetailAmountsPaid: List of [Decimal];
        DetailDiscounts: List of [Decimal];
        DetailPostingDate: Date;
        DetailDocumentDate: Date;
        DetailDocumentNo: Text;
        DetailDocumentType: Text;
        DetailAmountDue: Decimal;
        DetailAmountPaid: Decimal;
        DetailDiscountTaken: Decimal;
        GroupPaymentAmount: Decimal;
        GroupAppliedAmount: Decimal;
        AccountTypeErr: Label 'For Electronic Payments, the %1 must be %2 or %3.', Comment = '%1=Balance account type,%2=Customer table caption,%3=Vendor table caption';
        CopyLoopLbl: Label '- COPY';
        CannotVoidQst: Label 'Warning:  Transactions cannot be financially voided when Force Doc. Balance is set to No in the Journal Template.  Do you want to continue anyway?';
        UserCancelledErr: Label 'Process cancelled at user request.';
        REMITTANCE_ADVICECaptionLbl: Label 'REMITTANCE ADVICE';
        To_CaptionLbl: Label 'To:';
        Remittance_Advice_Number_CaptionLbl: Label 'Remittance Advice Number:';
        Settlement_Date_CaptionLbl: Label 'Settlement Date:';
        Page_CaptionLbl: Label 'Page:';
        ExportAmountCaptionLbl: Label 'Deposit Amount:';
        PayeeBankTransitNoCaptionLbl: Label 'Bank Transit No:';
        Deposited_In_CaptionLbl: Label 'Deposited In:';
        PayeeBankAccountNoCaptionLbl: Label 'Bank Account No:';
        Remaining_Amt___LCY___Control36CaptionLbl: Label 'Amount Due';
        DiscountTaken_Control38CaptionLbl: Label 'Discount Taken';
        AmountPaid_Control43CaptionLbl: Label 'Amount Paid';
        Text004Lbl: Label 'Unapplied Amount';
        CompanyInformation: Record "Company Information";
        GenJournalTemplate: Record "Gen. Journal Template";
        BankAccount: Record "Bank Account";
        Customer: Record Customer;
        CustBankAccount: Record "Customer Bank Account";
        CustLedgEntry: Record "Cust. Ledger Entry";
        VendBankAccount: Record "Vendor Bank Account";
        VendLedgEntry: Record "Vendor Ledger Entry";
        Vendor: Record Vendor;
        FormatAddress: Codeunit "Format Address";
        ExportAmount: Decimal;
        BankAccountIs: Option Acnt,BalAcnt;
        // NoCopies: Integer;
        //CopyTxt: Code[10];
        PrintCompany: Boolean;
        CompanyAddress: array[8] of Text[100];
        PayeeAddress: array[8] of Text[100];
        PayeeType: Option Vendor,Customer;
        PayeeNo: Text;
        PayeeBankTransitNo: Text[30];
        PayeeBankAccountNo: Text[30];
        DiscountTaken: Decimal;
        AmountPaid: Decimal;
        TotalAmountPaid: Decimal;

        PrintCompanyOverrideSet: Boolean;
        PrintCompanyOverrideValue: Boolean;
        myType: Integer;
        SaveAmountPaid: Decimal;
        SupportedOutputMethod: Option Print,Preview,PDF,Email,Word,XML;
        ChosenOutputMethod: Integer;
        PrintIfEmailIsMissing: Boolean;
        ShowPrintIfEmailIsMissing: Boolean;
        IsSummary: Boolean;
        GreetingLbl: Label 'Hello';
        ClosingLbl: Label 'Sincerely';
        BodyLbl: Label 'Thank you for your business. Your remittance is attached to this message.';

    protected var
        CompanyInfo: Record "Company Information";


    procedure SetPrintCompanyAddress(NewPrintCompany: Boolean)
    begin
        // Call on the report instance before rendering an email attachment.
        PrintCompany := NewPrintCompany;
        PrintCompanyOverrideValue := NewPrintCompany;
        PrintCompanyOverrideSet := true;
    end;


    // Grouping changes record selection and the existing info repeat counts only.
    // The original WordMergeDataItem and complete dataitem hierarchy stay intact.
    local procedure BuildGroupDetails(SourceLine: Record "Gen. Journal Line")
    var
        GroupLine: Record "Gen. Journal Line";
        HeaderExportAmount: Decimal;
    begin
        Clear(DetailPostingDates);
        Clear(DetailDocumentDates);
        Clear(DetailDocumentNumbers);
        Clear(DetailDocumentTypes);
        Clear(DetailAmountsDue);
        Clear(DetailAmountsPaid);
        Clear(DetailDiscounts);
        GroupPaymentAmount := 0;
        GroupAppliedAmount := 0;
        HeaderExportAmount := ExportAmount;

        GroupLine.Reset();
        GroupLine.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Line No.");
        GroupLine.SetRange("Journal Template Name", SourceLine."Journal Template Name");
        GroupLine.SetRange("Journal Batch Name", SourceLine."Journal Batch Name");

        GroupLine.SetRange("ACH No.", SourceLine."ACH No.");
        GroupLine.SetFilter("Bank Payment Type", '%1|%2',
            GroupLine."Bank Payment Type"::"Electronic Payment",
            GroupLine."Bank Payment Type"::"Electronic Payment-IAT");
        GroupLine.SetFilter("Document Type", '%1|%2|%3',
            GroupLine."Document Type"::Payment,
            GroupLine."Document Type"::Refund,
            GroupLine."Document Type"::Invoice);
        // Blank numbers must not combine unrelated payments.
        if SourceLine."ACH No." = '' then
            GroupLine.SetRange("Line No.", SourceLine."Line No.");
        if GroupLine.FindSet() then
            repeat
                if (GroupLine."Amount (LCY)" <> 0) and IsLineForSelectedBank(GroupLine) then begin
                    // One request header has one payee, recipient bank, and currency.
                    if (GetLinePayeeNo(GroupLine) <> PayeeNo) or
                       (GroupLine."Recipient Bank Account" <> SourceLine."Recipient Bank Account") or
                       (GroupLine."Currency Code" <> SourceLine."Currency Code") or
                       (GetLinePayeeType(GroupLine) <> GetLinePayeeType(SourceLine)) then
                        Error('ACH No. %1 contains different payees, recipient bank accounts, or currencies. These lines cannot share one remittance header.', SourceLine."ACH No.");
                    if GroupLine."Account Type" = GroupLine."Account Type"::"Bank Account" then
                        ExportAmount := GroupLine."Amount (LCY)"
                    else
                        ExportAmount := -GroupLine."Amount (LCY)";
                    GroupPaymentAmount := GroupPaymentAmount - ExportAmount;
                    BuildLineDetails(GroupLine);
                end;
            until GroupLine.Next() = 0;

        // Restore header payee/bank values after walking the detail lines.
        ExportAmount := HeaderExportAmount;
        Clear(VendLedgEntry);
        Clear(CustLedgEntry);
        if PayeeType = PayeeType::Vendor then
            ProcessVendor(SourceLine)
        else
            ProcessCustomer(SourceLine);
        ExportAmount := -GroupPaymentAmount;
        AmountPaid := GroupAppliedAmount;
        TotalAmountPaid := GroupAppliedAmount;
        DiscountTaken := 0;
    end;

    local procedure BuildLineDetails(var JournalLine: Record "Gen. Journal Line")
    var
        AppliedVendorEntry: Record "Vendor Ledger Entry";
        AppliedCustomerEntry: Record "Cust. Ledger Entry";
        LinePaid: Decimal;
        LineAmountDue: Decimal;
        LineDiscount: Decimal;
        LineDocumentDate: Date;
        LineDocumentNo: Text;
        LineDocumentType: Text;
        LinkedEntryCount: Integer;
        VLE: Record "Vendor Ledger Entry";
    begin
        // Exactly one output row per journal line. Ledger records enrich that row;
        // they must never create additional report rows.
        Clear(VendLedgEntry);
        Clear(CustLedgEntry);
        Clear(VLE);
        AmountPaid := 0;
        DiscountTaken := 0;
        LinePaid := 0;
        if PayeeType = PayeeType::Vendor then begin

            VLE := ProcessVendor(JournalLine);
            if VLE."Entry No." <> 0 then begin

                VLE.CalcFields("Remaining Amt. (LCY)");
                LineDocumentDate := VLE."Document Date"; //VendLedgEntry."Document Date"; 
                LineDocumentNo := VLE."External Document No."; //VendLedgEntry."External Document No.";
                if LineDocumentNo = '' then
                    LineDocumentNo := VLE."Document No."; //VendLedgEntry."Document No."; 
                LineDocumentType := Format(VLE."Document Type");//Format(VendLedgEntry."Document Type");
                LineAmountDue := -VLE."Remaining Amt. (LCY)"; //-VendLedgEntry."Remaining Amt. (LCY)";
                LineDiscount := DiscountTaken;
                LinkedEntryCount := 1;
            end else
                if JournalLine."Applies-to ID" <> '' then begin
                    AppliedVendorEntry.SetRange("Vendor No.", Vendor."No.");
                    AppliedVendorEntry.SetRange(Open, true);
                    AppliedVendorEntry.SetRange("Applies-to ID", JournalLine."Applies-to ID");
                    // Unselected open invoices have Amount to Apply = 0.
                    AppliedVendorEntry.SetFilter("Amount to Apply", '<>%1', 0);
                    if AppliedVendorEntry.FindSet() then
                        repeat
                            AppliedVendorEntry.CalcFields("Remaining Amt. (LCY)");
                            CalculateLineApplication(JournalLine, LinePaid,
                                AppliedVendorEntry."Pmt. Discount Date", AppliedVendorEntry."Remaining Pmt. Disc. Possible",
                                AppliedVendorEntry."Amount to Apply");
                            if AmountPaid <> 0 then begin
                                AccumulateLinkedDocument(LineDocumentNo, LineDocumentDate, LineDocumentType,
                                    LinkedEntryCount, AppliedVendorEntry."External Document No.",
                                    AppliedVendorEntry."Document No.", AppliedVendorEntry."Document Date",
                                    Format(AppliedVendorEntry."Document Type"));
                                LineAmountDue := LineAmountDue - AppliedVendorEntry."Remaining Amt. (LCY)";
                                LinePaid := LinePaid + AmountPaid;
                                LineDiscount := LineDiscount + DiscountTaken;
                            end;
                        until AppliedVendorEntry.Next() = 0;
                end;
        end else begin
            ProcessCustomer(JournalLine);
            if JournalLine."Applies-to Doc. No." <> '' then begin
                LineDocumentDate := CustLedgEntry."Document Date";
                LineDocumentNo := CustLedgEntry."Document No.";
                LineDocumentType := Format(CustLedgEntry."Document Type");
                LineAmountDue := -CustLedgEntry."Remaining Amt. (LCY)";
                LineDiscount := DiscountTaken;
                LinkedEntryCount := 1;
            end else
                if JournalLine."Applies-to ID" <> '' then begin
                    AppliedCustomerEntry.SetRange("Customer No.", Customer."No.");
                    AppliedCustomerEntry.SetRange(Open, true);
                    AppliedCustomerEntry.SetRange("Applies-to ID", JournalLine."Applies-to ID");
                    AppliedCustomerEntry.SetFilter("Amount to Apply", '<>%1', 0);
                    if AppliedCustomerEntry.FindSet() then
                        repeat
                            AppliedCustomerEntry.CalcFields("Remaining Amt. (LCY)");
                            CalculateLineApplication(JournalLine, LinePaid,
                                AppliedCustomerEntry."Pmt. Discount Date", AppliedCustomerEntry."Remaining Pmt. Disc. Possible",
                                AppliedCustomerEntry."Amount to Apply");
                            if AmountPaid <> 0 then begin
                                AccumulateLinkedDocument(LineDocumentNo, LineDocumentDate, LineDocumentType,
                                    LinkedEntryCount, AppliedCustomerEntry."Document No.",
                                    AppliedCustomerEntry."Document No.", AppliedCustomerEntry."Document Date",
                                    Format(AppliedCustomerEntry."Document Type"));
                                LineAmountDue := LineAmountDue - AppliedCustomerEntry."Remaining Amt. (LCY)";

                                LinePaid := LinePaid + AmountPaid;
                                LineDiscount := LineDiscount + DiscountTaken;
                            end;
                        until AppliedCustomerEntry.Next() = 0;
                end;
        end;
        if LinkedEntryCount = 0 then begin
            LineDocumentNo := JournalLine."Applies-to Doc. No.";
            if LineDocumentNo = '' then
                LineDocumentNo := JournalLine."External Document No.";
            if LineDocumentNo = '' then
                LineDocumentNo := JournalLine."Document No.";
            LineDocumentDate := JournalLine."Document Date";
            LineDocumentType := Format(JournalLine."Document Type");
            LineAmountDue := -ExportAmount;
        end;

        // Print the external applied document from this source journal line.
        // Do not reuse the first journal line's ledger external document for the group.
        if JournalLine."Applies-to Ext. Doc. No." <> '' then
            LineDocumentNo := JournalLine."Applies-to Ext. Doc. No.";


        // The amount paid is this journal line's payment, including any unapplied portion.
        // Do not append a separate unapplied row or a row for every open invoice.
        AddGroupDetail(JournalLine."Posting Date", LineDocumentDate, LineDocumentNo,
            LineDocumentType, LineAmountDue, -ExportAmount, LineDiscount);
        GroupAppliedAmount := GroupAppliedAmount - ExportAmount;
    end;

    local procedure AccumulateLinkedDocument(var DocumentNumbers: Text; var DocumentDate: Date; var DocumentType: Text; var EntryCount: Integer; ExternalDocumentNo: Text; InternalDocumentNo: Text; EntryDocumentDate: Date; EntryDocumentType: Text)
    var
        PrintedDocumentNo: Text;
    begin
        PrintedDocumentNo := ExternalDocumentNo;
        if PrintedDocumentNo = '' then
            PrintedDocumentNo := InternalDocumentNo;
        if EntryCount = 0 then begin
            DocumentNumbers := PrintedDocumentNo;
            DocumentDate := EntryDocumentDate;
            DocumentType := EntryDocumentType;
        end else begin
            DocumentNumbers := DocumentNumbers + ', ' + PrintedDocumentNo;
            if DocumentDate <> EntryDocumentDate then
                DocumentDate := 0D;
            if DocumentType <> EntryDocumentType then
                DocumentType := '';
        end;
        EntryCount := EntryCount + 1;
    end;

    local procedure CalculateLineApplication(JournalLine: Record "Gen. Journal Line"; LinePaid: Decimal; DiscountDate: Date; PossibleDiscount: Decimal; AmountToApply: Decimal)
    begin
        // Use the existing report's application calculation, separately for each source line.
        if (DiscountDate >= JournalLine."Document Date") and (PossibleDiscount <> 0) and
           ((-ExportAmount - LinePaid) - PossibleDiscount >= -AmountToApply) then begin
            DiscountTaken := -PossibleDiscount;
            AmountPaid := -(AmountToApply - PossibleDiscount);
        end else begin
            DiscountTaken := 0;
            if (-ExportAmount - LinePaid) > -AmountToApply then
                AmountPaid := -AmountToApply
            else
                AmountPaid := -ExportAmount - LinePaid;
        end;
    end;

    local procedure AddGroupDetail(PostingDate: Date; DocumentDate: Date; DocumentNo: Text; DocumentType: Text; AmountDue: Decimal; PaidAmount: Decimal; DiscountAmount: Decimal)
    begin
        // Never add a zero-payment row to the printable detail buffer.
        if PaidAmount = 0 then
            exit;
        DetailPostingDates.Add(PostingDate);
        DetailDocumentDates.Add(DocumentDate);
        DetailDocumentNumbers.Add(DocumentNo);
        DetailDocumentTypes.Add(DocumentType);
        DetailAmountsDue.Add(AmountDue);
        DetailAmountsPaid.Add(PaidAmount);
        DetailDiscounts.Add(DiscountAmount);
    end;

    local procedure LoadGroupDetail(DetailIndex: Integer)
    begin
        DetailPostingDate := DetailPostingDates.Get(DetailIndex);
        DetailDocumentDate := DetailDocumentDates.Get(DetailIndex);
        DetailDocumentNo := DetailDocumentNumbers.Get(DetailIndex);
        DetailDocumentType := DetailDocumentTypes.Get(DetailIndex);
        DetailAmountDue := DetailAmountsDue.Get(DetailIndex);
        DetailAmountPaid := DetailAmountsPaid.Get(DetailIndex);
        DetailDiscountTaken := DetailDiscounts.Get(DetailIndex);
    end;


    local procedure GetACHGroupKey(JournalLine: Record "Gen. Journal Line"): Text
    var
        ACHNumber: Text;
    begin
        ACHNumber := Format(JournalLine."ACH No.");
        // Length prefixes keep batch names and ACH numbers unambiguous.
        exit(StrSubstNo('%1:%2%3:%4%5:%6',
            StrLen(JournalLine."Journal Template Name"), JournalLine."Journal Template Name",
            StrLen(JournalLine."Journal Batch Name"), JournalLine."Journal Batch Name",
            StrLen(ACHNumber), ACHNumber));
    end;

    local procedure IsLineForSelectedBank(JournalLine: Record "Gen. Journal Line"): Boolean
    begin
        if JournalLine."Account Type" = JournalLine."Account Type"::"Bank Account" then
            exit(JournalLine."Account No." = BankAccount."No.");
        if JournalLine."Bal. Account Type" = JournalLine."Bal. Account Type"::"Bank Account" then
            exit(JournalLine."Bal. Account No." = BankAccount."No.");
        exit(false);
    end;

    local procedure GetLinePayeeNo(JournalLine: Record "Gen. Journal Line"): Code[20]
    begin
        if JournalLine."Account Type" = JournalLine."Account Type"::"Bank Account" then
            exit(JournalLine."Bal. Account No.");
        exit(JournalLine."Account No.");
    end;

    local procedure GetLinePayeeType(JournalLine: Record "Gen. Journal Line"): Text
    begin
        if JournalLine."Account Type" = JournalLine."Account Type"::"Bank Account" then
            exit(Format(JournalLine."Bal. Account Type"));
        exit(Format(JournalLine."Account Type"));
    end;


    local procedure FormatCompanyAddress(CompanyRecord: Record "Company Information")
    var
        StateAndPostCode: Text;
        CityStateAndCountry: Text;
    begin
        Clear(CompanyAddress);
        CompanyAddress[1] := CompanyRecord.Name;
        CompanyAddress[2] := CompanyRecord."Name 2";
        CompanyAddress[3] := CompanyRecord.Address;
        CompanyAddress[4] := CompanyRecord."Address 2";

        StateAndPostCode := CompanyRecord.County;
        if CompanyRecord."Post Code" <> '' then begin
            if StateAndPostCode <> '' then
                StateAndPostCode := StateAndPostCode + ' ';
            StateAndPostCode := StateAndPostCode + CompanyRecord."Post Code";
        end;
        CityStateAndCountry := CompanyRecord.City;
        if StateAndPostCode <> '' then begin
            if CityStateAndCountry <> '' then
                CityStateAndCountry := CityStateAndCountry + ', ';
            CityStateAndCountry := CityStateAndCountry + StateAndPostCode;
        end;
        if CompanyRecord."Country/Region Code" <> '' then begin
            if CityStateAndCountry <> '' then
                CityStateAndCountry := CityStateAndCountry + ' , ';
            CityStateAndCountry := CityStateAndCountry + CompanyRecord."Country/Region Code";
        end;
        CompanyAddress[5] := CopyStr(CityStateAndCountry, 1, MaxStrLen(CompanyAddress[5]));
        CompressArray(CompanyAddress);
    end;

    local procedure FormatRemittanceDate(ReportDate: Date): Text
    begin
        if ReportDate = 0D then
            exit('');
        // Explicit English month labels, including the requested September abbreviation.
        exit(StrSubstNo('%1 %2,%3',
            SelectStr(Date2DMY(ReportDate, 2), 'Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sept,Oct,Nov,Dec'),
            Date2DMY(ReportDate, 1), Date2DMY(ReportDate, 3)));
    end;

    local procedure MapOutputMethod()
    var
        CustomLayoutReporting: Codeunit "Custom Layout Reporting";
    begin
        ShowPrintIfEmailIsMissing := (SupportedOutputMethod = SupportedOutputMethod::Email);
        // Map the supported option (shown on the page) to the list of supported output methods
        case SupportedOutputMethod of
            SupportedOutputMethod::Print:
                ChosenOutputMethod := CustomLayoutReporting.GetPrintOption();
            SupportedOutputMethod::Preview:
                ChosenOutputMethod := CustomLayoutReporting.GetPreviewOption();
            SupportedOutputMethod::PDF:
                ChosenOutputMethod := CustomLayoutReporting.GetPDFOption();
            SupportedOutputMethod::Email:
                ChosenOutputMethod := CustomLayoutReporting.GetEmailOption();
            SupportedOutputMethod::Word:
                ChosenOutputMethod := CustomLayoutReporting.GetWordOption();
            SupportedOutputMethod::XML:
                ChosenOutputMethod := CustomLayoutReporting.GetXMLOption();
        end;
    end;

    local procedure ProcessVendor(var GenJnlLine: Record "Gen. Journal Line"): record "vendor Ledger Entry";
    var
        EFTRecipientBankAccountMgt: codeunit "EFT Recipient Bank Account Mgt";
    begin

        FormatAddress.Vendor(PayeeAddress, Vendor);
        EFTRecipientBankAccountMgt.GetRecipientVendorBankAccount(VendBankAccount, GenJnlLine, Vendor."No.");
        PayeeBankTransitNo := VendBankAccount."Transit No.";
        PayeeBankAccountNo := VendBankAccount."Bank Account No.";
        if GenJnlLine."Applies-to Doc. No." <> '' then begin
            VendLedgEntry.Reset();
            VendLedgEntry.SetRange("Bssi Line Entity", GenJnlLine.BssiEntityID);
            VendLedgEntry.SetCurrentKey("Document No.", "Document Type", "Vendor No.");
            VendLedgEntry.SetRange("Document Type", GenJnlLine."Applies-to Doc. Type");
            VendLedgEntry.SetRange("Document No.", GenJnlLine."Applies-to Doc. No.");
            // VendLedgEntry.SetRange("Applies-to ID", GenJnlLine."Document No.");
            VendLedgEntry.SetRange("Vendor No.", Vendor."No.");
            VendLedgEntry.SetRange(Open, true);
            IF VendLedgEntry.FindFirst then
                repeat
                    AmountPaid := 0;
                    if VendLedgEntry."Applies-to ID" <> '' then begin
                        if VendLedgEntry."Applies-to ID" = GenJnlLine."Document No." then begin
                            VendLedgEntry.CalcFields("Remaining Amt. (LCY)", Amount);
                            if (VendLedgEntry."Pmt. Discount Date" >= GenJnlLine."Document Date") and (VendLedgEntry."Remaining Pmt. Disc. Possible" <> 0) and (-(ExportAmount + VendLedgEntry."Remaining Pmt. Disc. Possible") >= -VendLedgEntry.Amount) then begin
                                DiscountTaken := -VendLedgEntry."Remaining Pmt. Disc. Possible";
                                AmountPaid := -(VendLedgEntry.Amount - VendLedgEntry."Remaining Pmt. Disc. Possible");
                            end
                            else
                                if -ExportAmount > -VendLedgEntry.Amount then
                                    AmountPaid := -VendLedgEntry.Amount
                                else
                                    AmountPaid := -ExportAmount;

                            exit(VendLedgEntry);
                        end;
                    end else begin
                        VendLedgEntry.CalcFields("Remaining Amt. (LCY)", Amount);
                        if (VendLedgEntry."Pmt. Discount Date" >= GenJnlLine."Document Date") and (VendLedgEntry."Remaining Pmt. Disc. Possible" <> 0) and (-(ExportAmount + VendLedgEntry."Remaining Pmt. Disc. Possible") >= -VendLedgEntry.Amount) then begin
                            DiscountTaken := -VendLedgEntry."Remaining Pmt. Disc. Possible";
                            AmountPaid := -(VendLedgEntry.Amount - VendLedgEntry."Remaining Pmt. Disc. Possible");
                        end
                        else
                            if -ExportAmount > -VendLedgEntry.Amount then
                                AmountPaid := -VendLedgEntry.Amount
                            else
                                AmountPaid := -ExportAmount;

                        exit(VendLedgEntry);
                    end;
                until VendLedgEntry.Next() = 0;
        end;
    end;

    local procedure ProcessCustomer(var GenJnlLine: Record "Gen. Journal Line")
    var
        EFTRecipientBankAccountMgt: codeunit "EFT Recipient Bank Account Mgt";
    begin
        FormatAddress.Customer(PayeeAddress, Customer);
        EFTRecipientBankAccountMgt.GetRecipientCustomerBankAccount(CustBankAccount, GenJnlLine, Customer."No.");
        PayeeBankTransitNo := CustBankAccount."Transit No.";
        PayeeBankAccountNo := CustBankAccount."Bank Account No.";
        if GenJnlLine."Applies-to Doc. No." <> '' then begin
            CustLedgEntry.Reset();
            CustLedgEntry.SetRange("Bssi Line Entity", GenJnlLine.BssiEntityID);
            CustLedgEntry.SetCurrentKey("Document No.", "Document Type", "Customer No.");
            CustLedgEntry.SetRange("Document Type", GenJnlLine."Applies-to Doc. Type");
            CustLedgEntry.SetRange("Document No.", GenJnlLine."Applies-to Doc. No.");
            CustLedgEntry.SetRange("Customer No.", Customer."No.");
            CustLedgEntry.SetRange(Open, true);
            CustLedgEntry.FindFirst();
            CustLedgEntry.CalcFields("Remaining Amt. (LCY)", Amount);
            if (CustLedgEntry."Pmt. Discount Date" >= GenJnlLine."Document Date") and (CustLedgEntry."Remaining Pmt. Disc. Possible" <> 0) and (-(ExportAmount - CustLedgEntry."Remaining Pmt. Disc. Possible") >= -CustLedgEntry.Amount) then begin
                DiscountTaken := -CustLedgEntry."Remaining Pmt. Disc. Possible";
                AmountPaid := -(CustLedgEntry.Amount - CustLedgEntry."Remaining Pmt. Disc. Possible");
            end
            else
                if -ExportAmount > -CustLedgEntry.Amount then
                    AmountPaid := -CustLedgEntry.Amount
                else
                    AmountPaid := -ExportAmount;
        end;
    end;
}
