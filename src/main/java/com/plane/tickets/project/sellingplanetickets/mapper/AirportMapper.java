package com.plane.tickets.project.sellingplanetickets.mapper;

import com.plane.tickets.project.sellingplanetickets.DTO.AirportDTO;
import com.plane.tickets.project.sellingplanetickets.model.Airport;

import java.util.List;
import java.util.stream.Collectors;

public class AirportMapper {


    public static List<AirportDTO> mapAirportToAirportDTOList(List<Airport> airports){

        return airports.stream().map(airport -> getAirport(airport)).collect(Collectors.toList());
    }


    public static AirportDTO mapAirportToAirportDTO(Airport airport){

        return getAirport(airport);
    }

    public static Airport mapDTOToAirport(AirportDTO airportDTO){

        Airport airport = new Airport();

        airport.setAirportID(airportDTO.getAirportID());
        airport.setAirportName(airportDTO.getAirportName());
        airport.setArrivalConnections(airportDTO.getArrivalConnections());
        airport.setDepartureConnections(airportDTO.getDepartureConnections());

        return airport;
    }


    private static AirportDTO getAirport(Airport airport) {
        AirportDTO airportDTO = new AirportDTO();

        return airportDTO.setAirportID(airport.getAirportID())
                .setAirportName(airport.getAirportName())
                .setArrivalConnections(airport.getArrivalConnections())
                .setDepartureConnections(airport.getDepartureConnections());

    }
}
