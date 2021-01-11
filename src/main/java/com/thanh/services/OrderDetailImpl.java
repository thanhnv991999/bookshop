package com.thanh.services;


import com.thanh.entity.OrderDetail;
import com.thanh.entity.Product;
import com.thanh.repository.OrderDetailRepository;
import com.thanh.services.Interface.OrderDetailIF;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class OrderDetailImpl implements OrderDetailIF {
    @Autowired
    OrderDetailRepository orderDetailRepository;
    @Override
    public void createOrderDetails(OrderDetail orderDetail) {
        orderDetailRepository.save(orderDetail);
    }

    @Override
    public List<OrderDetail> findByOrder(int id) {
        List<OrderDetail> orderDetails = (List<OrderDetail>) orderDetailRepository.findAll();
        List<OrderDetail>list = new ArrayList<>();
        for(OrderDetail orderDetail:orderDetails){
            if(orderDetail.getOrder().getId()==id){
                list.add(orderDetail);
            }
        }
        return list;
    }

    @Override
    public List<Product> findItemByUser(int id) {
        List<OrderDetail> orderDetails= (List<OrderDetail>) orderDetailRepository.findAll();
        List<Product> products = new ArrayList<>();
        for(OrderDetail orderDetail:orderDetails){
            if(orderDetail.getOrder().getCustomer().getId()==id){
                products.add(orderDetail.getProduct());
            }
        }
        return products;
    }
}
