package com.thanh.convert;

import com.thanh.entity.Category;

import java.util.Optional;

public class CategoryConvert {
    public static Category categoryConvert(Optional<Category> optional){
        Category category = new Category();
        category.setId(optional.get().getId());
        category.setCategoryName(optional.get().getCategoryName());
        return category;
    }
}
