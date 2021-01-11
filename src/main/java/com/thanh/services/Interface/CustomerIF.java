package com.thanh.services.Interface;

import com.thanh.entity.Customer;

import java.util.List;
import java.util.Optional;

public interface CustomerIF {
    public List<Customer> lists();
    public Optional<Customer> findById(int id);
    public void create(Customer customer);
    public void delete(int id);
    public void update(Customer customer);
    public Customer findByUserPass(String user, String pass);
    public Customer findByUsername(String user);
}
