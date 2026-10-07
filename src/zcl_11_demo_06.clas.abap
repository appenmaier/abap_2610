CLASS zcl_11_demo_06 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_11_demo_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA connections TYPE z11_connections. " List<Connection> connections = new ArrayList<>();
    DATA connection  TYPE z11_connection.

    " Add Data
    connections = VALUE #( ( carrier_id = 'LH' connection_id = '0400' )
                           ( carrier_id = 'UA' airport_to_id = 'BER' connection_id = '5555' )
                           ( carrier_id = 'AZ' ) ). " connections.add(null); connections.add(null); conncetions.add(null);

    connection-carrier_id    = 'UA'.
    connection-connection_id = '3517'.

    connections = VALUE #( BASE connections
                           ( )
                           ( connection ) ).

    APPEND connection TO connections.

    " Read Data
    connection = connections[ 1 ]. " Connection connection = connections.get(0);
    connection = connections[ carrier_id    = 'UA'
                              connection_id = '3517' ].

    LOOP AT connections INTO connection WHERE carrier_id = 'UA'.
      out->write( |{ sy-tabix } { connection-connection_id }| ).
    ENDLOOP.
    " for (Connection connection : connections) {
    "    if (connection.getCarrierId().equals("UA")) {
    "       System.out.println(connection);
    "    }
    " }

    " Change Data
    connections[ 4 ]-carrier_id = 'LH'.
    connections[ 4 ]-connection_id = '0401'.
    connections[ 4 ]-airport_to_id = 'JFK'.

    LOOP AT connections REFERENCE INTO DATA(connection2) WHERE airport_from_id IS INITIAL.
      connection2->airport_from_id = 'MUC'.
    ENDLOOP.

    LOOP AT connections ASSIGNING FIELD-SYMBOL(<connection>) WHERE connection_id IS INITIAL.
      <connection>-connection_id = '0017'.
    ENDLOOP.

    " Sort Data
    SORT connections BY carrier_id DESCENDING
                        connection_id ASCENDING
                        airport_to_id DESCENDING.

    " Delete Data
    DELETE connections INDEX 2.
    DELETE connections WHERE airport_to_id IS INITIAL.

    " Error Handling
    " Alterantive A
    TRY.
        connection = connections[ 10 ].
      CATCH cx_sy_itab_line_not_found.
        " do nothing
    ENDTRY.

    " Alternative B
    IF line_exists( connections[ 10 ] ).
      connection = connections[ 10 ].
    ENDIF.
  ENDMETHOD.
ENDCLASS.
