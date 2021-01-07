@AbapCatalog.sqlViewName: 'ZIT001_USER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data Definition of zcad_t001_user'
@VDM.viewType: 'Basic'
@Analytics.dataCategory: #FACT
define root view ZI_T001_USER as select from zcad_t001_user
  association [0..1] to t001 as _t001 
  on $projection.bukrs = _t001.bukrs
{
    key bukrs as bukrs,
    pernr as pernr,
    smtp_addr as smtp_addr,
    mob_number as mob_number,
    twitter as twitter,
    linkedin as linkedin,
    
    _t001
}
