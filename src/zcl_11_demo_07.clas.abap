CLASS zcl_11_demo_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_11_demo_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Standard SQL
    " SELECT <Column 1>, <Column 2>, ...
    "    FROM <Table> | <View>
    "    [WHERE <Condition>]
    "    [ORDER BY <Column 1> ASC | DESC];

    DATA connections2 TYPE TABLE OF z11_connection.

    " Read Single Entry
    SELECT SINGLE FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = 'LH' AND connection_id = '0400'
      INTO @DATA(connection).
    IF sy-subrc <> 0.
      out->write( |No Data Found| ).
    ENDIF.
    out->write( connection ).

    " Read Multiple Entries
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = 'LH'
      INTO TABLE @DATA(connections).
    IF sy-subrc <> 0.
      out->write( |No Data Found| ).
    ENDIF.
    out->write( connections ).

    " Declaration of Target
    SELECT FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = 'LH'
      INTO TABLE @connections2.
    IF sy-subrc <> 0.
      out->write( |No Data Found| ).
    ENDIF.
    out->write( connections2 ).

    CLEAR connections2.
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = 'LH'
      INTO CORRESPONDING FIELDS OF TABLE @connections2.
    IF sy-subrc <> 0.
      out->write( |No Data Found| ).
    ENDIF.
    out->write( connections2 ).
  ENDMETHOD.
ENDCLASS.
