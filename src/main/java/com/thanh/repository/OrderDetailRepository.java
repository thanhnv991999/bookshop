package com.thanh.repository;

import com.thanh.entity.OrderDetail;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface OrderDetailRepository extends CrudRepository<OrderDetail,Integer> {
    @Query("select o.product.category.categoryName, sum(o.quantity),sum(o.quantity * o.price) ,min (o.price),max (o.price),avg (o.price)" +
            "from OrderDetail o group by o.product.category.categoryName")
    List<Object[]> revenueCategory();

    @Query(nativeQuery=true,value="select month(o.orderDate),sum(d.quantity),sum(d.price * d.quantity)"+
            "from orderdetails d join orders o on o.id=d.orderId group by month(o.orderDate)")
    List<Object[]> revenueMonth();
}
