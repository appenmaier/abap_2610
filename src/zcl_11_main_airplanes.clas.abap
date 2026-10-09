CLASS zcl_11_main_airplanes DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_11_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA airplane  TYPE REF TO zcl_11_airplane.
    DATA carrier TYPE REF TO zcl_11_carrier.

    " Carrier
    carrier = NEW #( 'Airhansa' ).

    " Airplane 1
    airplane = NEW zcl_11_passenger_plane( id                   = 'D-AIMA'
                                           plane_type           = 'Airbus A380-800'
                                           empty_weigth_in_tons = 277
                                           seats                = 800 ). " Upcast
    carrier->add_airplane( airplane ).

    " Airplane 2
    airplane = NEW zcl_11_fighter_jet( id                   = 'HH 03-4051'
                                       plane_type           = 'Lockheed Martin F-22 Raptor'
                                       empty_weigth_in_tons = 20 ). " Upcast
    carrier->add_airplane( airplane ).

    " Airplane 3
    TRY.
        airplane = NEW zcl_11_passenger_plane( id                   = 'D-ABVM'
                                               plane_type           = 'Boeing 747-400'
                                               empty_weigth_in_tons = 183
                                               seats                = 400 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_11_initial_parameter INTO DATA(e).
        out->write( e->get_text( ) ).
    ENDTRY.

    " Output
    out->write( carrier->get_biggest_passenger_plane( )->get_id( ) ).
  ENDMETHOD.
ENDCLASS.
