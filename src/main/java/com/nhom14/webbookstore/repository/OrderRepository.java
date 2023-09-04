package com.nhom14.webbookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nhom14.webbookstore.entity.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

}
