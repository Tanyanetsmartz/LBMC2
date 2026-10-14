tableextension 50019 "Purchase Header" extends "Purchase Header"
{
    fields
    {
        field(60000; "Work Description"; BLOB)
        {
            Caption = 'Work Description';
        }
        field(60001; "Consturction PO"; Boolean)
        {
            trigger OnValidate()
            begin
                if "Consturction PO" then TestField("Contract Code")
                else
                    TestField("Contract Code", '');
            end;
        }
        field(60002; "Contract Code"; Code[20])
        {
            TableRelation = "LBMC Vendor Contract".Code where("Vendor No."=field("Buy-from Vendor No."));
        }
    }
    procedure SetWorkDescription(NewWorkDescription: Text)
    var
        OutStream: OutStream;
    begin
        Clear("Work Description");
        "Work Description".CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(NewWorkDescription);
        Rec.Modify();
    end;
    procedure GetWorkDescription(): Text var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields("Work Description");
        "Work Description".CreateInStream(InStream, TEXTENCODING::UTF8);
        exit(TypeHelper.ReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator()));
    end;
}
