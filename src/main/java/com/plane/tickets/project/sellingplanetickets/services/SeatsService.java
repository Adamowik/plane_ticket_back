package com.plane.tickets.project.sellingplanetickets.services;

import com.plane.tickets.project.sellingplanetickets.DTO.SeatsDTO;
import com.plane.tickets.project.sellingplanetickets.mapper.SeatsMapper;
import com.plane.tickets.project.sellingplanetickets.model.Seats;
import com.plane.tickets.project.sellingplanetickets.model.Ticket;
import com.plane.tickets.project.sellingplanetickets.repositories.SeatsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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

    public void addSeat(SeatsDTO seatsDTO) {
        Seats seats = SeatsMapper.mapDTOtoSeats(seatsDTO);
        seatsRepository.save(seats);
    }

    public void reserveSeat(SeatsDTO seatsDTO) {
        Seats seats = SeatsMapper.mapDTOToSeatsForReservation(seatsDTO);
        seatsRepository.save(seats);
    }

    public void deleteSeat(int id) {
        seatsRepository.deleteById(id);
    }

    @Scheduled(fixedRate = 30000)
    public void makeReservedSeatsFreeIfThereIsNoTicketForThisSeat() {
        List<Seats> seatsWithNoTickets = seatsRepository
                .findAll()
                .stream()
                .filter(seats -> {
                    Optional<LocalDateTime> tempReservationTime = Optional.ofNullable(seats.getTemporarilyReservationTime());
                    if (tempReservationTime.isPresent()) {
                        return tempReservationTime.get().isAfter(LocalDateTime.now().minusHours(1));
                    }
                    return false;
                })
                .filter(seats -> !seats.isFree())
                .filter(seats -> {
                    int rowNumber, placeNumber;
                    rowNumber = seats.getWhichRow();
                    placeNumber = seats.getPlace();

                    Optional<Ticket> availableTicket = seats
                            .getFlight()
                            .getTickets()
                            .stream()
                            .filter(ticket -> ticket.getPlace() == placeNumber && ticket.getWhichRow() == rowNumber)
                            .findAny();
                    if (!availableTicket.isPresent()) {
                        seats.setFree(Boolean.TRUE);
                        return true;
                    } else return false;
                })
                .collect(Collectors.toList());
        this.seatsRepository.saveAll(seatsWithNoTickets);
    }

}
