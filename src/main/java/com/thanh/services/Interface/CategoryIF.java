package com.thanh.services.Interface;

import com.thanh.entity.Category;

import java.util.List;
import java.util.Optional;

public interface CategoryIF {
    public List<Category> lists();
    public Optional<Category> findById(int id);
    public void create(Category category);
    public void delete(int id);
    public void update(Category category);
}
