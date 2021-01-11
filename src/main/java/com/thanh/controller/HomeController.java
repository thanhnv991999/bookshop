package com.thanh.controller;

import com.thanh.entity.Category;
import com.thanh.entity.Product;
import com.thanh.services.CategoryImpl;
import com.thanh.services.ProductImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
public class HomeController {
    @Autowired
    CategoryImpl category;
    @Autowired
    ProductImpl product;

    @RequestMapping("/home/index")
    public String index(Model model){
        List<Product> products = product.lists();
        model.addAttribute("catePrd",products);
        return "/home/layout";
    }
    @RequestMapping("/home/about")
    public String about(Model model){
        return "/home/about";
    }
    @RequestMapping("/home/contact")
    public String contact(){
        return "/home/contact";
    }
    @RequestMapping("/home/feedback")
    public String feedback(){
        return "/home/feedback";
    }
    @RequestMapping("/home/faq")
    public String faq(){
        return "/home/faq";
    }

    @GetMapping(value = "/403")
    public ModelAndView accesssDenied() {

        ModelAndView model = new ModelAndView();

        //check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            System.out.println(userDetail);

            model.addObject("username", userDetail.getUsername());

        }

        model.setViewName("403");
        return model;

    }

}
