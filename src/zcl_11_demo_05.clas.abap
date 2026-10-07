CLASS zcl_11_demo_05 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_11_demo_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF ty_flight,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
             flight_date   TYPE /dmo/flight_date,
           END OF ty_flight.
    " public class Flight {
    "   public String carrierId;
    "   public String connectionId;
    "   public LocalDate flightDate;
    " }

    TYPES: BEGIN OF        ty_flight_with_connection,
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             flight_date     TYPE /dmo/flight_date,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
           END OF ty_flight_with_connection.

    DATA connection             TYPE z11_connection.            " Connection connection = new Connection();
    DATA flight                 TYPE ty_flight.                 " Flight flight = new Flight();
    DATA flight_with_connection TYPE ty_flight_with_connection.

    connection-carrier_id      = 'LH'.   " connection.carrierId = "LH";
    connection-connection_id   = '0400'. " connection.connectionId = "0400";
    connection-airport_from_id = 'FRA'.  " connection.airportFromId = "FRA";
    connection-airport_to_id   = 'JFK'.  " connection.airportToId = "JFK";

    flight-carrier_id    = 'LH'.
    flight-connection_id = '0400'.
    flight-flight_date   = cl_abap_context_info=>get_system_date( ).

    " Variante A
    flight_with_connection = CORRESPONDING #( connection ).
    flight_with_connection = CORRESPONDING #( BASE ( flight_with_connection ) flight ).

    CLEAR flight_with_connection.

    " Variante B
    flight_with_connection-carrier_id      = connection-carrier_id.
    flight_with_connection-connection_id   = connection-connection_id.
    flight_with_connection-airport_from_id = connection-airport_from_id.
    flight_with_connection-airport_to_id   = connection-airport_to_id.
    flight_with_connection-flight_date     = flight-flight_date.

    out->write( flight_with_connection ).
  ENDMETHOD.
ENDCLASS.
