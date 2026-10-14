pageextension 50002 "Business Manager Role Center" extends "Business Manager Role Center"
{
    actions
    {
        addafter(Action41)
        {
            group("UKG Payroll")
            {
                action("UKG Setup")
                {
                    ApplicationArea = all;
                    Image = Payroll;
                    RunObject = page "LBMC UKG Integration Setup";
                }
                action(UploadPayrollJnl)
                {
                    Caption = 'Upload Payroll Jnl.';
                    ApplicationArea = all;
                    Image = UpdateXML;
                    RunObject = report "LBMC Upload Payroll Jnl.";
                    ToolTip = ' ';
                }
                action(UploadGLPayrollJnl)
                {
                    Caption = 'Upload Payroll Job Jnl.';
                    ApplicationArea = all;
                    Image = Employee;
                    RunObject = report "LBMC Upload Payroll Job Jnl.";
                    ToolTip = ' ';
                }
            }
        }
    }
}
