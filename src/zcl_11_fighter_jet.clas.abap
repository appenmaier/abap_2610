CLASS zcl_11_fighter_jet DEFINITION
  PUBLIC
  INHERITING FROM zcl_11_airplane FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS do_a_barrel_roll
      RAISING zcx_abap_vomit_overflow.

    METHODS get_total_weigth_in_tons REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA vomit_factor TYPE p LENGTH 2 DECIMALS 2.

ENDCLASS.


CLASS zcl_11_fighter_jet IMPLEMENTATION.
  METHOD do_a_barrel_roll.
    IF vomit_factor = '0.75'.
      vomit_factor = 0.
      RAISE EXCEPTION NEW zcx_abap_vomit_overflow( ).
    ENDIF.

    vomit_factor += '0.25'.
  ENDMETHOD.

  METHOD get_total_weigth_in_tons.
    result = super->get_total_weigth_in_tons( ) + '0.08'.
  ENDMETHOD.
ENDCLASS.
