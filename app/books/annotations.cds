using AdminService as service from '../../srv/service';

annotate service.Books with @(
    UI : {
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Book',
            TypeNamePlural : 'Books',
            Title: {Value: title, Label: 'Book Title'}
        },

        SelectionFields  : [
            ID, title, author_ID
        ],

        LineItem  : [
            { $Type: 'UI.DataFieldForAction', Action: 'AdminService.complete', Label: 'Complete'},
            { Value: ID, Label: 'ID'},
            { Value: title, Label: 'Title'},
            { Value: author_ID, Label: 'Author'}
        ],

        HeaderFacets  : [
            { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#ID'}
        ],

        DataPoint #ID : {
            $Type : 'UI.DataPointType',
            Value : ID,
            ![@UI.Emphasized]
        },

        Facets  : [
            {
            $Type  : 'UI.CollectionFacet',
            Label : 'General_Data',
            ID : 'GeneralData',
            Facets : [ 
                {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#General',
                Label : '{i18n>General_Data}',
                ID : 'GeneralData',
            
                }            
            ],
            },
            {
            $Type  : 'UI.CollectionFacet',
            Label : 'Authors',
            ID : 'Authors',
            Facets : [ 
                {
                $Type : 'UI.ReferenceFacet',
                Target : 'author/@UI.LineItem',
                Label : 'Authors',
                ID : 'Authors',
                }            
            ],
            }        
        ],

        FieldGroup #General : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                $Type: 'UI.DataField',
                Label : 'Title',
                Value : title
                },
                {
                $Type: 'UI.DataField',
                Label:'Author ID', 
                Value : author_ID
                }                
            ]    
        },        

    }
);

annotate service.Authors with @(
    UI: {
        LineItem : [
            { Value: ID, Label: 'ID'},
            { Value: dateOfBirth, Label: 'Date Of Birth'}
        ],
    }

);
