package com.plane.tickets.project.sellingplanetickets.services;

import com.plane.tickets.project.sellingplanetickets.DTO.FlightDTO;
import com.plane.tickets.project.sellingplanetickets.mapper.FlightMapper;
import com.plane.tickets.project.sellingplanetickets.model.Flight;
import com.plane.tickets.project.sellingplanetickets.model.Seats;
import com.plane.tickets.project.sellingplanetickets.repositories.FlightRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class FlightService {

    @Autowired
    FlightRepository flightRepository;

    public List<FlightDTO> getAllFlights() {
        List<Flight> flights = new ArrayList<>();
        flightRepository.findAll().forEach(flights::add);
        List<FlightDTO> flightDTOS = FlightMapper.mapFlightToFlightDTOList(flights);
        return flightDTOS;
    }


    public FlightDTO getFlights(int id) {
        Flight flight = flightRepository.findById(id).get();
        return FlightMapper.mapFlightToDTO(flight);
    }

    public void addFlight(FlightDTO flightDTO) {
        Flight flight = FlightMapper.mapDTOToFlight(flightDTO);
        flightRepository.save(flight);
    }

    public void updateFlight(FlightDTO flightDTO, int id) {
        Flight flight = FlightMapper.mapDTOToFlight(flightDTO);
        flightRepository.save(flight);
    }

    public void deleteFlight(int id) {
        flightRepository.deleteById(id);
    }

    public List<FlightDTO> getFlightsByPlane(int id) {
        List<Flight> flights = new ArrayList<>();
        flightRepository.findByPlanePlaneID(id).forEach(flights::add);
        List<FlightDTO> flightDTOS = FlightMapper.mapFlightToFlightDTOList(flights);
        return flightDTOS;
    }

    public List<FlightDTO> getFlightsByConnection(int id) {
        List<Flight> flights = new ArrayList<>();
        flightRepository.findByConnectionConnectionID(id).forEach(flights::add);
        List<FlightDTO> flightDTOS = FlightMapper.mapFlightToFlightDTOList(flights);
        return flightDTOS;
    }

    public List<FlightDTO> getFlights(String departureAirport, String arrivalAirport, int category, int passengersNumber, LocalDate departureDate) {
        List<Flight> flights = flightRepository.findAll();
        return FlightMapper.mapFlightToFlightDTOList(
                flights
                        .stream()
                        .filter(flight -> flight.getDepartureDate().isEqual(departureDate))
                        .filter(flight -> flight.getConnection().getArrivalAirport().getAirportName().equalsIgnoreCase(arrivalAirport))
                        .filter(flight -> flight.getConnection().getDepartureAirport().getAirportName().equalsIgnoreCase(departureAirport))
                        .filter(flight -> flight.getSeats().stream().filter(Seats::isFree).count() > passengersNumber)
                        .filter(flight -> flight.getSeats().stream().anyMatch(seats -> seats.getCategory() == category))
                        .collect(Collectors.toList())
        );

    }
}
