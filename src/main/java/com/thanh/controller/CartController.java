package com.thanh.controller;

import com.thanh.services.CartServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CartController {
    @Autowired
    CartServices cart;

    @ResponseBody
    @RequestMapping("/cart/add/{id}")
    public Object add(@PathVariable("id") int id) {
        cart.add(id);
        Object[] info = {cart.getCount(),cart.getAmount()};
        return info;
    }

    @RequestMapping("/cart/view")
    public String view(){
        return "/cart/view";
    }

    @ResponseBody
    @RequestMapping("/cart/clear")
    public void clear(){
        cart.clear();
    }

    @ResponseBody
    @RequestMapping("/cart/remove/{id}")
    public Object remove(@PathVariable("id") int id){
        cart.remove(id);
        Object[] info = {cart.getCount(),cart.getAmount()};
        return info;
    }

    @ResponseBody
    @RequestMapping("/cart/update/{id}/{qty}")
    public Object remove(@PathVariable("id") int id, @PathVariable("qty") int qty){
        cart.update(id,qty);
        Object[] info = {cart.getCount(),cart.getAmount()};
        return info;
    }
}

