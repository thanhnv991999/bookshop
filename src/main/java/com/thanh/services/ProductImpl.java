package com.thanh.services;
import com.thanh.entity.Product;
import com.thanh.repository.ProductRepository;
import com.thanh.services.Interface.ProductIF;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductImpl implements ProductIF {
    @Autowired
    ProductRepository productRepository;
    @Override
    public List<Product> lists() {
        return (List<Product>) productRepository.findAll();
    }

    @Override
    public Optional<Product> findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public void create(Product product) {
        productRepository.save(product);
    }

    @Override
    public void delete(int id) {
        productRepository.deleteById(id);
    }

    @Override
    public void update(Product product) {
        Product prd = productRepository.findById(product.getId()).get();
        prd.setImage(product.getImage());
        prd.setAvailable(product.isAvailable());
        prd.setSpecial(product.isSpecial());
        prd.setDiscount(product.getDiscount());
        prd.setQuantity(product.getQuantity());
        prd.setViewCount(product.getViewCount());
        prd.setPrice(product.getPrice());
        prd.setName(product.getName());
        prd.setDescription(product.getDescription());
        prd.setCategory(product.getCategory());
        productRepository.save(prd);
    }
    @Override
    public List<Product> search(String name) {
        return productRepository.getBySearch(name);
    }
    @Override
    public List<Product> SellALot() {
        return productRepository.sellALot();
    }

    @Override
    public List<Product> viewALot() {
        return productRepository.viewCount();
    }

    @Override
    public List<Product> discount() {
        return productRepository.discount();
    }

}
