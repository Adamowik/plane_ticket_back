package com.plane.tickets.project.sellingplanetickets.controllers;

import com.plane.tickets.project.sellingplanetickets.DTO.TicketDTO;
import com.plane.tickets.project.sellingplanetickets.services.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class TicketController {
    @Autowired
    private TicketService ticketService;

    @RequestMapping("/tickets")
    public List<TicketDTO> getAllTickets() {
        return ticketService.getAllTickets();
    }

    @RequestMapping("/users/{id}/tickets")
    public List<TicketDTO> getAllTicketsByUser(@PathVariable int id) {
        return ticketService.getAllTicketsByUser(id);
    }

    @RequestMapping("/flights/{id}/tickets")
    public List<TicketDTO> getAllTicketsByFlight(@PathVariable int id) {
        return ticketService.getAllTicketsByFlight(id);
    }


    @RequestMapping("/tickets/{id}")
    public TicketDTO getTicket(@PathVariable int id) {
        return ticketService.getTicket(id);
    }

}
