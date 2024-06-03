using app.fashionShop from '../db/fashionShop';

service fashionShop_Service {

    entity Sections as  projection on fashionShop.Sections;
    entity Fashion_Types as  projection on fashionShop.Fashion_Types;
    entity Fashion_Items as  projection on fashionShop.Fashion_Items;
    entity SrvFashionShop as projection on fashionShop.YC_FashionShop;

}


@odata.draft.enabled
annotate fashionShop.Fashion_Items with @(UI:{

    CreateHidden : false ,
    UpdateHidden : false ,
    DeleteHidden : false ,

     HeaderInfo  : {
         $Type : 'UI.HeaderInfoType',
         TypeName : 'Online Fashion Shop',
         TypeNamePlural : 'Online Fashion Shop',
         Title : {Value : itemname },
         Description : {Value : 'Online Fashion Shop'},
     },

     SelectionFields: [
        FashionType.id,
        itemname,
        brand,
        size,
        price
     ],

     LineItem  : [
        {Value: FashionType.section.id}, // We have create the annotation for that column from the cds schema.
        {Value: FashionType.section.name},
        {Value: FashionType.typename},
        {Value: itemname},
        {Value: brand},
        {Value: price},
        {Value: currency_code}

     ],
 
    
     Facets : [
        {
     
        $Type : 'UI.CollectionFacet',
        ID : '1',
        Label : 'Fashion Type Section',
        Facets: [{
            Label : '',
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#TypeSection',
        }]
        },

        {
        $Type : 'UI.CollectionFacet',
        ID : '2',
        Label : 'Fashion Item ',
        Facets: [{
            Label : '',
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#FItem',
        }]
        }

     ],

     FieldGroup #TypeSection : { 
        Data: [
        {Value: FashionType.id },
        {Value: FashionType.typename },
        {Value: FashionType.description},
        {Value: FashionType.section.description},
        {Value: FashionType.section.name},
        {Value: FashionType.section.id}
     ]},

     FieldGroup #FItem : { Data: [
        {Value: id},
        {Value: itemname },
        {Value: brand},
        {Value: material},
        {Value: size},
        {Value: price},
        {Value: currency_code},
        {Value: isAvailable}
     ]},

   

   

});