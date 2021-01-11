package com.thanh.services;

import com.thanh.entity.Order;
import com.thanh.repository.OrderRepository;
import com.thanh.services.Interface.OrderIF;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class OrderImpl implements OrderIF {
    @Autowired
    OrderRepository orderRepository;
    @Override
    public List<Order> lists() {
        return (List<Order>) orderRepository.findAll();
    }

    @Override
    public Optional<Order> findById(int id) {
        return orderRepository.findById(id);
    }

    @Override
    public void create(Order order) {
        orderRepository.save(order);
    }

    @Override
    public void delete(int id) {
        orderRepository.deleteById(id);
    }

    @Override
    public void update(Order order) {

    }

    @Override
    public List<Order> findByUserId(int id) {
        List<Order> orders = (List<Order>) orderRepository.findAll();
        List<Order>list = new ArrayList<>();
        for(Order order:orders){
            if(order.getCustomer().getId()==id){
                list.add(order);
            }
        }
        return list;
    }
}
