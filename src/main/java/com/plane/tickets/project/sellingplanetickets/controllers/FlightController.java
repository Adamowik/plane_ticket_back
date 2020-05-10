package com.plane.tickets.project.sellingplanetickets.controllers;

import com.plane.tickets.project.sellingplanetickets.DTO.FlightDTO;
import com.plane.tickets.project.sellingplanetickets.model.Flight;
import com.plane.tickets.project.sellingplanetickets.services.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class FlightController {

    @Autowired
    private FlightService flightService;


    @RequestMapping("/flights")
    public List<FlightDTO> getAllFlights() {
        return flightService.getAllFlights();
    }

    @RequestMapping("/flights/{id}")
    public FlightDTO getFlights(@PathVariable int id) {
        return flightService.getFlight(id);
    }

    @RequestMapping("/planes/{id}/flights")
    public List<FlightDTO> getAllFlightsByPlane(@PathVariable int id) {
        return flightService.getFlightsByPlane(id);
    }

}
