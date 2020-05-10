package com.plane.tickets.project.sellingplanetickets.DTO;

import com.plane.tickets.project.sellingplanetickets.model.Connections;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Accessors(chain = true)
public class AirportDTO {


    private int airportID;
    private String airportName;
    private List<Connections> arrivalConnections;
    private List<Connections> departureConnections;


    @Override
    public String toString() {
        return "Airport{" +
                "airportID=" + airportID +
                ", airportName='" + airportName + '\'' +
                '}';
    }
}


