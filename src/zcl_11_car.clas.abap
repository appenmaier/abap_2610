CLASS zcl_11_car DEFINITION
  PUBLIC
  INHERITING FROM zcl_11_vehicle FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS do_a_turbo_boost.

    METHODS to_string REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_11_car IMPLEMENTATION.
  METHOD do_a_turbo_boost.
    speed_in_kmh *= 2.
  ENDMETHOD.

  METHOD to_string.
    string = |{ get_make( ) } { get_model( ) } ({ speed_in_kmh }kmh)|.
  ENDMETHOD.
ENDCLASS.
