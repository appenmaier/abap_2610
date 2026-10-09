CLASS zcl_11_airplane DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING !id                  TYPE string
                plane_type           TYPE string
                empty_weigth_in_tons TYPE i.

    METHODS get_id                   RETURNING VALUE(result) TYPE string.
    METHODS get_plane_type           RETURNING VALUE(result) TYPE string.
    METHODS get_empty_weigth_in_tons RETURNING VALUE(result) TYPE i.

  PRIVATE SECTION.
    DATA id                   TYPE string.
    DATA plane_type           TYPE string.
    DATA empty_weigth_in_tons TYPE i.

ENDCLASS.


CLASS zcl_11_airplane IMPLEMENTATION.
  METHOD constructor.
    me->id                   = id.
    me->plane_type           = plane_type.
    me->empty_weigth_in_tons = empty_weigth_in_tons.
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
ENDCLASS.
