CLASS zcl_11_abap_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_11_abap_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(travels) = zcl_11_helper=>get_travels( '000044' ).

        DELETE travels WHERE end_date < cl_abap_context_info=>get_system_date( ).

        LOOP AT travels ASSIGNING FIELD-SYMBOL(<travel>).
          <travel>-booking_fee *= '1.1'.
        ENDLOOP.

        SORT travels BY description DESCENDING.

        LOOP AT travels INTO DATA(travel).
          out->write( travel ).
        ENDLOOP.

      CATCH zcx_abap_no_data INTO DATA(e).
        out->write( e->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
