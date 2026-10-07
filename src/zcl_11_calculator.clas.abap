CLASS zcl_11_calculator DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES ty_decimal TYPE p LENGTH 16 DECIMALS 2.

    CLASS-METHODS divide
      IMPORTING a             TYPE ty_decimal
                b             TYPE ty_decimal
      RETURNING VALUE(result) TYPE ty_decimal
      RAISING   cx_abap_invalid_value.

    " public static double divide(double a, double b) throws InvalidValueException {
    "   if (b == 0) {
    "      throw new InvalidValueException(b);
    "   }
    "   return a / b;
    " }

    CLASS-METHODS calculate_percentage
      IMPORTING !percentage             TYPE ty_decimal
                !base                   TYPE ty_decimal
      RETURNING VALUE(percentage_value) TYPE ty_decimal.
ENDCLASS.


CLASS zcl_11_calculator IMPLEMENTATION.
  METHOD divide.
    IF b IS INITIAL.
      RAISE EXCEPTION NEW cx_abap_invalid_value( value = CONV string( b ) ).
    ENDIF.

    result = a / b.
    " RETURN a / b.
  ENDMETHOD.

  METHOD calculate_percentage.
    percentage_value = percentage * base / 100.
  ENDMETHOD.
ENDCLASS.
