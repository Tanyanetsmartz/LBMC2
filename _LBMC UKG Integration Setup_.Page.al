page 50001 "LBMC UKG Integration Setup"
{
    SourceTable = "LBMC UKG Integration Setup";
    PageType = Card;
    UsageCategory = Administration;
    ApplicationArea = all;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group("Resource Defaults")
            {
                field("Def. Base Unit of Measure"; Rec."Def. Base Unit of Measure")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Use Time Sheet"; Rec."Use Time Sheet")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Def. Gen. Prod. Posting Group"; Rec."Def. Gen. Prod. Posting Group")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Def. Tax Group Code"; Rec."Def. Tax Group Code")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Def. VAT Prod. Posting Group"; Rec."Def. VAT Prod. Posting Group")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
            }
            group("Transactions")
            {
                field("Gen. Journal Template"; Rec."Gen. Journal Template")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Gen. Journal Batch"; Rec."Gen. Journal Batch")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Job Journal Template"; Rec."Job Journal Template")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field("Job Journal Batch"; Rec."Job Journal Batch")
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Add Web Services")
            {
                Image = Web;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = ' ';

                trigger OnAction()
                var
                    UKGPayMngt: Codeunit "LBMC UKG Payroll Mngt.";
                begin
                    UKGPayMngt.CreateDefaultAPI();
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get()then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
