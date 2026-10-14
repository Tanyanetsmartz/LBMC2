codeunit 50001 "LBMC UKG Payroll Mngt."
{
    trigger OnRun()
    begin
    end;
    procedure CreateDefaultAPI()
    var
        TenWebService: Record "Tenant Web Service";
    begin
        if not TenWebService.get(TenWebService."Object Type"::Codeunit, 'UKGWebServices')then begin
            TenWebService.Init();
            TenWebService."Object Type":=TenWebService."Object Type"::Codeunit;
            TenWebService."Object ID":=50000;
            TenWebService."Service Name":='UKGWebServices';
            TenWebService.Published:=true;
            TenWebService.Insert(true);
        end;
        Message('Inserted');
    end;
    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry"; var GenJournalLine: Record "Gen. Journal Line");
    begin
        GLEntry."Resource No.":=GenJournalLine."Resource No.";
    end;
}
