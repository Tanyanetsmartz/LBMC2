pageextension 50013 "Purchases & Payables Setup" extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Default Accounts")
        {
            group("Asset Posting")
            {
                field("FA G/L Template"; Rec."FA G/L Template")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("FA G/L Batch"; Rec."FA G/L Batch")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Stock Adjmt. A/c"; Rec."Stock Adjmt. A/c")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
            }
        }
        addafter("Default Posting Date")
        {
            field(ContructionPODisclaimer; ContructionPODisclaimer)
            {
                Caption = 'Contraction PO Disclaimer';
                Importance = Additional;
                MultiLine = true;
                ToolTip = 'Contents here will be printed on Contruction Purchase Order documents';
                ApplicationArea = all;

                trigger OnValidate()
                begin
                    Rec.SetContructionPODisplaimer(ContructionPODisclaimer);
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        ContructionPODisclaimer:=Rec.GetContructionPODisplaimer();
    end;
    var ContructionPODisclaimer: Text;
}
