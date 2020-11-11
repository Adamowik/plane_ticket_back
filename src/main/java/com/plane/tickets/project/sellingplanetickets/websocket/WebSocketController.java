package com.plane.tickets.project.sellingplanetickets.websocket;

import com.plane.tickets.project.sellingplanetickets.DTO.SeatsDTO;
import com.plane.tickets.project.sellingplanetickets.services.SeatsService;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class WebSocketController {
    private final SeatsService seatsService;

    public WebSocketController(SeatsService seatsService) {
        this.seatsService = seatsService;
    }

    @MessageMapping("/send/message")
    @SendTo("/seats/reserved")
    public SeatsDTO greeting(SeatsDTO seat) {
        this.seatsService.addSeat(seat);
        System.out.println(seat.toString());
        return seat;
    }
}
