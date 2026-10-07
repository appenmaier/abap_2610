CLASS zcl_11_demo_04 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_11_demo_04 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " int i = 1;
    " while (i <= 10) {
    "   sysout(i);
    "   i++;
    " }

    WHILE sy-index <= 10.
      out->write( sy-index ).
    ENDWHILE.

    DO 10 TIMES.
      out->write( sy-index ).
    ENDDO.

    DO.
      IF sy-index = 11.
        RETURN.
      ENDIF.
      out->write( sy-index ).
    ENDDO.
  ENDMETHOD.
ENDCLASS.
