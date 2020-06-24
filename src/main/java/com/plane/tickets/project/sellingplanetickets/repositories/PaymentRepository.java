package com.plane.tickets.project.sellingplanetickets.repositories;

import com.plane.tickets.project.sellingplanetickets.model.Payment;
import com.plane.tickets.project.sellingplanetickets.model.Plane;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Integer> {

    Payment findByTxnId(String txnId);
}