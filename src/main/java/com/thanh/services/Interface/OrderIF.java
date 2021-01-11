package com.thanh.services.Interface;

import com.thanh.entity.Customer;
import com.thanh.entity.Order;

import java.util.List;
import java.util.Optional;

public interface OrderIF {
    public List<Order> lists();
    public Optional<Order> findById(int id);
    public void create(Order order);
    public void delete(int id);
    public void update(Order order);

    //truyen userID
    public List<Order> findByUserId(int id);
}
