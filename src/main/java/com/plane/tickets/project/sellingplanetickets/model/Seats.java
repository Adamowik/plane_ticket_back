package com.plane.tickets.project.sellingplanetickets.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.time.LocalDateTime;

@Entity
@Table(name = "seats")
@Getter
@Setter
public class Seats {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "seat_id")
    private int seatID;


    @Column(name = "category")
    private int category;

    @Column(name = "which_row")
    private int whichRow;

    @Column(name = "place")
    private int place;

    @Column(name = "is_free")
    private boolean isFree;

    @Column(name = "temporarily_reservation_time")
    private LocalDateTime temporarilyReservationTime;


    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "flight_id")
    private Flight flight;

    public Seats() {

    }

    public Seats(int category, int whichRow, int place, boolean isFree, Flight flight) {
        this.category = category;
        this.whichRow = whichRow;
        this.place = place;
        this.isFree = isFree;
        this.flight = flight;
    }
}
