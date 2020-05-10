package com.plane.tickets.project.sellingplanetickets.services;

import com.plane.tickets.project.sellingplanetickets.DTO.SeatsDTO;
import com.plane.tickets.project.sellingplanetickets.mapper.SeatsMapper;
import com.plane.tickets.project.sellingplanetickets.repositories.SeatsRepository;
import com.plane.tickets.project.sellingplanetickets.model.Seats;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SeatsService {

    @Autowired
    SeatsRepository seatsRepository;

    public List<SeatsDTO> getAllSeats() {
        List<Seats> seats = new ArrayList<>();
        seatsRepository.findAll().forEach(seats::add);
        List<SeatsDTO> seatsDTOS = SeatsMapper.mapSeatListToDTO(seats);
        return seatsDTOS;
    }

    public List<SeatsDTO> getAllSeatsByFlight(int id) {
        List<Seats> seats = new ArrayList<>();
        seatsRepository.findByFlightFlightID(id).forEach(seats::add);
        List<SeatsDTO> seatsDTOS = SeatsMapper.mapSeatListToDTO(seats);
        return seatsDTOS;
    }

    public SeatsDTO getSeat(int id) {
        Seats seats = seatsRepository.findById(id).get();
        return SeatsMapper.mapSeatsToDTO(seats);
    }

}
