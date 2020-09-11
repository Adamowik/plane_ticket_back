package com.plane.tickets.project.sellingplanetickets.DTO;

import com.plane.tickets.project.sellingplanetickets.model.Connections;
import com.plane.tickets.project.sellingplanetickets.model.Plane;
import com.plane.tickets.project.sellingplanetickets.model.Seats;
import com.plane.tickets.project.sellingplanetickets.model.Ticket;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.time.LocalDate;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Accessors(chain = true)
public class FlightDTO {

    private int flightID;
    private LocalDate departureDate;
    private String departureTime;
    private LocalDate arrivalDate;
    private String arrivalTime;
    private int ticketCost;
    private Connections connection;
    private Plane plane;
    private List<Ticket> tickets;
    private List<Seats> seats;


    @Override
    public String toString() {
        return "Flight{" +
                "flightID=" + flightID +
                ", connectionID=" +
                ", planeID=" +
                ", departureDate='" + departureDate + '\'' +
                ", departureTime='" + departureTime + '\'' +
                ", arrivalDate='" + arrivalDate + '\'' +
                ", arrivalTime='" + arrivalTime + '\'' +
                ", ticketCost=" + ticketCost +
                '}';
    }
}

