CLASS zcl_11_carrier DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES ty_airplanes TYPE TABLE OF REF TO zcl_11_airplane WITH NON-UNIQUE DEFAULT KEY.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS add_airplane
      IMPORTING airplane TYPE REF TO zcl_11_airplane.

    METHODS get_biggest_passenger_plane
      RETURNING VALUE(result) TYPE REF TO zcl_11_passenger_plane.

  PRIVATE SECTION.
    DATA name      TYPE string.
    DATA airplanes TYPE ty_airplanes.

ENDCLASS.


CLASS zcl_11_carrier IMPLEMENTATION.
  METHOD add_airplane.
*    airplanes = VALUE #( BASE airplanes ( airplane ) ).
    APPEND airplane TO airplanes.
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD get_biggest_passenger_plane.
    DATA max TYPE i.

    LOOP AT airplanes INTO DATA(airplane).
      IF airplane IS INSTANCE OF zcl_11_passenger_plane AND airplane->get_total_weigth_in_tons( ) > max.
        max = airplane->get_total_weigth_in_tons( ).
        result = CAST #( airplane ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
