package com.thanh.services;

import com.thanh.repository.OrderDetailRepository;
import com.thanh.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatisticalServices {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    OrderDetailRepository orderDetailRepository;
    public List<Object[]> inventory(){
        return productRepository.inventory();
    }
    public List<Object[]> revenueCategory(){
        return orderDetailRepository.revenueCategory();
    }
    public List<Object[]> revenueMonth(){
        return orderDetailRepository.revenueMonth();
    }
}
