package com.plane.tickets.project.sellingplanetickets.services;

import com.plane.tickets.project.sellingplanetickets.DTO.TicketDTO;
import com.plane.tickets.project.sellingplanetickets.mapper.TicketMapper;
import com.plane.tickets.project.sellingplanetickets.repositories.TicketRepository;
import com.plane.tickets.project.sellingplanetickets.model.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TicketService {

    @Autowired
    TicketRepository ticketRepository;

    public List<TicketDTO> getAllTickets() {
        List<Ticket> tickets = new ArrayList<>();
        ticketRepository.findAll().forEach(tickets::add);
        List<TicketDTO> ticketDTOS = TicketMapper.mapTicketListoToDTO(tickets);
        return ticketDTOS;
    }

    public List<TicketDTO> getAllTicketsByUser(int userId) {
        List<Ticket> tickets = new ArrayList<>();
        ticketRepository.findByUserId(userId).forEach(tickets::add);
        List<TicketDTO> ticketDTOS = TicketMapper.mapTicketListoToDTO(tickets);
        return ticketDTOS;
    }


    public TicketDTO getTicket(int id) {
        Ticket ticket = ticketRepository.findById(id).get();
        return TicketMapper.mapTicketToDTO(ticket);
    }

    public List<TicketDTO> getAllTicketsByFlight(int id) {
        List<Ticket> tickets = new ArrayList<>();
        ticketRepository.findByFlightFlightID(id).forEach(tickets::add);
        List<TicketDTO> ticketDTOS = TicketMapper.mapTicketListoToDTO(tickets);
        return ticketDTOS;
    }
}
