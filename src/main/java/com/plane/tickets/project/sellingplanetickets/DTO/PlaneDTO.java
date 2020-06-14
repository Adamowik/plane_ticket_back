package com.plane.tickets.project.sellingplanetickets.DTO;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.plane.tickets.project.sellingplanetickets.model.Flight;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Accessors(chain = true)
public class PlaneDTO {

        private int planeID;
        private String planeName;
        private List<Flight> flights;

        public PlaneDTO(String planeName) {
            this.planeName = planeName;
        }

        @Override
        public String toString() {
            return "Plane{" +
                    "planeID=" + planeID +
                    ", planeName='" + planeName + '\'' +
                    '}';
        }
    }

