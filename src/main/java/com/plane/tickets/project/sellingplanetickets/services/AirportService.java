package com.plane.tickets.project.sellingplanetickets.services;

import com.plane.tickets.project.sellingplanetickets.DTO.AirportDTO;
import com.plane.tickets.project.sellingplanetickets.mapper.AirportMapper;
import com.plane.tickets.project.sellingplanetickets.model.Airport;
import com.plane.tickets.project.sellingplanetickets.repositories.AirportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AirportService {

    @Autowired
    AirportRepository airportRepository;


    public List<AirportDTO> getAllAirports() {
        List<Airport> airports = new ArrayList<>();
        airportRepository.findAll().forEach(airports::add);
        List<AirportDTO> airportDTOS = AirportMapper.mapAirportToAirportDTOList(airports);
        return airportDTOS;
    }

    public AirportDTO getAirport(int id) {
        Airport airport;
        airport = airportRepository.findById(id).get();
        AirportDTO airportDto = AirportMapper.mapAirportToAirportDTO(airport);
        return airportDto;
    }

    public void addAirport(AirportDTO airportDTO) {
        Airport airport = AirportMapper.mapDTOToAirport(airportDTO);
        airportRepository.save(airport);
    }

    public void updateAirport(AirportDTO airportDTO, int id) {
        Airport airport = AirportMapper.mapDTOToAirport(airportDTO);
        airportRepository.save(airport);
    }

    public void deleteAirport(int id) {
        airportRepository.deleteById(id);
    }


}
