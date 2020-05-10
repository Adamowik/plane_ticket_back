package com.plane.tickets.project.sellingplanetickets.controllers;

import com.plane.tickets.project.sellingplanetickets.DTO.ConnectionsDTO;
import com.plane.tickets.project.sellingplanetickets.model.Connections;
import com.plane.tickets.project.sellingplanetickets.services.ConnectionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class ConnectionsController {
    @Autowired
    private ConnectionsService connectionsService;

    @RequestMapping("/connections")
    public List<ConnectionsDTO> getAllConnections() {
        return connectionsService.getAllConnections();
    }

    @RequestMapping("/connections/{id}")
    public ConnectionsDTO getConnections(@PathVariable int id) {
        return connectionsService.getConnections(id);
    }

    @RequestMapping("/arrivalairports/{id}/connections")
    public List<ConnectionsDTO> getAllArrivalAirportConnections(@PathVariable int id) {
        return connectionsService.getConnectionsByArrivalAirport(id);
    }

    @RequestMapping("/departureairports/{id}/connections")
    public List<ConnectionsDTO> getAllDepartureAirportConnections(@PathVariable int id) {
        return connectionsService.getConnectionsByDepartureAirport(id);
    }

}
