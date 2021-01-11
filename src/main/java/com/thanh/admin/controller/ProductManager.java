package com.thanh.admin.controller;

import com.thanh.convert.ProductConvert;
import com.thanh.services.ProductImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.thanh.entity.Product;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
public class ProductManager {
    @Autowired
    ProductImpl product;

    @RequestMapping("/admin/product/index")
    public String index(Model model){
        Product productDTO = new Product();
        List<Product> products = product.lists();
        model.addAttribute("productDTO",productDTO);
        model.addAttribute("listProduct",products);
        return "/admin/product/index";
    }

    @RequestMapping("/admin/product/create")
    public String create(@ModelAttribute("productDTO") Product productDTO, RedirectAttributes model){
        product.create(productDTO);
        model.addAttribute("mess","Thêm thành công");
        return  "redirect:/admin/product/index";
    }


    @RequestMapping("/admin/product/edit/{id}")
    public String edit(@PathVariable("id")int id, Model model){
        Optional<Product> prd = product.findById(id);
        Product productConvert = ProductConvert.prdConvert(prd);
        model.addAttribute("productDTO",productConvert);
        model.addAttribute("listProduct",product.lists());
        return "/admin/product/index";

    }

    @RequestMapping("/admin/product/update")
    public String update(@ModelAttribute("productDTO") Product productDTO, RedirectAttributes model, @RequestParam("img") String img) throws IOException {
        if(productDTO.getImage()==""){
            productDTO.setImage(img);
        }
        product.update(productDTO);
        model.addAttribute("mess","Cập nhật thành công");
        return  "redirect:/admin/product/edit/"+productDTO.getId();
    }

    @RequestMapping("/admin/product/delete/{id}")
    public String delete(@PathVariable("id") int id,RedirectAttributes model){
        product.delete(id);
        model.addAttribute("mess","Xóa thành công");
        return  "redirect:/admin/product/index";
    }
}
