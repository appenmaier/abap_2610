CLASS zcl_11_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_11_vehicle FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES ty_transformed TYPE c LENGTH 1.

    METHODS constructor
      IMPORTING make           TYPE string
                model          TYPE string
                is_transformed TYPE ty_transformed.

    METHODS transform.
    METHODS get_is_transformed RETURNING VALUE(result) TYPE ty_transformed.
    METHODS to_string REDEFINITION. " Java: @Override

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA is_transformed TYPE c LENGTH 1.

ENDCLASS.


CLASS zcl_11_truck IMPLEMENTATION.
  METHOD transform.
    IF is_transformed = abap_true.
      is_transformed = abap_false.
    ELSE.
      is_transformed = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD get_is_transformed.
    result = is_transformed.
  ENDMETHOD.

  METHOD constructor.
    super->constructor( make  = make
                        model = model ).

    me->is_transformed = is_transformed.
  ENDMETHOD.

  METHOD to_string.
    string = |{ get_make( ) } { get_model( ) } ({ speed_in_kmh }kmh, { is_transformed })|.
  ENDMETHOD.
ENDCLASS.
