tableextension 50023 BssiArcbInvoiceDetail extends BssiArcbInvoiceDetail
{
    fields
    {
        field(50001; "A-Loc"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(BssiArcbBillingScheduleHdr.Bssi_UDF_H1 where(BssiArcbBillingScheduleNumber=field(BssiArcbBillingScheduleNumber)));
            Editable = false;
        }
        field(50002; "Z-Loc"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(BssiArcbBillingScheduleHdr.Bssi_UDF_H2 where(BssiArcbBillingScheduleNumber=field(BssiArcbBillingScheduleNumber)));
            Editable = false;
        }
        field(50003; "Activation Date"; Date)
        {
            FieldClass = FlowField;
            CalcFormula = lookup(BssiArcbBillingScheduleHdr.Bssi_UDF_H6 where(BssiArcbBillingScheduleNumber=field(BssiArcbBillingScheduleNumber)));
            Editable = false;
        }
        field(50004; "Circuit ID"; Text[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(BssiArcbBillingScheduleHdr."Circuit ID" where(BssiArcbBillingScheduleNumber=field(BssiArcbBillingScheduleNumber)));
            Editable = false;
        }
        field(50005; "Purchase Order No."; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(BssiArcbBillingScheduleHdr."Purchase Order No." where(BssiArcbBillingScheduleNumber=field(BssiArcbBillingScheduleNumber)));
            Editable = false;
        }
    }
}
