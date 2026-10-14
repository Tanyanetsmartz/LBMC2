pageextension 50021 "Purchase Order" extends "Purchase Order"
{
    layout
    {
        addafter(Status)
        {
            field(WorkDescription; WorkDescription)
            {
                Caption = 'Work Description';
                Importance = Additional;
                MultiLine = true;
                ToolTip = 'Specifies the products or service being offered.';
                ApplicationArea = all;

                trigger OnValidate()
                begin
                    Rec.SetWorkDescription(WorkDescription);
                end;
            }
            field("Consturction PO"; Rec."Consturction PO")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
            field("Contract Code"; Rec."Contract Code")
            {
                ApplicationArea = all;
                ToolTip = ' ';
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        WorkDescription:=Rec.GetWorkDescription();
    end;
    var WorkDescription: Text;
}
