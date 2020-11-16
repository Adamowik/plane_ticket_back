package com.plane.tickets.project.sellingplanetickets;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;


@SpringBootApplication
@EnableScheduling
public class PlaneTicketSellingProjectApplication {

    public static void main(String[] args) {
        SpringApplication.run(PlaneTicketSellingProjectApplication.class, args);


    }
}
