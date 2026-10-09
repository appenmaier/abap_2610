CLASS zcl_11_passenger_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_11_airplane FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING !id                  TYPE string
                plane_type           TYPE string
                empty_weigth_in_tons TYPE i
                seats                TYPE i
      RAISING   zcx_11_initial_parameter.

    METHODS get_seats RETURNING VALUE(result) TYPE i.

    METHODS eject_seats
      IMPORTING seats TYPE i.

    METHODS get_total_weigth_in_tons REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA seats TYPE i.

ENDCLASS.


CLASS zcl_11_passenger_plane IMPLEMENTATION.
  METHOD constructor.
    IF seats IS INITIAL.
      RAISE EXCEPTION NEW zcx_11_initial_parameter( parameter = 'SEATS' ).
    ENDIF.

    super->constructor( id                   = id
                        plane_type           = plane_type
                        empty_weigth_in_tons = empty_weigth_in_tons ).

    me->seats = seats.
  ENDMETHOD.

  METHOD get_seats.
    result = seats.
  ENDMETHOD.

  METHOD eject_seats.
    me->seats -= seats.
  ENDMETHOD.

  METHOD get_total_weigth_in_tons.
    result = get_empty_weigth_in_tons( ) * '1.1' + seats * '0.08'.
    result = super->get_total_weigth_in_tons( ) + seats * '0.08'.
  ENDMETHOD.
ENDCLASS.
