package com.thanh.convert;

import com.thanh.entity.Product;

import java.util.Optional;

public class ProductConvert {
    public static Product prdConvert(Optional<Product> optional){
        Product product = new Product();
        product.setId(optional.get().getId());
        product.setQuantity(optional.get().getQuantity());
        product.setImage(optional.get().getImage());
        product.setCategory(optional.get().getCategory());
        product.setDescription(optional.get().getDescription());
        product.setDiscount(optional.get().getDiscount());
        product.setName(optional.get().getName());
        product.setOrderDetailLists(optional.get().getOrderDetailLists());
        product.setPrice(optional.get().getPrice());
        product.setViewCount(optional.get().getViewCount());
        product.setSpecial(optional.get().isSpecial());
        product.setAvailable(optional.get().isAvailable());
        return product;
    }
}
