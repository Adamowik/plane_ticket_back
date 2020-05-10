package com.plane.tickets.project.sellingplanetickets.controllers;

import com.plane.tickets.project.sellingplanetickets.DTO.SeatsDTO;
import com.plane.tickets.project.sellingplanetickets.model.Seats;
import com.plane.tickets.project.sellingplanetickets.services.SeatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class SeatsController {

    @Autowired
    private SeatsService seatsService;


    @RequestMapping("/seats")
    public List<SeatsDTO> getAllSeats() {
        return seatsService.getAllSeats();
    }

    @RequestMapping("/flights/{id}/seats")
    public List<SeatsDTO> getAllSeatsByFlight(@PathVariable int id) {
        return seatsService.getAllSeatsByFlight(id);
    }


    @RequestMapping("/seats/{id}")
    public SeatsDTO getSeats(@PathVariable int id) {
        return seatsService.getSeat(id);
    }

}
