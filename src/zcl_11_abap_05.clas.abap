CLASS zcl_11_abap_05 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_11_abap_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA customer TYPE z11_customer_info.

    TRY.
        customer = zcl_abap_helper=>get_customer( '019286' ).
      CATCH zcx_abap_no_data INTO DATA(e).
        out->write( e->get_text( ) ).
        RETURN.
    ENDTRY.

    out->write( |First Name: { customer-first_name }| ).
    out->write( |Last Name: { customer-last_name }| ).
    out->write( |City: { customer-city }| ).
    out->write( |Country Code: { customer-country_code }| ).
  ENDMETHOD.
ENDCLASS.
