package com.plane.tickets.project.sellingplanetickets.services;


import com.plane.tickets.project.sellingplanetickets.DTO.PlaneDTO;
import com.plane.tickets.project.sellingplanetickets.mapper.PlaneMapper;
import com.plane.tickets.project.sellingplanetickets.model.Plane;
import com.plane.tickets.project.sellingplanetickets.repositories.PlaneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PlaneService {

    @Autowired
    PlaneRepository planeRepository;

    public List<PlaneDTO> getAllPlanes() {
        List<Plane> planes = new ArrayList<>();
        planeRepository.findAll().forEach(planes::add);
        List<PlaneDTO> planeDTOS = PlaneMapper.mapPlaneListToDTO(planes);
        return planeDTOS;
    }


    public PlaneDTO getPlane(int id) {
        Plane plane =  planeRepository.findById(id).get();
        return PlaneMapper.mapPlaneToDTO(plane);
    }

    public void addPlane(PlaneDTO planeDTO) {
        Plane plane = PlaneMapper.mapDTOToPlane(planeDTO);
        planeRepository.save(plane);
    }

    public void updatePlane(PlaneDTO planeDTO, int id) {
        Plane plane = PlaneMapper.mapDTOToPlane(planeDTO);
        planeRepository.save(plane);
    }

    public void deletePlane(int id) {
        planeRepository.deleteById(id);
    }


}
