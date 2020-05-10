package com.plane.tickets.project.sellingplanetickets.DTO;

import com.plane.tickets.project.sellingplanetickets.model.Flight;
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
public class SeatsDTO {


    private int seatID;
    private int category;
    private int whichRow;
    private int place;
    private boolean isFree;
    private Flight flight;

    public SeatsDTO(int category, int whichRow, int place, boolean isFree, Flight flight) {
        this.category = category;
        this.whichRow = whichRow;
        this.place = place;
        this.isFree = isFree;
        this.flight = flight;
    }


}

