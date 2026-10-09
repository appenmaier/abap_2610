CLASS zcl_11_main_vehicles DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_11_main_vehicles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA vehicle  TYPE REF TO zcl_11_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_11_vehicle.

    out->write( zcl_11_vehicle=>get_number_of_vehicles( ) ).

    " Vehicle 1
    vehicle = NEW #( make  = 'BMW'
                     model = '1er' ).
    vehicle->accelerate( 50 ).
    vehicle->accelerate( 100 ).
    TRY.
        vehicle->brake( 200 ).
      CATCH zcx_11_invalid_value INTO DATA(e).
        out->write( e->get_text( ) ).
    ENDTRY.
    APPEND vehicle TO vehicles.

    out->write( zcl_11_vehicle=>get_number_of_vehicles( ) ).

    " Vehicle 2
    vehicle = NEW #( make  = 'Audi'
                     model = 'A4' ).
    vehicle->accelerate( 90 ).
    APPEND vehicle TO vehicles.

    out->write( zcl_11_vehicle=>get_number_of_vehicles( ) ).

    " Vehicle 3
    vehicle = NEW #( make  = 'MAN'
                     model = 'TGX' ).
    APPEND vehicle TO vehicles.

    out->write( zcl_11_vehicle=>get_number_of_vehicles( ) ).

    " Output
    LOOP AT vehicles INTO vehicle.
      vehicle->accelerate( 100 ).
      out->write( |{ vehicle->get_make( ) } { vehicle->get_model( ) }| ).
      out->write( |{ vehicle->get_speed_in_kmh( ) }kmh| ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
