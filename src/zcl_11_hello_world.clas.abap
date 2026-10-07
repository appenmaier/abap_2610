CLASS zcl_11_hello_world DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_11_hello_world IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA text TYPE string. " Declaration

    text = 'Hello World'. " Assignment

    out->write( text ). " Output
  ENDMETHOD.
ENDCLASS.
