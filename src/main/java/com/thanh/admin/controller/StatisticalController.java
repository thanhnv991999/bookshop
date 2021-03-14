package com.thanh.admin.controller;

import com.thanh.services.StatisticalServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatisticalController {
    @Autowired
    StatisticalServices statistical;
    @RequestMapping("/admin/report/inventory")
    public String inventory(Model model){
        model.addAttribute("data",statistical.inventory());
        return "/admin/report/inventory";
    }
    @RequestMapping("/admin/report/revenue-category")
    public String revenueByCategory(Model model){
        model.addAttribute("data",statistical.revenueCategory());
        return "/admin/report/revenue-category";
    }

    @RequestMapping("/admin/report/revenue-month")
    public String revenueByMonth(Model model){
        model.addAttribute("data",statistical.revenueMonth());
        return "/admin/report/revenue-month";
    }
}
