package com.plane.tickets.project.sellingplanetickets.mapper;

import com.plane.tickets.project.sellingplanetickets.DTO.FlightDTO;
import com.plane.tickets.project.sellingplanetickets.model.Flight;

import java.util.List;
import java.util.stream.Collectors;

public class FlightMapper {

    public static List<FlightDTO> mapFlightToFlightDTOList(List<Flight> flights){

        return flights.stream().map(FlightMapper::getFlightDTO).collect(Collectors.toList());
    }



    public static FlightDTO mapFlightToDTO(Flight flight){

        return getFlightDTO(flight);
    }


    public static Flight mapDTOToFlight(FlightDTO flightDTO){
        Flight flight = new Flight();

        flight.setFlightID(flightDTO.getFlightID());
        flight.setArrivalDate(flightDTO.getArrivalDate());
        flight.setArrivalTime(flightDTO.getArrivalTime());
        flight.setDepartureDate(flightDTO.getDepartureDate());
        flight.setDepartureTime(flightDTO.getDepartureTime());
        flight.setPlane(flightDTO.getPlane());
        flight.setConnection(flightDTO.getConnection());
        flight.setTicketCost(flightDTO.getTicketCost());
        flight.setTickets(flightDTO.getTickets());
        flight.setSeats(flightDTO.getSeats());

        return flight;
    }

    private static FlightDTO getFlightDTO(Flight flight){
        FlightDTO flightDTO = new FlightDTO();

        flightDTO
                .setFlightID(flight.getFlightID())
                .setArrivalDate(flight.getArrivalDate())
                .setArrivalTime(flight.getArrivalTime())
                .setDepartureDate(flight.getDepartureDate())
                .setDepartureTime(flight.getDepartureTime())
                .setPlane(flight.getPlane())
                .setConnection(flight.getConnection())
                .setTicketCost(flight.getTicketCost())
                .setTickets(flight.getTickets())
                .setSeats(flight.getSeats());

        return flightDTO;
    }

}
