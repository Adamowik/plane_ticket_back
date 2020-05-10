package com.plane.tickets.project.sellingplanetickets.DTO;

import com.plane.tickets.project.sellingplanetickets.model.Flight;
import com.plane.tickets.project.sellingplanetickets.model.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Accessors(chain = true)
public class TicketDTO {


    private int ticketID;
    private String name;
    private String surname;
    private double ticketCost;
    private String category;
    private int whichRow;
    private int place;
    private boolean insurance;
    private User user;
    private Flight flight;
    private String phonenumber;
    private String pesel;


    public TicketDTO(String name, String surname, double ticketCost, String category, int whichRow, int place, boolean insurance, User user, Flight flight, String phonenumber, String pesel) {
        this.name = name;
        this.surname = surname;
        this.ticketCost = ticketCost;
        this.category = category;
        this.whichRow = whichRow;
        this.place = place;
        this.insurance = insurance;
        this.user = user;
        this.flight = flight;
        this.phonenumber = phonenumber;
        this.pesel = pesel;
    }

}
