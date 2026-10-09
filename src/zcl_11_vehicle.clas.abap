CLASS zcl_11_vehicle DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING make  TYPE string
                model TYPE string.

    METHODS accelerate IMPORTING value_in_kmh TYPE i.

    METHODS brake IMPORTING value_in_kmh TYPE i
                  RAISING   zcx_11_invalid_value.

    METHODS get_make         RETURNING VALUE(make)         TYPE string.
    METHODS get_model        RETURNING VALUE(model)        TYPE string.
    METHODS get_speed_in_kmh RETURNING VALUE(speed_in_kmh) TYPE i.

    CLASS-METHODS get_number_of_vehicles RETURNING VALUE(result) TYPE i.

  PRIVATE SECTION.
    DATA make         TYPE string.
    DATA model        TYPE string.
    DATA speed_in_kmh TYPE i.

    CLASS-DATA number_of_vehicles TYPE i.
ENDCLASS.


CLASS zcl_11_vehicle IMPLEMENTATION.
  METHOD accelerate.
    speed_in_kmh += value_in_kmh.
  ENDMETHOD.

  METHOD brake.
    IF value_in_kmh > speed_in_kmh.
      RAISE EXCEPTION NEW zcx_11_invalid_value( value = value_in_kmh ).
    ENDIF.

    speed_in_kmh -= value_in_kmh.
  ENDMETHOD.

  METHOD get_make.
    make = me->make.
  ENDMETHOD.

  METHOD get_model.
    model = me->model.
  ENDMETHOD.

  METHOD constructor.
    me->make  = make.
    me->model = model.

    number_of_vehicles += 1.
  ENDMETHOD.

  METHOD get_speed_in_kmh.
    speed_in_kmh = me->speed_in_kmh.
  ENDMETHOD.

  METHOD get_number_of_vehicles.
    result = number_of_vehicles.
  ENDMETHOD.
ENDCLASS.
