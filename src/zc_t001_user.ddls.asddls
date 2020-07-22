@EndUserText.label: 'Proyection ZI_T001_USER'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define root view entity ZC_T001_USER as projection on ZI_T001_USER      
     {
        key bukrs as bukrs,
    pernr as pernr,
    smtp_addr as smtp_addr,
    mob_number as mob_number,
    twitter as twitter,
    linkedin as linkedin
}
