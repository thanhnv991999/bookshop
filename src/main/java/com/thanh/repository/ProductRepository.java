package com.thanh.repository;

import com.thanh.entity.Product;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProductRepository extends CrudRepository<Product,Integer> {
    @Query("select p from Product p where p.name like %?1% ")
    List<Product> getBySearch(String name);

    @Query("select p.category.categoryName, sum(p.quantity),sum(p.quantity * p.price) ,min (p.price),max (p.price),avg (p.price)from Product p group by p.category.categoryName")
    List<Object[]> inventory();

    @Query(nativeQuery=true,value="select p.* from products p join orderdetails o on p.id=o.productId group by o.productId order by sum(o.quantity) desc limit 6")
    List<Product>sellALot();

    @Query(nativeQuery=true,value="select * from products order by viewCount desc limit 6")
    List<Product>viewCount();

    @Query(nativeQuery=true,value="select * from products order by discount desc limit 6")
    List<Product>discount();

}