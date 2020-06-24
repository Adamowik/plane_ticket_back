package com.plane.tickets.project.sellingplanetickets.services;

import com.plane.tickets.project.sellingplanetickets.DTO.PaymentDTO;
import com.plane.tickets.project.sellingplanetickets.model.*;
import com.plane.tickets.project.sellingplanetickets.payment.PaymentCallback;
import com.plane.tickets.project.sellingplanetickets.payment.PaymentDetail;
import com.plane.tickets.project.sellingplanetickets.payment.PaymentStatus;
import com.plane.tickets.project.sellingplanetickets.payment.PaymentUtil;
import com.plane.tickets.project.sellingplanetickets.repositories.PaymentRepository;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepo;

    public PaymentDetail proceedPayment(PaymentDetail paymentDetail) {
        PaymentUtil paymentUtil = new PaymentUtil();
        paymentDetail = paymentUtil.populatePaymentDetail(paymentDetail);
        savePaymentDetail(paymentDetail);
        return paymentDetail;
    }

    public String payuCallback(PaymentCallback paymentResponse) {
        String msg = "Transaction failed. Try once more";
        Payment payment = paymentRepo.findByTxnId(paymentResponse.getTxnid());
        if (payment != null) {
            PaymentStatus paymentStatus = null;
            if (paymentResponse.getStatus().equals("failure")) {
                paymentStatus = PaymentStatus.Failed;
            } else if (paymentResponse.getStatus().equals("success")) {
                paymentStatus = PaymentStatus.Success;
                msg = "Transaction success. Your ticket's have been send.";
            }
            payment.setPaymentStatus(paymentStatus);
            payment.setMihpayId(paymentResponse.getMihpayid());
            payment.setMode(paymentResponse.getMode());
            paymentRepo.save(payment);
        }
        return msg;
    }

    private void savePaymentDetail(PaymentDetail paymentDetail) {
        Payment payment = new Payment();
        payment.setAmount(Double.parseDouble(paymentDetail.getAmount()));
        payment.setEmail(paymentDetail.getEmail());
        payment.setName(paymentDetail.getName());
        payment.setPaymentDate(new Date());
        payment.setPaymentStatus(PaymentStatus.Pending);
        payment.setPhone(paymentDetail.getPhone());
        payment.setProductInfo(paymentDetail.getProductInfo());
        payment.setTxnId(paymentDetail.getTxnId());
        paymentRepo.save(payment);
    }
}
