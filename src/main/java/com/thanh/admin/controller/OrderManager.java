package com.thanh.admin.controller;

import com.thanh.convert.OrderConvert;
import com.thanh.entity.Order;
import com.thanh.entity.OrderDetail;
import com.thanh.services.OrderDetailImpl;
import com.thanh.services.OrderImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@Controller
public class OrderManager {
    @Autowired
    OrderImpl order;
    @Autowired
    OrderDetailImpl orderDetail;
    @RequestMapping("/admin/order/index")
    public String order(Model model){
        List<Order> orderList=order.lists();
        model.addAttribute("orderList",orderList);
        return "/admin/order/index";
    }
    @RequestMapping("/admin/order/detail/{id}")
    public String order(Model model, @PathVariable("id") int id){
        List<OrderDetail> orderDetails = orderDetail.findByOrder(id);
        model.addAttribute("orderDetails",orderDetails);
        model.addAttribute("orderList",order.lists());
        return "/admin/order/index";
    }
    @RequestMapping("/admin/order/status/{id}")
    public String status(Model model,@PathVariable("id") int id){
        Optional<Order> or= order.findById(id);
        Order orderConver = OrderConvert.orderConvert(or);
        orderConver.setStatus(true);
        order.create(orderConver);
        model.addAttribute("orderList",order.lists());
        return "/admin/order/index";
    }
}
