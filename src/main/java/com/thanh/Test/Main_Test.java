package com.thanh.Test;

import com.thanh.entity.Product;
import com.thanh.services.ProductImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class Main_Test {
    public static void main(String[] args) {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("beansConfig.xml");
//        ProductImpl product = (ProductImpl) applicationContext.getBean("productImpl");
//        List<Product> products=product.search("tr");
    }
}
