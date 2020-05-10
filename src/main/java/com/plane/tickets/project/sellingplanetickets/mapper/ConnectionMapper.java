package com.plane.tickets.project.sellingplanetickets.mapper;

import com.plane.tickets.project.sellingplanetickets.DTO.ConnectionsDTO;
import com.plane.tickets.project.sellingplanetickets.model.Connections;

import java.util.List;
import java.util.stream.Collectors;

public class ConnectionMapper {


    public static List<ConnectionsDTO> mapConnectionToConnectionDTOList(List<Connections> connections) {

        return connections.stream().map(ConnectionMapper::getConnectionDTO).collect(Collectors.toList());
    }

    public static ConnectionsDTO mapConnectionToDTO(Connections connections) {
        return getConnectionDTO(connections);
    }

    public static Connections mapDTOToConnection(ConnectionsDTO connectionsDTO) {
        Connections connections = new Connections();

        connections.setConnectionID(connectionsDTO.getConnectionID());
        connections.setFlights(connectionsDTO.getFlights());
        connections.setArrivalAirport(connectionsDTO.getArrivalAirport());
        connections.setDepartureAirport(connectionsDTO.getDepartureAirport());

        return connections;
    }

    private static ConnectionsDTO getConnectionDTO(Connections connections) {
        ConnectionsDTO connectionsDTO = new ConnectionsDTO();

        connectionsDTO.setConnectionID(connections.getConnectionID())
                .setArrivalAirport(connections.getArrivalAirport())
                .setDepartureAirport(connections.getDepartureAirport())
                .setFlights(connections.getFlights());

        return connectionsDTO;
    }


}
