CLASS zcl_11_demo_03 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_11_demo_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA age        TYPE i          VALUE 14.
    DATA gender     TYPE c LENGTH 1 VALUE 'W'.
    DATA last_name  TYPE string     VALUE 'Appenmaier'.
    DATA first_name TYPE string     VALUE 'Mia'.

    " Branches
    " Comparison Operators: <, >, <=, >=, =, <>
    " Logical Operators: AND, OR, NOT
    IF age >= 18 AND ( gender = 'M' OR gender = 'm' ).
      out->write( |Hello Mister { last_name }| ).
    ELSEIF age >= 18 AND ( gender = 'W' OR gender = 'w' ).
      out->write( |Hello Miss { last_name }| ).
    ELSE.
      out->write( |Hello { first_name }| ).
    ENDIF.

    out->write(
        |Hello { COND string( WHEN age >= 18 AND ( gender = 'M' OR gender = 'm' ) THEN |Mister { last_name }|
                              WHEN age >= 18 AND ( gender = 'W' OR gender = 'w' ) THEN |Miss { last_name }|
                              ELSE                                                     first_name            ) }| ).

    DATA(title) = COND string( WHEN gender = 'M' THEN 'Mister'
                               WHEN gender = 'W' THEN 'Miss'
                               ELSE                   '' ).
    out->write( title ).

    IF title IS INITIAL. " IF title = ''.
      out->write( 'title is initial' ).
    ENDIF.

    " Cases
    CASE gender.
      WHEN 'M' OR 'm'.
        out->write( |Mister { last_name }| ).
      WHEN 'W' OR 'w'.
        out->write( |Miss { last_name }| ).
      WHEN OTHERS.
        out->write( |{ first_name }| ).
    ENDCASE.

    out->write( |{ SWITCH string( gender
                                  WHEN 'M' OR 'm' THEN 'Mister'
                                  WHEN 'W' OR 'w' THEN 'Miss'
                                  ELSE                 '' ) }| ).
  ENDMETHOD.
ENDCLASS.
