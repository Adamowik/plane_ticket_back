package com.plane.tickets.project.sellingplanetickets.services;

import com.plane.tickets.project.sellingplanetickets.DTO.FlightDTO;
import com.plane.tickets.project.sellingplanetickets.mapper.FlightMapper;
import com.plane.tickets.project.sellingplanetickets.model.Flight;
import com.plane.tickets.project.sellingplanetickets.repositories.FlightRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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


    public FlightDTO getFlight(int id) {
        Flight flight = flightRepository.findById(id).get();
        return FlightMapper.mapFlightToDTO(flight);
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
}
