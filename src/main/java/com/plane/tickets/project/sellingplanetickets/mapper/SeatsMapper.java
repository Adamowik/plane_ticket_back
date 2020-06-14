package com.plane.tickets.project.sellingplanetickets.mapper;

import com.plane.tickets.project.sellingplanetickets.DTO.SeatsDTO;
import com.plane.tickets.project.sellingplanetickets.model.Seats;

import java.util.List;
import java.util.stream.Collectors;

public class SeatsMapper {


    public static List<SeatsDTO> mapSeatListToDTO(List<Seats> seatsList){

        return seatsList.stream().map(SeatsMapper::getSeatsDTO).collect(Collectors.toList());
    }

    public static SeatsDTO mapSeatsToDTO(Seats seats){

        return getSeatsDTO(seats);
    }

    public static Seats mapDTOtoSeats(SeatsDTO seatsDTO){
        Seats seats = new Seats();

        seats.setSeatID(seatsDTO.getSeatID());
        seats.setFlight(seatsDTO.getFlight());
        seats.setCategory(seatsDTO.getCategory());
        seats.setPlace(seatsDTO.getPlace());
        seats.setFree(seatsDTO.isFree());
        seats.setWhichRow(seatsDTO.getWhichRow());

        return seats;

    }

    private static SeatsDTO getSeatsDTO(Seats seats){

        SeatsDTO seatsDTO = new SeatsDTO();

        return seatsDTO
                .setSeatID(seats.getSeatID())
                .setFlight(seats.getFlight())
                .setCategory(seats.getCategory())
                .setPlace(seats.getPlace())
                .setFree(seats.isFree())
                .setWhichRow(seats.getWhichRow());

    }
}
