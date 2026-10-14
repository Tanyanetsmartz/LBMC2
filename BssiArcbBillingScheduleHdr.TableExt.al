tableextension 50022 BssiArcbBillingScheduleHdr extends BssiArcbBillingScheduleHdr
{
    fields
    {
        field(50000; "Circuit ID"; Text[30])
        {
        }
        field(50001; "Purchase Order No."; Code[20])
        {
        }
        modify(Bssi_UDF_H1)
        {
        trigger OnAfterValidate()
        begin
            if xRec.Bssi_UDF_H1 <> Bssi_UDF_H1 then CopyUDFFieldsToScheduleLine(1);
        end;
        }
        modify(Bssi_UDF_H2)
        {
        trigger OnAfterValidate()
        begin
            if xRec.Bssi_UDF_H2 <> Bssi_UDF_H2 then CopyUDFFieldsToScheduleLine(2);
        end;
        }
        modify(Bssi_UDF_H3)
        {
        trigger OnAfterValidate()
        begin
            if xRec.Bssi_UDF_H3 <> Bssi_UDF_H3 then CopyUDFFieldsToScheduleLine(3);
        end;
        }
        modify(Bssi_UDF_H4)
        {
        trigger OnAfterValidate()
        begin
            if xRec.Bssi_UDF_H4 <> Bssi_UDF_H4 then CopyUDFFieldsToScheduleLine(4);
        end;
        }
        modify(Bssi_UDF_H6)
        {
        trigger OnAfterValidate()
        begin
            if xRec.Bssi_UDF_H6 <> Bssi_UDF_H6 then CopyUDFFieldsToScheduleLine(6);
        end;
        }
    }
    procedure CopyUDFFieldsToScheduleLine(FieldNo: Integer)
    var
        BssiArcbBillingScheduleLine: Record BssiArcbBillingScheduleLine;
    begin
        BssiArcbBillingScheduleLine.Reset();
        BssiArcbBillingScheduleLine.SetRange(BssiArcbBillingScheduleLine.BssiArcbBillingScheduleNumber, BssiArcbBillingScheduleNumber);
        if BssiArcbBillingScheduleLine.FindSet()then repeat if FieldNo = 1 then BssiArcbBillingScheduleLine.Bssi_UDF_L1:=Bssi_UDF_H1;
                if FieldNo = 2 then BssiArcbBillingScheduleLine.Bssi_UDF_L2:=Bssi_UDF_H2;
                if FieldNo = 3 then BssiArcbBillingScheduleLine.Bssi_UDF_L3:=Bssi_UDF_H3;
                if FieldNo = 4 then BssiArcbBillingScheduleLine.Bssi_UDF_L4:=Bssi_UDF_H4;
                if FieldNo = 6 then BssiArcbBillingScheduleLine.Bssi_UDF_L6:=Bssi_UDF_H6;
                BssiArcbBillingScheduleLine.Modify(true);
            until BssiArcbBillingScheduleLine.Next() = 0;
    end;
}
