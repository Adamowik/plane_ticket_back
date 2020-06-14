package com.plane.tickets.project.sellingplanetickets.controllers;


import com.plane.tickets.project.sellingplanetickets.DTO.AirportDTO;
import com.plane.tickets.project.sellingplanetickets.model.Airport;
import com.plane.tickets.project.sellingplanetickets.services.AirportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class AirportController {

    @Autowired
    private AirportService airportService;

    @RequestMapping("/airports")
    public List<AirportDTO> getAllAirports() {
        return airportService.getAllAirports();
    }

    @RequestMapping("/airports/{id}")
    public AirportDTO getAirport(@PathVariable int id) {
        return airportService.getAirport(id);
    }

    @PostMapping(value = "/airports")
    public void addAirport(@RequestBody AirportDTO airport) {
        airportService.addAirport(airport);
    }

    @PutMapping(value = "/airports/{id}")
    public void updateAirport(@RequestBody AirportDTO airport, @PathVariable int id) {
        airportService.updateAirport(airport, id);
    }

    @DeleteMapping(value = "/airports/{id}")
    public void deleteAirport(@PathVariable int id) {
        airportService.deleteAirport(id);
    }

}
