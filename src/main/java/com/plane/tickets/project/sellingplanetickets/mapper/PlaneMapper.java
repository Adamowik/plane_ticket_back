package com.plane.tickets.project.sellingplanetickets.mapper;

import com.plane.tickets.project.sellingplanetickets.DTO.PlaneDTO;
import com.plane.tickets.project.sellingplanetickets.model.Plane;

import java.util.List;
import java.util.stream.Collectors;

public class PlaneMapper {

    public static List<PlaneDTO> mapPlaneListToDTO(List<Plane> planes) {

        return planes.stream().map(plane -> getPlane(plane)).collect(Collectors.toList());
    }

    public static PlaneDTO mapPlaneToDTO(Plane plane) {


        return getPlane(plane);
    }

    public static Plane mapDTOToPlane(PlaneDTO planeDTO) {
        Plane plane = new Plane();

        plane.setPlaneID(planeDTO.getPlaneID());
        plane.setPlaneName(planeDTO.getPlaneName());
        plane.setFlights(planeDTO.getFlights());

        return plane;

    }


    private static PlaneDTO getPlane(Plane plane) {
        PlaneDTO planeDTO = new PlaneDTO();

        return planeDTO
                .setPlaneID(plane.getPlaneID())
                .setPlaneName(plane.getPlaneName())
                .setFlights(plane.getFlights());

    }

}
