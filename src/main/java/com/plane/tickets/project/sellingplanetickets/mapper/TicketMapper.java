package com.plane.tickets.project.sellingplanetickets.mapper;

import com.plane.tickets.project.sellingplanetickets.DTO.TicketDTO;
import com.plane.tickets.project.sellingplanetickets.model.Ticket;

import java.util.List;
import java.util.stream.Collectors;

public class TicketMapper {

    public static List<TicketDTO> mapTicketListoToDTO(List<Ticket> ticketList) {

        return ticketList.stream().map(ticket -> getTicket(ticket)).collect(Collectors.toList());
    }

    public static TicketDTO mapTicketToDTO(Ticket ticket) {

        return getTicket(ticket);
    }

    public static Ticket mapDTOToTicket(TicketDTO ticketDTO) {
        Ticket ticket = new Ticket();

        ticket.setTicketID(ticketDTO.getTicketID());
        ticket.setFlight(ticketDTO.getFlight());
        ticket.setCategory(ticketDTO.getCategory());
        ticket.setInsurance(ticketDTO.isInsurance());
        ticket.setName(ticketDTO.getName());
        ticket.setPesel(ticketDTO.getPesel());
        ticket.setPhonenumber(ticketDTO.getPhonenumber());
        ticket.setSurname(ticketDTO.getSurname());
        ticket.setPlace(ticketDTO.getPlace());
        ticket.setUser(ticketDTO.getUser());
        ticket.setTicketCost(ticketDTO.getTicketCost());
        ticket.setWhichRow(ticketDTO.getWhichRow());

        return ticket;
    }

    private static TicketDTO getTicket(Ticket ticket) {
        TicketDTO ticketDTO = new TicketDTO();

        ticketDTO
                .setTicketID(ticket.getTicketID())
                .setFlight(ticket.getFlight())
                .setCategory(ticket.getCategory())
                .setInsurance(ticket.isInsurance())
                .setName(ticket.getName())
                .setPesel(ticket.getPesel())
                .setPhonenumber(ticket.getPhonenumber())
                .setSurname(ticket.getSurname())
                .setPlace(ticket.getPlace())
                .setUser(ticket.getUser())
                .setTicketCost(ticket.getTicketCost())
                .setWhichRow(ticket.getWhichRow());

        return ticketDTO;
    }

}
