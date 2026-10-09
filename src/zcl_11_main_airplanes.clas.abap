CLASS zcl_11_main_airplanes DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_11_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA airplane  TYPE REF TO zcl_11_airplane.
    DATA airplanes TYPE TABLE OF REF TO zcl_11_airplane.

    " Airplane 1
    airplane = NEW #( id                   = 'D-ABUK'
                      plane_type           = 'Airbus A380-800'
                      empty_weigth_in_tons = 277 ).
    APPEND airplane TO airplanes.

    " Airplane 2
    airplane = NEW #( id                   = 'D-AIND'
                      plane_type           = 'Airbus A320-200'
                      empty_weigth_in_tons = 42 ).
    APPEND airplane TO airplanes.

    " Airplane 3
    airplane = NEW #( id                   = 'D-AJKF'
                      plane_type           = 'Boeing 747-400F'
                      empty_weigth_in_tons = 166 ).
    APPEND airplane TO airplanes.

    " Output
    LOOP AT airplanes INTO airplane.
      out->write( |{ airplane->get_id( ) }, { airplane->get_plane_type( ) }, { airplane->get_empty_weigth_in_tons( ) }t| ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
