package com.thanh.repository;

import com.thanh.entity.Product;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProductRepository extends CrudRepository<Product,Integer> {
    @Query("select p from Product p where p.name like %?1% ")
    List<Product> getBySearch(String name);

    @Query("select p from Product p order by size(p.orderDetailLists) desc")
    List<Product>sellALot();


}