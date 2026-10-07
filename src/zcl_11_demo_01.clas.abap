CLASS zcl_11_demo_01 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_11_demo_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    " Type Definitions
    TYPES ty_i       TYPE i. " b, s, i, int8
    TYPES ty_p_16_2  TYPE p LENGTH 16 DECIMALS 2.
    TYPES ty_boolean TYPE c LENGTH 1.
    TYPES ty_c_40    TYPE c LENGTH 40.
    TYPES ty_n_6     TYPE n LENGTH 6.
    TYPES ty_d       TYPE d.
    TYPES ty_t       TYPE t.

    " Data Object Declarations
    DATA size_in_m  TYPE ty_p_16_2.
    DATA is_male    TYPE ty_boolean.
    DATA first_name TYPE z11_first_name.
    DATA last_name  TYPE ty_c_40.
    DATA user_id    TYPE ty_n_6.
    DATA birthday   TYPE ty_d.
    DATA birthtime  TYPE ty_t.
    DATA(gender) = 'MALE'.

    " Value Assignment
    size_in_m = '1.79'.
    is_male = abap_true.
    first_name = 'Daniel'.
    last_name = 'Appenmaier'.
    user_id = '054906'.
    birthday = '19820104'. " YYYYMMDD
    birthtime = '043144'. " HHMMSS

    " Constants
    CONSTANTS co_pi TYPE p LENGTH 2 DECIMALS 2 VALUE '3.14'.

    " Output
    out->write( first_name ).
    out->write( |{ size_in_m NUMBER = USER } { birthday DATE = USER } { birthtime TIME = USER }| ).

  ENDMETHOD.
ENDCLASS.
