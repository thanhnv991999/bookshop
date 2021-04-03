package com.thanh.admin.controller;

import com.thanh.entity.Customer;
import com.thanh.services.CustomerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
public class CustomerManager {
    @Autowired
    CustomerImpl customer;
    @RequestMapping("/admin/customer/index")
    public String index(Model model){
        Customer customerDTO = new Customer();
        List<Customer> customers = customer.lists();
        model.addAttribute("customerDTO",customerDTO);
        model.addAttribute("listCustomer",customers);
        return "/admin/customer/index";
    }

    @RequestMapping("/admin/customer/create")
    public String create(@ModelAttribute("customerDTO") Customer CustomerDTO, RedirectAttributes model){
        customer.create(CustomerDTO);
        model.addAttribute("mess","Thêm thành công");
        return  "redirect:/admin/customer/index";
    }


    @RequestMapping("/admin/customer/edit/{id}")
    public String edit(@PathVariable("id")int id, Model model){
        Customer cus = customer.findById(id).get();
        model.addAttribute("customerDTO",cus);
        model.addAttribute("listCustomer",customer.lists());
        return "/admin/customer/index";

    }

    @RequestMapping("/admin/customer/update")
    public String update(@ModelAttribute("customerDTO") Customer CustomerDTO, RedirectAttributes model){
        customer.update(CustomerDTO);
        model.addAttribute("mess","Cập nhật thành công");
        return  "redirect:/admin/customer/edit/"+CustomerDTO.getId();
    }

    @RequestMapping("/admin/customer/delete/{id}")
    public String delete(@PathVariable("id") int id,RedirectAttributes model){
        customer.delete(id);
        model.addAttribute("mess","Xóa thành công");
        return  "redirect:/admin/customer/index";
    }


}

