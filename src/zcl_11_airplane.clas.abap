CLASS zcl_11_airplane DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING !id                  TYPE string
                plane_type           TYPE string
                empty_weigth_in_tons TYPE i
      RAISING   zcx_11_initial_parameter.

    METHODS get_id                   RETURNING VALUE(result) TYPE string.
    METHODS get_plane_type           RETURNING VALUE(result) TYPE string.
    METHODS get_empty_weigth_in_tons RETURNING VALUE(result) TYPE i.
    METHODS get_total_weigth_in_tons RETURNING VALUE(result) TYPE i.

    CLASS-METHODS get_number_of_airplanes RETURNING VALUE(result) TYPE i.

  PRIVATE SECTION.
    DATA id                   TYPE string.
    DATA plane_type           TYPE string.
    DATA empty_weigth_in_tons TYPE i.

    CLASS-DATA number_of_airplanes TYPE i.

ENDCLASS.


CLASS zcl_11_airplane IMPLEMENTATION.
  METHOD constructor.
    IF id IS INITIAL.
      RAISE EXCEPTION NEW zcx_11_initial_parameter( parameter = 'ID' ).
    ENDIF.

    IF plane_type IS INITIAL.
      RAISE EXCEPTION NEW zcx_11_initial_parameter( parameter = 'PLANE_TYPE' ).
    ENDIF.

    IF empty_weigth_in_tons IS INITIAL.
      RAISE EXCEPTION NEW zcx_11_initial_parameter( parameter = 'EMPTY_WEIGHT_IN_TONS' ).
    ENDIF.

    me->id                   = id.
    me->plane_type           = plane_type.
    me->empty_weigth_in_tons = empty_weigth_in_tons.

    number_of_airplanes += 1.
  ENDMETHOD.

  METHOD get_id.
    result = id.
  ENDMETHOD.

  METHOD get_plane_type.
    result = plane_type.
  ENDMETHOD.

  METHOD get_empty_weigth_in_tons.
    result = empty_weigth_in_tons.
  ENDMETHOD.

  METHOD get_number_of_airplanes.
    result = number_of_airplanes.
  ENDMETHOD.

  METHOD get_total_weigth_in_tons.
    result = empty_weigth_in_tons * '1.1'.
  ENDMETHOD.
ENDCLASS.
