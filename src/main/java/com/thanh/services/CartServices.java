package com.thanh.services;

import com.thanh.convert.ProductConvert;
import com.thanh.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@SessionScope
@Service
public class CartServices {
    @Autowired
    ProductImpl product;

    Map<Integer, Product> map = new HashMap<>();
    public void add(int id){
        Product p = map.get(id);
        Optional<Product> prConvert= product.findById(id);
        Product product = ProductConvert.prdConvert(prConvert);
        if(p==null){
            p=product;
            p.setQuantity(1);
            map.put(id,p);
        }else {
            p.setQuantity(p.getQuantity()+1);
        }
    }
    public void remove(int id){
        map.remove(id);
    }
    public void update(int id,int quantity){
        Product p = map.get(id);
        p.setQuantity(quantity);
    }
    public void clear(){
        map.clear();
    }

    public int getCount(){
        Collection<Product> ps = this.getItems();
        int count=0;
        for(Product product:ps){
            count+=product.getQuantity();
        }
        return count;
    }
    public double getAmount(){
        Collection<Product> ps = this.getItems();
        double Amount=0;
        for(Product product:ps){
            Amount+=((product.getQuantity() * product.getPrice())- ((product.getQuantity() * product.getPrice())/100*product.getDiscount()));
        }
        return Amount;
    }
    public Collection<Product>getItems(){
        return map.values();
    }
}
