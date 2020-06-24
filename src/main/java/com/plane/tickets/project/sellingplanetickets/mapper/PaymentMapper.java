package com.plane.tickets.project.sellingplanetickets.mapper;

import com.plane.tickets.project.sellingplanetickets.DTO.PaymentDTO;
import com.plane.tickets.project.sellingplanetickets.model.Payment;

public class PaymentMapper {


    public static PaymentDTO mapPaymentToDTO(Payment payment){
        PaymentDTO paymentDTO = new PaymentDTO();

        return paymentDTO
                .setId(payment.getId())
                .setAmount(payment.getAmount())
                .setEmail(payment.getEmail())
                .setMode(payment.getMode())
                .setName(payment.getName())
                .setMihpayId(payment.getMihpayId())
                .setProductInfo(payment.getProductInfo())
                .setPaymentDate(payment.getPaymentDate())
                .setPhone(payment.getPhone())
                .setPaymentStatus(payment.getPaymentStatus())
                .setTxnId(payment.getTxnId());
    }
}
