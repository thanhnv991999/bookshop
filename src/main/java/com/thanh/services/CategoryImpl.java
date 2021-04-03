package com.thanh.services;

import com.thanh.entity.Category;
import com.thanh.repository.CategoryRepository;
import com.thanh.services.Interface.CategoryIF;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryImpl implements CategoryIF {
    @Autowired
    CategoryRepository categoryRepository;
    @Override
    public List<Category> lists() {
        return (List<Category>) categoryRepository.findAll();
    }

    @Override
    public Optional<Category> findById(int id) {
        Optional<Category> category = categoryRepository.findById(id);
        return category;
    }

    @Override
    public void create(Category category) {
        categoryRepository.save(category);
    }

    @Override
    public void delete(int id) {
        categoryRepository.deleteById(id);
    }

    @Override
    public void update(Category category) {
        Category cate = categoryRepository.findById(category.getId()).get();
        cate.setCategoryName(category.getCategoryName());
        categoryRepository.save(cate);
    }
}
