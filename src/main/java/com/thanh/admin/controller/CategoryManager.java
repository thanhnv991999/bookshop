package com.thanh.admin.controller;

import com.thanh.entity.Category;
import com.thanh.services.CategoryImpl;
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
public class CategoryManager {
    @Autowired
    CategoryImpl category;
    @RequestMapping("/admin/category/index")
    public String index(Model model){
        Category categoryDTO = new Category();
        List<Category> categories = category.lists();
        model.addAttribute("categoryDTO",categoryDTO);
        model.addAttribute("listCate",categories);
        return "/admin/category/index";
    }
    @RequestMapping("/admin/category/create")
    public String create(@ModelAttribute("categoryDTO") Category categoryDTO, RedirectAttributes model){
        category.create(categoryDTO);
        model.addAttribute("mess","Thêm thành công");
        return  "redirect:/admin/category/index";
    }


    @RequestMapping("/admin/category/edit/{id}")
    public String edit(@PathVariable("id")int id,Model model){
        Category cate = category.findById(id).get();
        model.addAttribute("categoryDTO",cate);
        model.addAttribute("listCate",category.lists());
        return "/admin/category/index";

    }

    @RequestMapping("/admin/category/update")
    public String update(@ModelAttribute("categoryDTO") Category categoryDTO, RedirectAttributes model){
        category.update(categoryDTO);
        model.addAttribute("mess","Cập nhật thành công");
        return  "redirect:/admin/category/edit/"+categoryDTO.getId();
    }

    @RequestMapping("/admin/category/delete/{id}")
    public String delete(@PathVariable("id") int id,RedirectAttributes model){
        category.delete(id);
        model.addAttribute("mess","Xóa thành công");
        return  "redirect:/admin/category/index";
    }


}
