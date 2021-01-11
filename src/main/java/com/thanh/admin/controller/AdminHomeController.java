package com.thanh.admin.controller;

import com.thanh.services.OrderImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminHomeController {
    @Autowired
    OrderImpl order;
    @RequestMapping("admin/index")
    public String index(Model model){
        model.addAttribute("orderList",order.lists());
        return "/admin/home/index";
    }
}
