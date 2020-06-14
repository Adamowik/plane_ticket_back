package com.plane.tickets.project.sellingplanetickets.services;

import com.plane.tickets.project.sellingplanetickets.DTO.ConnectionsDTO;
import com.plane.tickets.project.sellingplanetickets.mapper.ConnectionMapper;
import com.plane.tickets.project.sellingplanetickets.model.Connections;
import com.plane.tickets.project.sellingplanetickets.repositories.ConnectionsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ConnectionsService {
    @Autowired
    ConnectionsRepository connectionsRepository;

    public List<ConnectionsDTO> getAllConnections() {
        List<Connections> connections = new ArrayList<>();
        connectionsRepository.findAll().forEach(connections::add);
        List<ConnectionsDTO> connectionsDTOS = ConnectionMapper.mapConnectionToConnectionDTOList(connections);
        return connectionsDTOS;
    }


    public ConnectionsDTO getConnections(int id) {
        Connections connections = connectionsRepository.findById(id).get();
        return ConnectionMapper.mapConnectionToDTO(connections);
    }

    public void addConnections(ConnectionsDTO connectionsDTO) {
        Connections connections = ConnectionMapper.mapDTOToConnection(connectionsDTO);
        connectionsRepository.save(connections);
    }

    public void updateConnections(ConnectionsDTO connectionsDTO, int id) {
        Connections connections = ConnectionMapper.mapDTOToConnection(connectionsDTO);
        connectionsRepository.save(connections);
    }

    public void deleteConnections(int id) {
        connectionsRepository.deleteById(id);
    }

    public List<ConnectionsDTO> getConnectionsByArrivalAirport(int id) {
        List<Connections> connections = new ArrayList<>();
        connectionsRepository.findByArrivalAirportAirportID(id).forEach(connections::add);
        List<ConnectionsDTO> connectionsDTOS = ConnectionMapper.mapConnectionToConnectionDTOList(connections);
        return connectionsDTOS;
    }

    public List<ConnectionsDTO> getConnectionsByDepartureAirport(int id) {
        List<Connections> connections = new ArrayList<>();
        connectionsRepository.findByDepartureAirportAirportID(id).forEach(connections::add);
        List<ConnectionsDTO> connectionsDTOS = ConnectionMapper.mapConnectionToConnectionDTOList(connections);
        return connectionsDTOS;

    }

}
