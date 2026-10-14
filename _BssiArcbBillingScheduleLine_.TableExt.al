tableextension 50010 "BssiArcbBillingScheduleLine" extends BssiArcbBillingScheduleLine
{
    fields
    {
        field(50000; "Tax Item Line"; Boolean)
        {
            Editable = false;
        }
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
    trigger OnInsert()
    var
        BssiArcbBillingScheduleHdr: Record BssiArcbBillingScheduleHdr;
    begin
        if BssiArcbBillingScheduleHdr.get(Rec.BssiArcbBillingScheduleNumber)then begin
            Bssi_UDF_L1:=BssiArcbBillingScheduleHdr.Bssi_UDF_H1;
            Bssi_UDF_L2:=BssiArcbBillingScheduleHdr.Bssi_UDF_H2;
            Bssi_UDF_L3:=BssiArcbBillingScheduleHdr.Bssi_UDF_H3;
            Bssi_UDF_L4:=BssiArcbBillingScheduleHdr.Bssi_UDF_H4;
            Bssi_UDF_L6:=BssiArcbBillingScheduleHdr.Bssi_UDF_H6;
        end;
    end;
}
