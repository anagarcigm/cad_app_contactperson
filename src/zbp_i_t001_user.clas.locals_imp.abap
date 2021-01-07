CLASS lhc_t001_user DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    DATA: lt_fields       TYPE TABLE OF dfies.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE t001_user.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE t001_user.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE t001_user.


    METHODS read FOR READ
      IMPORTING keys FOR READ t001_user RESULT result.

   METHODS get_features FOR FEATURES IMPORTING keys REQUEST requested_features
      FOR t001_user RESULT result.

ENDCLASS.

CLASS lhc_t001_user IMPLEMENTATION.

  METHOD create.

   DATA: LS_USER TYPE ZCAD_T001_USER.


    loop at entities ASSIGNING FIELD-SYMBOL(<FS_USER>).
        LS_USER = CORRESPONDING #( <FS_USER> ).
       INSERT  ZCAD_T001_USER FROM LS_USER.
     endloop.
  ENDMETHOD.

  METHOD delete.


   DATA: LS_USER TYPE ZCAD_T001_USER.
   loop at keys ASSIGNING FIELD-SYMBOL(<FS_USER>).

      LS_USER = CORRESPONDING #( <FS_USER> ).
      DELETE FROM ZCAD_T001_USER WHERE BUKRS = LS_USER-BUKRS.

   ENDLOOP.


  ENDMETHOD.

  METHOD update.

   if entities is not INITIAL.

    call FUNCTION 'DDIF_FIELDINFO_GET'
    EXPORTING
      TABNAME = 'ZCAD_T001_USER'
    TABLES
      dfies_tab      = lt_fields
    EXCEPTIONS
       not_found      = 1
       internal_error = 2
       OTHERS         = 3.

    DATA(ls_data) = entities[ 1 ].

    SELECT SINGLE *
    FROM ZCAD_T001_USER
    INTO @DATA(ls_tmp_tabl)
    WHERE BUKRS = @ls_data-BUKRS.

    LOOP AT lt_fields ASSIGNING FIELD-SYMBOL(<fs_field>).
      ASSIGN COMPONENT <fs_field>-fieldname OF STRUCTURE ls_data TO FIELD-SYMBOL(<fs_target>).

      IF <fs_target> IS ASSIGNED AND <fs_target> IS NOT INITIAL.

       ASSIGN COMPONENT <fs_field>-fieldname OF STRUCTURE ls_tmp_tabl
       TO FIELD-SYMBOL(<fs_source>).

        <fs_source> = <fs_target>.

     ENDIF.

    ENDLOOP.
    UPDATE ZCAD_T001_USER FROM LS_TMP_TABL.

    endif.

  ENDMETHOD.


  METHOD read.

   DATA: LS_OUT TYPE ZCAD_T001_USER.


   loop at keys INTO DATA(LS_USER).
     SELECT SINGLE * INTO LS_OUT
     FROM ZCAD_T001_USER
     WHERE BUKRS = LS_USER-BUKRS.


    INSERT CORRESPONDING #( ls_out  ) INTO TABLE RESULT.

   ENDLOOP.

  ENDMETHOD.

   method get_features.

    READ ENTITY zi_t001_user FROM VALUE #( FOR keyval IN keys
                                            (  %key            = keyval-%key
                                               %control-bukrs = if_abap_behv=>mk-on
                                                     ) )
                                    RESULT  DATA(lt_result).


    result = VALUE #( FOR ls_data IN lt_result
                       ( %key                         = ls_data-%key
                         %field-bukrs = if_abap_behv=>fc-f-read_only
                     ) ).

   ENDMETHOD.
ENDCLASS.

CLASS lsc_ZI_T001_USER DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS check_before_save REDEFINITION.

    METHODS finalize          REDEFINITION.

    METHODS save              REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_T001_USER IMPLEMENTATION.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD finalize.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

ENDCLASS.
