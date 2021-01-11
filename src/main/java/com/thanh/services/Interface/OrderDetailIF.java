package com.thanh.services.Interface;

import com.thanh.entity.OrderDetail;
import com.thanh.entity.Product;

import java.util.List;

public interface OrderDetailIF {
    public void createOrderDetails(OrderDetail orderDetail);
    public List<OrderDetail> findByOrder(int id);

    //truyen userId
    public List<Product> findItemByUser(int id);
}
