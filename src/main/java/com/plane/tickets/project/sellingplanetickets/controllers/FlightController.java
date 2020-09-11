package com.plane.tickets.project.sellingplanetickets.controllers;

import com.plane.tickets.project.sellingplanetickets.DTO.FlightDTO;
import com.plane.tickets.project.sellingplanetickets.services.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.Collection;
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


    @GetMapping("/flights/filtered")
    public Collection<FlightDTO> getFlights(
            @RequestParam final String departureAirport,
            @RequestParam final String arrivalAirport,
            @RequestParam final int category,
            @RequestParam final int passengersNumber,
            @RequestParam String departureDate
    ) {
        final LocalDate departureLocalDate = LocalDate.parse(departureDate);
        return this.flightService.getFlights(departureAirport, arrivalAirport, category, passengersNumber, departureLocalDate);
    }

    @RequestMapping("/flights/{id}")
    public FlightDTO getFlights(@PathVariable int id) {
        return flightService.getFlights(id);
    }

    @RequestMapping("/planes/{id}/flights")
    public List<FlightDTO> getAllFlightsByPlane(@PathVariable int id) {
        return flightService.getFlightsByPlane(id);
    }


    @RequestMapping("/connections/{id}/flights")
    public List<FlightDTO> getAllFlightsByConnection(@PathVariable int id){
        return flightService.getFlightsByConnection(id);
    }

    @PostMapping(value = "/flights")
    public void addFlight(@RequestBody FlightDTO flight) {
        flightService.addFlight(flight);
    }

    @PutMapping(value = "/flights/{id}")
    public void updateFlight(@RequestBody FlightDTO flight, @PathVariable int id) {
        flightService.updateFlight(flight, id);
    }

    @DeleteMapping(value = "/flights/{id}")
    public void deleteFlight(@PathVariable int id) {
        flightService.deleteFlight(id);
    }

}
