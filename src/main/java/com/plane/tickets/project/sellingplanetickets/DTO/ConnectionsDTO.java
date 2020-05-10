package com.plane.tickets.project.sellingplanetickets.DTO;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.plane.tickets.project.sellingplanetickets.model.Airport;
import com.plane.tickets.project.sellingplanetickets.model.Flight;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Accessors(chain = true)
public class ConnectionsDTO {

    private int connectionID;
    private List<Flight> flights;
    private Airport departureAirport;
    private Airport arrivalAirport;


    @Override
    public String toString() {
        return "Connections{" +
                "connectionID=" + connectionID +
                ", departureAirportID=" +
                ", arrivalAirportID=" +
                ", flightTime='" + '\'' +
                ", ticketCost=" +
                '}';
    }
}

