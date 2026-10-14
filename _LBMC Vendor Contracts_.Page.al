page 50032 "LBMC Vendor Contracts"
{
    PageType = List;
    SourceTable = "LBMC Vendor Contract";
    Caption = 'Vendor Contracts';

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = ' ';
                }
            }
        }
    }
}
