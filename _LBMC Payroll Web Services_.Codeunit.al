codeunit 50003 "LBMC Payroll Web Services"
{
    trigger OnRun()
    begin
    end;
    procedure EmployeeOperation(EmployeeCode: Code[20]; EmployeeName: Text[100]; TerminationDate: Date): Integer var
        Resource: Record Resource;
        UKGSetup: Record "LBMC UKG Integration Setup";
    begin
        if EmployeeCode = '' then Error('Employee Code is Blank. Employee Code must have a value');
        if Resource.Get(EmployeeCode)then begin
            if Resource.Name <> EmployeeName then Resource.Validate(Name, EmployeeName);
            if TerminationDate <> 0D then if Not Resource.Blocked then Resource.validate(Blocked, true);
            Resource.Modify(true);
        end
        else
        begin
            UKGSetup.Get();
            Resource.Init();
            Resource."No.":=EmployeeCode;
            Resource.Insert(true);
            Resource.Validate(Name, EmployeeName);
            Resource.Validate(Type, Resource.Type::Person);
            Resource.Validate("Employment Date", Today);
            if UKGSetup."Def. Base Unit of Measure" <> '' then Resource.Validate("Base Unit of Measure", UKGSetup."Def. Base Unit of Measure");
            if UKGSetup."Use Time Sheet" then Resource.Validate("Use Time Sheet", UKGSetup."Use Time Sheet");
            if UKGSetup."Def. Gen. Prod. Posting Group" <> '' then Resource.Validate("Gen. Prod. Posting Group", UKGSetup."Def. Gen. Prod. Posting Group");
            if UKGSetup."Def. Tax Group Code" <> '' then Resource.Validate("Tax Group Code", UKGSetup."Def. Tax Group Code");
            if UKGSetup."Def. VAT Prod. Posting Group" <> '' then Resource.Validate("VAT Prod. Posting Group", UKGSetup."Def. VAT Prod. Posting Group");
            Resource.Modify(true);
        end;
        exit(1);
    end;
}
