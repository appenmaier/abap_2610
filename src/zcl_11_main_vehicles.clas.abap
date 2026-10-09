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
    DATA car      TYPE REF TO zcl_11_car.
    DATA truck    TYPE REF TO zcl_11_truck.

    out->write( zcl_11_vehicle=>get_number_of_vehicles( ) ).

    " Vehicle 1
    vehicle = NEW zcl_11_car( make  = 'BMW'
                              model = '1er' ). " Upcast
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
    vehicle = NEW zcl_11_car( make  = 'Audi'
                              model = 'A4' ). " Upcast
    vehicle->accelerate( 90 ).
    APPEND vehicle TO vehicles.

    out->write( zcl_11_vehicle=>get_number_of_vehicles( ) ).

    " Vehicle 3
    vehicle = NEW zcl_11_truck( make           = 'MAN'
                                model          = 'TGX'
                                is_transformed = abap_true ). " Upcast
    APPEND vehicle TO vehicles.

    out->write( zcl_11_vehicle=>get_number_of_vehicles( ) ).

    " Output
    LOOP AT vehicles INTO vehicle.
      vehicle->accelerate( 100 ).
      IF vehicle IS INSTANCE OF zcl_11_car.
        car = CAST #( vehicle ). " Downcast
        car->do_a_turbo_boost( ).
      ELSEIF vehicle IS INSTANCE OF zcl_11_truck.
        truck = CAST #( vehicle ). " Downcast
        truck->transform( ).
      ENDIF.
      out->write( vehicle->to_string( ) ). " Polymorphism
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
