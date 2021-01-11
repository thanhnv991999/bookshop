package com.thanh.controller;

import com.thanh.entity.Customer;
import com.thanh.entity.Order;
import com.thanh.entity.OrderDetail;
import com.thanh.entity.Product;
import com.thanh.services.CartServices;
import com.thanh.services.OrderDetailImpl;
import com.thanh.services.OrderImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class OrderController {
    @Autowired
    HttpSession session;
    @Autowired
    CartServices cart;
    @Autowired
    OrderImpl orderService;
    @Autowired
    OrderDetailImpl orderDetailService;

    @GetMapping("/order/checkout")
    public String check(Model model,@ModelAttribute("form")Order order)
    {
        Customer cus = (Customer) session.getAttribute("user");
        order.setOrderDate(new Date());
        order.setCustomer(cus);
        order.setAmount(cart.getAmount());
        return "/order/checkout";
    }
    @PostMapping("/order/checkout")
    public String check(@ModelAttribute("form")Order order,Model model)
    {
        Collection<Product> products=cart.getItems();
        List<OrderDetail> orderDetails = new ArrayList<>();
        for(Product product : products){
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrder(order);
            orderDetail.setProduct(product);
            orderDetail.setPrice(product.getPrice());
            orderDetail.setQuantity(product.getQuantity());
            orderDetail.setDiscount(product.getDiscount());
            orderDetails.add(orderDetail);
        }
        order.setStatus(false);
        orderService.create(order);
        for(OrderDetail orderDetail:orderDetails){
            orderDetailService.createOrderDetails(orderDetail);
        }
        cart.clear();
        model.addAttribute("mess","Đặt Thành Công");
        return "redirect:/order/list";
    }

    @GetMapping("/order/list")
    public String listOrder(Model model){
        Customer cus = (Customer)session.getAttribute("user");
        List<Order> orders=orderService.findByUserId(cus.getId());
        model.addAttribute("listOrder",orders);
        return "/order/list";
    }

    @GetMapping("/order/item")
    public String orderItem(Model model){
        Customer cus = (Customer)session.getAttribute("user");
        List<Product> products=orderDetailService.findItemByUser(cus.getId());
        model.addAttribute("catePrd",products);
        return "/home/layout";
    }
    @GetMapping("/order/detail/{id}")
    public String orderDetail(@PathVariable("id") int id,Model model){
        Optional<Order> order=orderService.findById(id);
        List<OrderDetail> orderDetails = orderDetailService.findByOrder(order.get().getId());
        model.addAttribute("order",order);
        model.addAttribute("orderDetail",orderDetails);
        return "order/detail";
    }
}
