reportextension 50000 "ExportElecPayments - Word" extends "ExportElecPayments - Word"
{
    dataset
    {
        add("Gen. Journal Line")
        {
            column(Posting_Date; "Posting Date")
            {
            }
        }
    }
    rendering
    {
        layout(Attachments)
        {
            Type = Word;
            LayoutFile = './Layouts/BBN-11383-AttachmentLayout.docx';
        }
        layout(EmailBody)
        {
            Type = Word;
            LayoutFile = './Layouts/EmailBody.docx';
        }
    }
}
