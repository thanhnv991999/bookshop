package com.thanh.services;

import com.thanh.convert.ProductConvert;
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
        Optional<Product> prd = productRepository.findById(product.getId());
        prd.get().setImage(product.getImage());
        prd.get().setAvailable(product.isAvailable());
        prd.get().setSpecial(product.isSpecial());
        prd.get().setDiscount(product.getDiscount());
        prd.get().setQuantity(product.getQuantity());
        prd.get().setViewCount(product.getViewCount());
        prd.get().setPrice(product.getPrice());
        prd.get().setName(product.getName());
        prd.get().setDescription(product.getDescription());
        prd.get().setCategory(product.getCategory());
        Product product1=ProductConvert.prdConvert(prd);
        productRepository.save(product1);
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
