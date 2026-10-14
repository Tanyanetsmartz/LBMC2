tableextension 50009 "Purchases & Payables Setup" extends "Purchases & Payables Setup"
{
    fields
    {
        field(50000; "FA G/L Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template" where(Type=const(Assets));
        }
        field(50001; "FA G/L Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name"=field("FA G/L Template"));
        }
        field(50002; "Stock Adjmt. A/c"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50003; "Contraction PO Disclaimer"; Blob)
        {
        }
    }
    procedure SetContructionPODisplaimer(NewDisclaimer: Text)
    var
        OutStream: OutStream;
    begin
        Clear("Contraction PO Disclaimer");
        "Contraction PO Disclaimer".CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(NewDisclaimer);
        Rec.Modify();
    end;
    procedure GetContructionPODisplaimer(): Text var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields("Contraction PO Disclaimer");
        "Contraction PO Disclaimer".CreateInStream(InStream, TEXTENCODING::UTF8);
        exit(TypeHelper.ReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator()));
    end;
}
