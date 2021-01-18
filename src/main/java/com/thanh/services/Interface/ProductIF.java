package com.thanh.services.Interface;

import com.thanh.entity.Product;

import java.util.List;
import java.util.Optional;

public interface ProductIF {
    public List<Product> lists();
    public Optional<Product> findById(int id);
    public void create(Product product);
    public void delete(int id);
    public void update(Product product);
    public List<Product> search(String name);
    public List<Product>SellALot();
    public List<Product>viewALot();
    public List<Product>discount();
}
