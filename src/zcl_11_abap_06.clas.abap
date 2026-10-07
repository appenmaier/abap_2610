CLASS zcl_11_abap_06 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_11_abap_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        out->write( zcl_11_helper=>get_travel_with_customer( travel_id = '00003726' ) ).
      CATCH zcx_abap_no_data INTO DATA(e).
        out->write( e->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
