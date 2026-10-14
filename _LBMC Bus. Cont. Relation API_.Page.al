page 50009 "LBMC Bus. Cont. Relation API"
{
    PageType = API;
    Caption = 'Bus. Cont. Relation API';
    APIPublisher = 'lbmc';
    APIGroup = 'salesforce';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'buscontrelation';
    EntitySetName = 'buscontrelation';
    SourceTable = "Contact Business Relation";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(businessRelationCode; Rec."Business Relation Code")
                {
                    Caption = 'Business Relation Code';
                }
                field(businessRelationDescription; Rec."Business Relation Description")
                {
                    Caption = 'Business Relation Description';
                }
                field(contactName; Rec."Contact Name")
                {
                    Caption = 'Contact Name';
                }
                field(contactNo; Rec."Contact No.")
                {
                    Caption = 'Contact No.';
                }
                field(linkToTable; Rec."Link to Table")
                {
                    Caption = 'Link to Table';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
            }
        }
    }
}
