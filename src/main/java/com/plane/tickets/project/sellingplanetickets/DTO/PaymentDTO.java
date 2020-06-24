package com.plane.tickets.project.sellingplanetickets.DTO;

import com.plane.tickets.project.sellingplanetickets.payment.PaymentMode;
import com.plane.tickets.project.sellingplanetickets.payment.PaymentStatus;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Accessors(chain = true)
public class PaymentDTO {


    private int id;
    private String email;
    private String name;
    private String phone;
    private String productInfo;
    private Double amount;
    private PaymentStatus paymentStatus;
    private Date paymentDate;
    private String txnId;
    private String mihpayId;
    private PaymentMode mode;

}
