package com.thanh.controller;

import com.thanh.bean.MailInfo;
import com.thanh.entity.Category;
import com.thanh.entity.Product;
import com.thanh.services.CategoryImpl;
import com.thanh.services.CookieService;
import com.thanh.services.MailService;
import com.thanh.services.ProductImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Optional;

@Controller
public class ProductController {
    @Autowired
    CategoryImpl category;
    @Autowired
    ProductImpl product;
    @Autowired
    CookieService cookie;
    @Autowired
    MailService mail;

    @RequestMapping("/product/category")
    public String cate(Model model, @RequestParam(value = "id") int id){
        Optional<Category> getCategory = category.findById(id);
        List<Product> products = getCategory.get().getProducts();
        model.addAttribute("catePrd",products);
        return "/home/layout";
    }

    @RequestMapping("/product/search")
    public String searchPrd(Model model,@RequestParam(value = "keywords") String name){
       List<Product> products= product.search(name);
       model.addAttribute("catePrd",products);
        return "/home/layout";
    }

    @RequestMapping("/product/details")
    public String prdDetail(Model model, @RequestParam(value = "id") int id){
        Optional<Product> productId = product.findById(id);
        Optional<Category> getCategory = category.findById(productId.get().getCategory().getId());
        List<Product> products = getCategory.get().getProducts();
        model.addAttribute("catePrd",products);
        model.addAttribute("productDetail",productId);
        return "/product/detail";
    }


    @ResponseBody
    @RequestMapping("/product/add-to-favo/{id}")
    public String addFavorite(Model model, @PathVariable("id") int id, HttpServletResponse response,    HttpServletRequest request) {
        Cookie favo = cookie.read("favo",request);
        String value= Integer.toString(id);
        if(favo!=null){
            value = favo.getValue();
            if(!value.contains(Integer.toString(id))){
                value+= ","+ Integer.toString(id);
            }
            else {
                return "f";
            }
        }
        cookie.create("favo",value,30,response);
        return "t";
    }

    @ResponseBody
    @RequestMapping("/product/send-to-email")
    public Boolean sendToMail(Model model,MailInfo info,HttpServletRequest request) {
        info.setSubject("Thông tin sách");
        try {
            String id =request.getParameter("id");
            String url = request.getRequestURL().toString().replace("send-to-email","details/?id="+id);
            info.setBody(info.getBody()+"<hr><a href='"+url+"'>Xem chi tiết...</a>");
            mail.send(info);
            return  true;
        }catch (Exception e){
            e.printStackTrace();
            System.out.println(e.getMessage());
            return false;
        }
    }

    @RequestMapping("/product/sell")
    public String sellALot(Model model){
        List<Product> products=product.SellALot();
        model.addAttribute("catePrd",products);
        return "/home/layout";
    }
    @RequestMapping("/product/view-a-lot")
    public String viewCount(Model model){
        List<Product> products=product.viewALot();
        model.addAttribute("catePrd",products);
        return "/home/layout";
    }
    @RequestMapping("/product/discount")
    public String discount(Model model){
        List<Product> products=product.discount();
        model.addAttribute("catePrd",products);
        return "/home/layout";
    }
}
