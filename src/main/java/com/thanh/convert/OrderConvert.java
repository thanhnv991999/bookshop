package com.thanh.convert;

import com.thanh.entity.Order;

import java.util.Optional;

public class OrderConvert {
    public static Order orderConvert(Optional<Order> optional){
        Order order = new Order();
        order.setId(optional.get().getId());
        order.setStatus(optional.get().isStatus());
        order.setDescription(optional.get().getDescription());
        order.setAddress(optional.get().getAddress());
        order.setAmount(optional.get().getAmount());
        order.setOrderDate(optional.get().getOrderDate());
        order.setCustomer(optional.get().getCustomer());
        return order;
    }
}
