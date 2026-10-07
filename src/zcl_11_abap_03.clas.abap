CLASS zcl_11_abap_03 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_11_abap_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES ty_decimal TYPE p LENGTH 16 DECIMALS 2.

    DATA operator  TYPE c LENGTH 1 VALUE '/'.
    DATA result    TYPE ty_decimal.
    DATA operand_1 TYPE ty_decimal VALUE 5.
    DATA operand_2 TYPE ty_decimal VALUE 0.

    CASE operator.
      WHEN '+'.
        result = operand_1 + operand_2.
      WHEN '-'.
        result = operand_1 - operand_2.
      WHEN '*'.
        result = operand_1 * operand_2.
      WHEN '/'.
        TRY.
            result = zcl_11_calculator=>divide( a = operand_1
                                                b = operand_2 ).
          CATCH cx_abap_invalid_value INTO DATA(e).
            out->write( e->get_text( ) ).
            RETURN.
        ENDTRY.
      WHEN '%'.
        result = zcl_11_calculator=>calculate_percentage( percentage = operand_1
                                                          base       = operand_2 ).
      WHEN '^'.
        result = zcl_abap_helper=>calculate_power( base     = operand_1
                                                   exponent = operand_2 ).
      WHEN '2'.
        result = zcl_abap_helper=>calculate_power( operand_1 ).
      WHEN OTHERS.
        out->write( |invalid operator { operator }| ).
        RETURN.
    ENDCASE.

    out->write( |{ operand_1 NUMBER = USER } { operator } { operand_2 NUMBER = USER } = { result NUMBER = USER }| ).
  ENDMETHOD.
ENDCLASS.
